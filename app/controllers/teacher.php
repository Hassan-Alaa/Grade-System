<?php
    class teacher extends BaseController
{

        public function get_helper()
        {
            return View::make("Teacher/user_helper");
        }
    //login
    public function login()
        {
            $object_login=SignIn::get_instance();
            $return =  $object_login->User_login('teacher','Mail','password','inputmail','password','Teacher');

            return $return;

        }
 ////////////////////////////////////////////

    //Profile
    public function get_profile()
            {
                $object_profile=UserProfile::get_instance();
                $return = $object_profile->get_profile();
                return $return;
            }
    public function post_profile()
            {
                $object_profile=UserProfile::get_instance();
                $return = $object_profile->post_profile('teacher','Mail','Teacher');
                return $return;
            }

        ////////////////////////////////////////////

        //Notify->get
        public function get_make_notify($type)
        {
            $object=TeacherNotify::get_instance();
            return $object->get_make_notify($type);
        }

////////////////////////////////////////////

    public function post_make_notify($type)
    {

        $object=TeacherNotify::get_instance();

        return $object->post_make_notify($type);

    }

    public function grade_field_for_each_student($course_id)
    {
        Session::put("course_id4", $course_id);

        return View::make('teacher/grade_field_for_each_student');

    }

    public function post_grade_field_for_each_student($course_id)
    {

        $object=database::get_instance();
        $total=0;
        $views2 = DB::table('course_fields')
            ->where('course_id', '=', $course_id)
            ->orderBy('id', 'desc')
            ->distinct("field_id")
            ->groupBy("field_id")
            ->get();

        foreach($views2 as $cor)
        {

            if($cor->field_id==4)
            {
                $val = array(
                    "student_id" => Input::get("stu_id"),
                    "Grade_value_field" => Input::get("other"),
                    "course_field_id" => $cor->id,
                    "teacher_id" =>Input::get("teacher_id")
                );
                $total+=Input::get("other");
                $object->add("grade", $val);
            }
            else if($cor->field_id==5)
            {
                $val = array(
                    "student_id" => Input::get("stu_id"),
                    "Grade_value_field" => Input::get("assignment"),
                    "course_field_id" => $cor->id,
                    "teacher_id" =>Input::get("teacher_id")
                );
                $total+=Input::get("assignment");
                $object->add("grade", $val);
            }



        }
        $val2=array(

            "course_id" => $course_id,
            "student_id" =>Input::get("stu_id"),
            "total_grade" =>$total
        );
        $object->add("student_total_grade", $val2);
        return Redirect::to("teacher_grade_field_for_each_student=$course_id")->with('success', "You successfully delete Assignment number (Input::get('stu_id'))");



    }

    public function show_assi()
    {
        return View::make('Teacher/view_assignmets');
    }
    public function delete_assi($id)
    {
        $object=database::get_instance();
        $file_name=$object->view('prof_teacher_assignment','where_pluck','id','=',$id,'assignment');
        $object->upload_file('Notify_files','prof_teacher_assignment','','','delete','id',"$id",$file_name);
        return Redirect::to('view_assignmets')->with('success',"You successfully Deleted Assignment Number $id.");
    }
    public function view_set_grade($id)
    {
        Session::put('assi_id', $id);
        return View::make('Teacher/assi_grade');
    }
    public function set_grade($id)
    {
        $object=database::get_instance();
        $assi_id=$object->view('student_assignment','where_pluck','id','=',$id,'assignment_id');
        $max_grade=$object->view('prof_teacher_assignment','where_pluck','id','=',$assi_id,'grade');
        $student_grade=Input::get('grade');
        if($student_grade<=$max_grade)
        {
            $val=array('student_grade'=>$student_grade);
            $object->update('student_assignment','id',$id,$val);// $this->object->update('professor','id',$id,$val);
            return Redirect::to('student_assignment')->with('success','success');
        }
        else
            return Redirect::to('student_assignment')->with('exists','Error: grade not saved it should be less than or equal to '.$max_grade);
    }
    public function view_assi($id)
    {
        $object=database::get_instance();

        $user = $object->download_file('prof_teacher_assignment',"$id",'assignment');
        return $user;
    }


    public  function download_homework($id)
    {

        $object = database::get_instance();
        $user = $object->view("student_assignment", "where_first", 'id', '=', "$id",'');
        $name_of_file = $user->student_assignment;
        $file = public_path() . "/assets/assignment_upload/$name_of_file";
        $file_name_extension = $name_of_file;

        return Response::download($file, "$file_name_extension");


    }

}