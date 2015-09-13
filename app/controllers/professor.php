<?php
class professor extends BaseController
{

    public function get_helper()
    {
        return View::make("professors/user_helper");
    }

////////////////////////////////////////////

    //login
    public function login()
    {
        $object_login = SignIn::get_instance();
        $return = $object_login->User_login('professor', 'Mail', 'password', 'inputmail', 'password', 'Professor');

        return $return;

    }
////////////////////////////////////////////

    //Profile
    public function get_profile()
    {
        $object_profile = UserProfile::get_instance();
        $return = $object_profile->get_profile();
        return $return;
    }

    public function post_profile()
    {
        $object_profile = UserProfile::get_instance();
        $return = $object_profile->post_profile('professor', 'Mail', 'Professor');
        return $return;
    }
////////////////////////////////////////////

    //Get,Post->Register_First
    public function get_register_course_first()
    {
        return View::make('professors/register_course_first');
    }

    public function post_register_course_first()
    {
        $object = database::get_instance();

        $input1['courses'] = Input::get('courses');


        $rule1 = array('courses' => 'unique:prof_course,course_id');


        $validator = Validator::make($input1, $rule1);


        if ($validator->fails()) {

            return Redirect::to('register_courses_first_step')->with('exists', 'That Course is already registered.');
        } else {


            $val = array(
                'prof_id' => Input::get('prof_id'),
                'course_id' => Input::get('courses')

            );
            $object->add('prof_course', $val);

            $co = Input::get('courses');

            return Redirect::to("register_courses_second_step=add=$co=0")->with('success', 'You successfully registered Course .');

        }
    }
////////////////////////////////////////////

    //Get,Post->Register_Second
    public function get_register_course_second($type, $id, $id2)
    {
        Session::put('kind', $type);
        Session::put('field_id', $id2);
        Session::put('course_id', $id);

        return View::make('professors/register_course_second');
    }

    public function post_add_register_course_second($type, $id, $id2)
    {
        Session::put('kind', $type);
        Session::put('field_id', $id2);
        Session::put('course_id', $id);

        return View::make('professors/register_course_second');
    }

    public function post_register_course_second($type, $id, $id2)
    {
        $object = database::get_instance();
        $val = array(
            'value' => Input::get('value_field'),
            'course_id' => $id,

            'field_id' => $id2

        );
        $object->add('course_fields', $val);


        return Redirect::to("register_courses_second_step=$type=$id=0")->with('success', 'You successfully add value in field for This Course .');

    }
////////////////////////////////////////////

    //Get,Post->Register_third
    public function get_register_course_third($course_id)
    {
        Session::put('course', $course_id);

        return View::make('professors/register_course_third');
    }

    public function post_register_course_third($course_id)
    {

        return Redirect::to("register_courses_third_step=$course_id");
    }
////////////////////////////////////////////

    //Post->Register_third2
    public function post_register_course_third2($course_id)
    {
        $object = database::get_instance();
        $choose = Input::get('choose_teacher');
        $prof_course_id = Input::get('prof_id');

        $object->delete("sub_teacher", 'prof_course_id', '=', $prof_course_id);

        if (is_array($choose)) {
            foreach ($choose as $choose_teacher) {
                $val = array
                (
                    'prof_course_id' => $prof_course_id,
                    'teacher_id' => $choose_teacher
                );

                $object->add('sub_teacher', $val);

            }
        }
        return Redirect::to("register_courses_first_step")->with('success', 'You successfully Registerd Course');
    }
////////////////////////////////////////////

    //View->Register_Course
    public function get_view_register_course()
    {
        return View::make('professors/view_register_course');
    }
////////////////////////////////////////////

    //View->Course_fields
    public function view_course_fields($course_id)
    {

        Session::put('view_course_fields', $course_id);
        return View::make('professors/view_register_course_fields');
    }
////////////////////////////////////////////

    //View->Course_teachers
    public function view_course_teachers($course_id)
    {
        Session::put('view_course_teachers', $course_id);

        return View::make('professors/view_register_course_teachers');
    }
////////////////////////////////////////////

    //Delete->Register_Course
    public function delete_register_course($course_id)
    {
        $object = database::get_instance();

        $object->delete('prof_course', 'course_id', '=', $course_id);
        $object->delete('course_fields', 'course_id', '=', $course_id);
        return Redirect::to('view_register_courses')->with('success', "You successfully delete Course number ($course_id)");
    }
////////////////////////////////////////////

    //Delete->Register_Course_fields
    public function delete_register_course_field($course_id, $field_id)
    {
        $object = database::get_instance();

        $object->delete('course_fields', 'field_id', '=', $field_id);
        return Redirect::to("view_course_fields=$course_id")->with('success', "You successfully delete Fiels number ($field_id)");
    }

////////////////////////////////////////////

    //Notify->get
    public function get_make_notify($type)
    {
        $object=MakeNotify::get_instance();
         return $object->get_make_notify($type);
    }

////////////////////////////////////////////

    public function post_make_notify($type)
    {

        $object=MakeNotify::get_instance();

        return $object->post_make_notify($type);

    }

    public function get_view_prof_assignment($course_id)
    {
        Session::put("course_id", $course_id);

        return View::make('professors/view_assignments');

    }

    public function post_delete_prof_assignment($course_id, $ass_id)
    {

        $object = database::get_instance();
        $object->delete("prof_teacher_assignment", "id", "=", "$ass_id");
        return Redirect::to("view_prof_assignment=$course_id")->with('success', "You successfully delete Assignment number ($ass_id)");

    }

    public function get_download_assignment($ass_id)
    {


        $view = database::get_instance();

        $user = $view->download_file('prof_teacher_assignment', "$ass_id", 'assignment');

        return $user;


    }

    public function get_upload_download_assignment($ass_id)
    {


        $object = database::get_instance();
        $user = $object->view("student_assignment", "where_first", 'id', '=', "$ass_id",'');
        $name_of_file = $user->student_assignment;
        $file = public_path() . "/assets/assignment_upload/$name_of_file";
        $file_name_extension = $name_of_file;

        return Response::download($file, "$file_name_extension");

    }

    public function view_uploaded_assignment($course_id)
    {

        Session::put("course_id2", $course_id);


        return View::make('professors/view_uploaded_assignments');


    }

    public function set_assignment_grade()
    {
        $object=database::get_instance();
        $stu_id = Input::get("stu_id");
        $grade = Input::get("grade");

            $val=array("student_grade" => $grade);
                    DB::table('student_assignment')->where('student_id', $stu_id)->update($val);


                return Redirect::to("view_uploaded_assignment=2")->with('success', "You successfully delete Assignment number ($stu_id)");

    }

    public function grade_field_for_each_student($course_id)
    {
        Session::put("course_id3", $course_id);

        return View::make('professors/grade_field_for_each_student');

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
                if($cor->field_id==1)
                {
                    $val=array(
                        "student_id" =>Input::get("stu_id"),
                        "Grade_value_field" =>Input::get("final"),
                        "course_field_id" => $cor->id
                    );
                    $total+=Input::get("final");
                    $object->add("grade",$val);
                }
                else if($cor->field_id==2)
                {
                    $val=array(
                        "student_id" =>Input::get("stu_id"),
                        "Grade_value_field" =>Input::get("miedterm"),
                        "course_field_id" => $cor->id
                    );
                    $total+=Input::get("miedterm");
                    $object->add("grade",$val);
                }
                else if($cor->field_id==3)
                {
                    $val = array(
                        "student_id" => Input::get("stu_id"),
                        "Grade_value_field" => Input::get("project"),
                        "course_field_id" => $cor->id
                    );
                    $total+=Input::get("project");
                    $object->add("grade", $val);
                }
                else if($cor->field_id==4)
                {
                    $val = array(
                        "student_id" => Input::get("stu_id"),
                        "Grade_value_field" => Input::get("other"),
                        "course_field_id" => $cor->id
                    );
                    $total+=Input::get("other");
                    $object->add("grade", $val);
                }
                else if($cor->field_id==5)
                {
                    $val = array(
                        "student_id" => Input::get("stu_id"),
                        "Grade_value_field" => Input::get("assignment"),
                        "course_field_id" => $cor->id
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
        return Redirect::to("grade_field_for_each_student=$course_id")->with('success', "You successfully delete Assignment number (Input::get('stu_id'))");



    }

}