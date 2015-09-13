<?php
class student extends BaseController
{
    public function get_helper()
    {
        return View::make("Student/user_helper");
    }

////////////////////////////////////////////

    //login
    public function login()
    {
        $object_login=SignIn::get_instance();
        $return =  $object_login->User_login('students','stu_id','password','inputid','password','Student');

        return $return;

    }
////////////////////////////////////////////

    //RegisterCourse
    public function get_view_register(){


        return View::make('Student/view_registers');


    }
    public function get_register_course(){


        return View::make('Student/register_course');


    }
    public function post_register_course(){

        $object = database::get_instance();
            $name = Input::get('select');

            $count = count($name);

            if ($count > 6 || $count <3) {
                return Redirect::to('register_course')->with('exists', 'You have to choose only 6 Courses');
            } else {
                $users = DB::table('users_login')
                    ->orderBy('id', 'desc')->first();
                $stu_id = $users->user_session;
                $student_id = $object->view('students', "where_pluck", 'stu_id', '=', $stu_id, 'id');

                DB::table('register_course_section')->where('student_id', '=', $student_id)->delete();

                if (is_array($name)) {
                    foreach ($name as $check) {
                        $values = array($check);

                        $users = DB::table('prof_course')->whereIn('id', $values)->get();

                        foreach ($users as $user) {

                            $course_id = $object->view('prof_course', "where_pluck", 'id', '=', "$user->id", 'course_id');


                            $val = array(
                                'student_id' => $student_id,
                                'course_id' => $course_id,
                                'sub_teacher_id' => Null
                            );

                            $object->add('register_course_section', $val);

                        }


                    }
                }
            }

        return Redirect::to('teacher_select');
    }
////////////////////////////////////////////

    //TeacherSelect
    public function get_select_teacher()
    {


        return View::make('Student/teacher');

    }
    public function post_select_teacher(){
        $object = database::get_instance();
        $name = Input::get('select_teacher');

        if(is_array($name)) {

            foreach ($name as $check) {
                $values = array($check);

                $users = DB::table('sub_teacher')->whereIn('id', $values)->get();

                foreach ($users as $user) {

                    $sub_teacher_id = $object->view('sub_teacher', "where_pluck", 'id', '=', "$user->id", 'id');
                    $course_id_1 = $object->view('prof_course', "where_pluck", 'id', '=', "$user->prof_course_id", 'course_id');
                    $course_id_2 = $object->view('register_course_section', "where_pluck", 'course_id', '=', "$course_id_1", 'course_id');
                    $users = DB::table('users_login')
                        ->orderBy('id', 'desc')->first();
                    $stu_id = $users->user_session;
                    $student_id=$object->view('students',"where_pluck",'stu_id','=',$stu_id,'id');
                    $val = array(
                        'sub_teacher_id' => $sub_teacher_id
                    );

                    DB::table('register_course_section')
                        ->where('student_id', $student_id)
                        ->where('course_id', $course_id_2)
                        ->update($val);
                }
            }
        }
        return Redirect::to('teacher_select')->with('success','You successfully Register Course');

    }
////////////////////////////////////////////

    //Profile
    public function get_profile()
    {
        $object_profile=StudentProfile::get_instance();
        $return = $object_profile->get_profile();
        return $return;
    }
    public function post_profile()
    {
        $object_profile=StudentProfile::get_instance();
        $return = $object_profile->post_profile('students','stu_id','Student');
        return $return;
    }

    public function get_view_student_assignment($course_id)
    {
        Session::put("course_id",$course_id);

        return View::make('Student/view_assignments');

    }
    public function download_assignment($id)
    {

        $download = database::get_instance();

        $user = $download->download_file('prof_teacher_assignment',"$id",'assignment');

        return $user;
    }

    public function upload_solution($id)
    {
        $object = database::get_instance();


        $users = DB::table('users_login')
                     ->orderBy('id', 'desc')->first();
        $stu_id = $users->user_session;
        $student_id = $object->view('students', "where_pluck", 'stu_id', '=', $stu_id, 'id');

        $ass_id = Input::get('assignment_id');


        $file            = Input::file('upload_assignment');
        $destinationPath = "/wamp/www/GradeSystem/public/assets/assignment_upload";
        $filename        = str_random(6) . '_' . $file->getClientOriginalName();
        $uploadSuccess   = $file->move($destinationPath, $filename);



            $val = array(

                'student_id' => $student_id,
                'assignment_id' => $ass_id,
                'student_assignment' => $filename

            );

            $object->add('student_assignment', $val);



         return Redirect::to("view_student_assignment=".$id)->with('success', 'You successfully upload assignment.');




    }

    public function View_grade()
    {

        return View::make('Student/View_grade');
    }



}