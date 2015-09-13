<?php



class MakeNotify extends BaseController implements Notify
{

    static public function get_instance()
    {

        return new MakeNotify();
    }

    public function get_make_notify($type)
    {
        Session::put('post',$type);
        return View::make('professors/make_notify');
    }

    public  function post_make_notify($type)
    {
        $object=database::get_instance();

        $data = [ 'msg' => Input::get('des') ];
        $table=Input::get('choose');
        $col='';
        $count=0;

        Session::put("key",$type);

        if($table=="teacher")
        {
            $col='Mail';
        }
        else
        {
            $col='mail';
        }

        if($table == "students") {
            $count = DB::table('register_course_section')->where('course_id', '=', Input::get('courses'))->count('student_id');
        }
        else
        {
            $teacher_id = $object->view("prof_course","where_get","course_id","=",Input::get('courses'),'');

            foreach($teacher_id as $teacher)
            {
                $count = DB::table('sub_teacher')->where('prof_course_id','=',$teacher->id)->count('teacher_id');
            }
        }

        $array=array();
        for($i=0;$i<$count;$i++)
        {
            if($object->view("$table",'where_pluck','id','=',($i+1),$col))
                $array[$i] = $object->view("$table",'where_pluck','id','=',($i+1),$col);
        }
        Mail::queueOn('mail','emails.mailer',$data, function($message) use ($array)
        {

            $file            = Input::file('upload');
            $destinationPath = "/wamp/www/GradeSystem/public/assets/Notify_files";
            $filename        = str_random(6) . '_' . $file->getClientOriginalName();
            $uploadSuccess   = $file->move($destinationPath, $filename);
            $subject = Input::get('subject');
            $description = Input::get('des');

            if(Session::get("key")=="assignment")
            {
                $val = array(

                    "course_id" => Input::get('courses'),
                    "teacher_id" => NULL,
                    "grade" => Input::get('grade'),
                    "deadline" => Input::get('deadline'),
                    "assignment" => $filename,
                    "assignment_name" => $subject,
                    "description" => $description

                );
                $o=database::get_instance();
                $o->add("prof_teacher_assignment",$val);
            }


            $message->to($array)->subject($subject);
            $message->attach("$destinationPath/$filename");
        });

        return Redirect::to('make_notify='.$type)->with('success','You Successfully Notify all Your '."$table");
    }


}
?>