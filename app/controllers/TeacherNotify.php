<?php

class TeacherNotify extends BaseController implements Notify{

    static public function get_instance()
    {

        return new TeacherNotify();
    }

    public function get_make_notify($type)
    {
        Session::put('post',$type);
        return View::make('teacher/make_notify');
    }

    public  function post_make_notify($type)
    {
        $object=database::get_instance();

        $data = [ 'msg' => Input::get('des') ];
        $table=Input::get('choose');
        $col='';
        $count=0;

        Session::put("key",$type);

         $col='mail';

            $count = DB::table('register_course_section')->where('course_id', '=', Input::get('courses'))->count('student_id');



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
                    "teacher_id" => Input::get('teacher_id'),
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

        return Redirect::to('make_teacher_notify='.$type)->with('success','You Successfully Notify all Your '."$table");
    }
}

?>