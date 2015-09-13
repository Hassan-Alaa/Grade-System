<?php
class Administrator extends BaseController
{

    //helper

    public function get_helper()
    {
        return View::make("admin/user_helper");
    }

    //login
    public function login()
    {
        $object_login=SignIn::get_instance();
        $return =  $object_login->User_login('admin','mail','password','inputmail','password','Administrator');
        return $return;

    }
////////////////////////////////////////////
    //profile
    public function get_profile()
    {
        $object_profile=UserProfile::get_instance();
        $return = $object_profile->get_profile();
        return $return;
    }
    public function post_profile()
    {
        $object_profile=UserProfile::get_instance();
        $return = $object_profile->post_profile('admin','mail','Administrator');
        return $return;
    }

////////////////////////////////////////////
    //Admin
    public function get_add_admin()
    {
        return View::make('admin/add');
    }
    public function post_add_admin()
    {

        $object = database::get_instance();

        $input1['mail'] = Input::get('email');
        $input2['Phone'] = Input::get('Phone');
        $input3['pass'] = Input::get('pass');
        $input4['pass_confirm'] = Input::get('pass_confirm');

        if (Input::get('pass') == Input::get('pass_confirm')) {
            $rule1 = array('mail' => 'unique:admin,mail');
            $rule3 = array('mail' => 'unique:professor,Mail');
            $rule2 = array('mail' => 'unique:teacher,Mail');
            $rule4 = array('Phone' => 'unique:professor,Phone');
            $rule5 = array('Phone' => 'unique:teacher,Phone');
            $rule6 = array('Phone' => 'unique:admin,phone');

            $validator = Validator::make($input1, $rule1);
            $validator2 = Validator::make($input1, $rule2);
            $validator3 = Validator::make($input1, $rule3);
            $validator4 = Validator::make($input2, $rule4);
            $validator5 = Validator::make($input2, $rule5);
            $validator6 = Validator::make($input2, $rule6);

            if ($validator->fails() || $validator2->fails() || $validator3->fails() || $validator4->fails() || $validator5->fails() || $validator6->fails()) {

                return Redirect::to('add_admin')->with('exists', 'That email address or Phone is already registered.');
            } else {

                $val = array(
                    'name' => Input::get('name'),
                    'address' => Input::get('address'),
                    'password' => Hash::make(Input::get('pass')),
                    'birth_date' => Input::get('birth'),
                    'mail' => Input::get('email'),
                    'phone' => Input::get('Phone')
                );

                $object->add('admin', $val);

                return Redirect::to('add_admin')->with('success', 'You successfully Added Admin.');
            }
        } else {
            return Redirect::to('add_admin')->with('exists', "Password Doesn't Match.");
        }
    }

    public function get_view_admin()
    {

        return View::make('admin/view');

    }

    public function delete_admin($id)
    {

        $object = database::get_instance();

        $object->delete('admin', 'id', '=', $id);
        return Redirect::to('view_admin')->with('success', "You successfully delete admin number ($id)");
    }

    public function get_update_admin($id)
    {

        /*create the session that equal the id which need to updated*/
        Session::put('update_admin', $id);

        return View::make('admin/update');

    }
    public function post_update_admin($id)
    {


        $object = database::get_instance();

        $input1['Mail'] = Input::get('Mail');

        $input2['Phone'] = Input::get('Phone');


        $view = $object->view('admin', "where_first", 'id', '=', $id, '');


        if ($view->mail == Input::get('Mail')) {
            if ($view->phone == Input::get('Phone')) {
                $val = array(
                    'name' => Input::get('name'),
                    'address' => Input::get('address'),
                    'password' => Input::get('pass'),
                    'birth_date' => Input::get('birth'),
                    'mail' => Input::get('Mail'),
                    'phone' => Input::get('Phone')
                );

                $object->update('admin', 'id', $id, $val);

                return Redirect::to('view_admin')->with('success', "You successfully Edit admin Status Number $id");
            } else {
                $rule4 = array('Phone' => 'unique:professor,Phone');
                $rule5 = array('Phone' => 'unique:teacher,Phone');
                $rule6 = array('Phone' => 'unique:admin,phone');

                $validator4 = Validator::make($input2, $rule4);
                $validator5 = Validator::make($input2, $rule5);
                $validator6 = Validator::make($input2, $rule6);

                if ($validator4->fails() || $validator5->fails() || $validator6->fails()) {

                    return Redirect::to('view_admin')->with('exists', 'That email address or Phone is already registered.');
                } else {
                    $val = array(
                        'name' => Input::get('name'),
                        'address' => Input::get('address'),
                        'birth_date' => Input::get('birth'),
                        'mail' => Input::get('Mail'),
                        'phone' => Input::get('Phone')
                    );

                    $object->update('admin', 'id', $id, $val);

                    return Redirect::to('view_admin')->with('success', "You successfully Edit admin Status Number $id");
                }

            }
        } else {
            $rule1 = array('Mail' => 'unique:admin,mail');
            $rule3 = array('Mail' => 'unique:professor,Mail');
            $rule2 = array('Mail' => 'unique:teacher,Mail');


            $validator = Validator::make($input1, $rule1);
            $validator2 = Validator::make($input1, $rule2);
            $validator3 = Validator::make($input1, $rule3);


            if ($validator->fails() || $validator2->fails() || $validator3->fails()) {

                return Redirect::to('view_admin')->with('exists', 'That email address or Phone is already registered.');
            } else {
                $val = array(
                    'name' => Input::get('name'),
                    'address' => Input::get('address'),
                    'birth_date' => Input::get('birth'),
                    'mail' => Input::get('Mail'),
                    'phone' => Input::get('Phone')
                );

                $object->update('admin', 'id', $id, $val);

                return Redirect::to('view_admin')->with('success', "You successfully Edit admin Status Number $id");
            }

            if ($view->phone == Input::get('Phone')) {

                $val = array(
                    'name' => Input::get('name'),
                    'address' => Input::get('address'),
                    'birth_date' => Input::get('birth'),
                    'mail' => Input::get('Mail'),
                    'phone' => Input::get('Phone')
                );

                $object->update('admin', 'id', $id, $val);

                return Redirect::to('view_admin')->with('success', "You successfully Edit admin Status Number $id");
            } else {
                $rule4 = array('Phone' => 'unique:professor,Phone');
                $rule5 = array('Phone' => 'unique:teacher,Phone');
                $rule6 = array('Phone' => 'unique:admin,phone');

                $validator4 = Validator::make($input2, $rule4);
                $validator5 = Validator::make($input2, $rule5);
                $validator6 = Validator::make($input2, $rule6);

                if ($validator4->fails() || $validator5->fails() || $validator6->fails()) {

                    return Redirect::to('view_admin')->with('exists', 'That email address or Phone is already registered.');
                } else {

                    $val = array(
                        'name' => Input::get('name'),
                        'address' => Input::get('address'),
                        'birth_date' => Input::get('birth'),
                        'mail' => Input::get('Mail'),
                        'phone' => Input::get('Phone')
                    );

                    $object->update('admin', 'id', $id, $val);

                    return Redirect::to('view_admin')->with('success', "You successfully Edit admin Status Number $id");
                }

            }
            $input1['Mail'] = Input::get('Mail');

            $input2['Phone'] = Input::get('Phone');


            $view = $object->view('admin', "where_first", 'id', '=', $id, '');


            if ($view->mail == Input::get('Mail')) {
                if ($view->phone == Input::get('Phone')) {
                    $val = array(
                        'name' => Input::get('name'),
                        'address' => Input::get('address'),
                        'birth_date' => Input::get('birth'),
                        'mail' => Input::get('Mail'),
                        'phone' => Input::get('Phone')
                    );

                    $object->update('admin', 'id', $id, $val);

                    return Redirect::to('view_admin')->with('success', "You successfully Edit admin Status Number $id");
                } else {
                    $rule4 = array('Phone' => 'unique:professor,Phone');
                    $rule5 = array('Phone' => 'unique:teacher,Phone');
                    $rule6 = array('Phone' => 'unique:admin,phone');

                    $validator4 = Validator::make($input2, $rule4);
                    $validator5 = Validator::make($input2, $rule5);
                    $validator6 = Validator::make($input2, $rule6);

                    if ($validator4->fails() || $validator5->fails() || $validator6->fails()) {

                        return Redirect::to('view_admin')->with('exists', 'That email address or Phone is already registered.');
                    } else {
                        $val = array(
                            'name' => Input::get('name'),
                            'address' => Input::get('address'),
                            'birth_date' => Input::get('birth'),
                            'mail' => Input::get('Mail'),
                            'phone' => Input::get('Phone')
                        );

                        $object->update('admin', 'id', $id, $val);

                        return Redirect::to('view_admin')->with('success', "You successfully Edit admin Status Number $id");
                    }

                }
            } else {
                $rule1 = array('Mail' => 'unique:admin,mail');
                $rule3 = array('Mail' => 'unique:professor,Mail');
                $rule2 = array('Mail' => 'unique:teacher,Mail');


                $validator = Validator::make($input1, $rule1);
                $validator2 = Validator::make($input1, $rule2);
                $validator3 = Validator::make($input1, $rule3);


                if ($validator->fails() || $validator2->fails() || $validator3->fails()) {

                    return Redirect::to('view_admin')->with('exists', 'That email address or Phone is already registered.');
                } else {
                    $val = array(
                        'name' => Input::get('name'),
                        'address' => Input::get('address'),
                        'birth_date' => Input::get('birth'),
                        'mail' => Input::get('Mail'),
                        'phone' => Input::get('Phone')
                    );

                    $object->update('admin', 'id', $id, $val);

                    return Redirect::to('view_admin')->with('success', "You successfully Edit admin Status Number $id");
                }

                if ($view->phone == Input::get('Phone')) {

                    $val = array(
                        'name' => Input::get('name'),
                        'address' => Input::get('address'),
                        'birth_date' => Input::get('birth'),
                        'mail' => Input::get('Mail'),
                        'phone' => Input::get('Phone')
                    );

                    $object->update('admin', 'id', $id, $val);

                    return Redirect::to('view_admin')->with('success', "You successfully Edit admin Status Number $id");
                } else {
                    $rule4 = array('Phone' => 'unique:professor,Phone');
                    $rule5 = array('Phone' => 'unique:teacher,Phone');
                    $rule6 = array('Phone' => 'unique:admin,phone');

                    $validator4 = Validator::make($input2, $rule4);
                    $validator5 = Validator::make($input2, $rule5);
                    $validator6 = Validator::make($input2, $rule6);

                    if ($validator4->fails() || $validator5->fails() || $validator6->fails()) {

                        return Redirect::to('view_admin')->with('exists', 'That email address or Phone is already registered.');
                    } else {

                        $val = array(
                            'name' => Input::get('name'),
                            'address' => Input::get('address'),
                            'birth_date' => Input::get('birth'),
                            'mail' => Input::get('Mail'),
                            'phone' => Input::get('Phone')
                        );

                        $object->update('admin', 'id', $id, $val);

                        return Redirect::to('view_admin')->with('success', "You successfully Edit admin Status Number $id");
                    }

                }


            }

        }


    }

////////////////////////////////////////////
    //Departments
    public function get_add_department()
{
    return View::make('departments/add');
}
    public function post_add_department()
{
    $object= database::get_instance();


    $input1['name'] = Input::get('name');
    $input2['name'] = Input::get('short_name');

    $rule1 = array('name' => 'unique:department,name');
    $rule2 = array('name' => 'unique:department,shortcut_of_department');


    $validator = Validator::make($input1, $rule1);
    $validator2 = Validator::make($input2, $rule2);

    if ($validator->fails() || $validator2->fails()) {

        return Redirect::to('add_department')->with('exists', "The Department or it's shortcut already exist.");
    }
    else
    {


        $val = array(
            'name' => Input::get('name'),
            'shortcut_of_department' => Input::get('short_name')

        );

        $object->add('department', $val);

        return Redirect::to('add_department')->with('success', 'You successfully added department');
    }
}

    public function get_view_department(){

    return View::make('departments/view');

}

    public function delete_department($id){
        $object= database::get_instance();

        $object->delete('department','id','=',$id);
    return Redirect::to('view_department')->with('success',"You successfully delete department number ($id)");
}

    public function get_update_department($id){

    /*create the session that equal the id which need to updated*/
    Session::flash('update_department', $id);

    return View::make('departments/update');

}
    public function post_update_department($id){

        $object= database::get_instance();

        $val = array(
        'name' => Input::get('name'),
        'shortcut_of_department' => Input::get('short_name'),

    );

    $object->update('department','id',$id,$val);

    return Redirect::to('view_department')->with('success',"You successfully update status department number ($id)");
}

////////////////////////////////////////////
    //Courses
    public function get_add_course()
{
    return View::make('courses/add');
}
    public function post_add_course()
{
    $object= database::get_instance();

    $input1['name'] = Input::get('name');
    $input2['course_code'] = Input::get('number');

    $rule1 = array('name' => 'unique:course,name');
    $rule2 = array('course_code' => 'unique:course,course_code');

    $validator = Validator::make($input1, $rule1);
    $validator2 = Validator::make($input2, $rule2);

    if ($validator->fails() || $validator2->fails()) {

        return Redirect::to('add_course')->with('exists', "The Course or it's Code already exist.");
    }


    else {

        $department_id=Input::get('dep');
        $department = $object->view('department',"where_first",'id','=',"$department_id",'');

        if (Input::get('dep') != Null) {
            $val = array(
                'name' => Input::get('name'),
                'department' => Input::get('dep'),
                'hours' => Input::get('houre'),
                'course_type' => Input::get('type'),
                'course_code' => Input::get('number')

            );

            $object->add('course', $val);

            return Redirect::to('add_course')->with('success', 'You successfully added course');
        } else {
            return Redirect::to('add_course')->with('danger', 'You must select department');
        }
    }
}

    public function get_view_course(){

    return View::make('courses/view');

}

    public function delete_course($id){
        $object= database::get_instance();
        $object->delete('course','id','=',$id);
    return Redirect::to('view_courses')->with('success',"You successfully delete course number ($id)");
}

    public function get_update_course($id){

    /*create the session that equal the id which need to updated*/
    Session::put('update_course', $id);

    return View::make('courses/update');

}
    public function post_update_course($id){
        $object= database::get_instance();


        $val = array(
        'name' => Input::get('name'),
        'department' => Input::get('dep'),
        'hours' => Input::get('houre'),
        'course_type' => Input::get('type'),
        'course_code' =>Input::get('number')

    );

    $object->update('course','id',$id,$val);

    return Redirect::to('view_courses')->with('success',"You successfully update status course number ($id)");
}

////////////////////////////////////////////
     //Students

    public function get_student_id(){

    return View::make('Student/add_id');

}
    public function post_student_id(){

        $object= database::get_instance();


        $val = array(
        'num' => Input::get('num')
    );

    $object->update('id','id',1,$val);

    return Redirect::to('add_id')->with('success','You successfully Added ID.');

}

    public function get_add_student()
{
    return View::make('Student/add');
}
    public function post_add_student()
{
    $object= database::get_instance();

    $user2 = $object->view('id',"orderBy_pluck",'id','num','desc','');
    $user = $object->view('students',"orderBy_pluck",'id','stu_id','desc','');

    $count = $object->view('students','count','','id','','');

    if(($user-$count) == $user2) {

        $student_id=$user2+$count+1;
    }
    else {

        $student_id = $user2 + 1;
    }

    $val = array('name' => Input::get('name'),
        'Address' => Input::get('Address'),
        'Date' => Input::get('date'),
        'password' => Hash::make('123456'),
        'level' => '1',
        'Department' => 'General',
        'stu_id' => $student_id

    );

    $object->add('students', $val);





    return Redirect::to('add_student')->with('success', 'You successfully Added Student.');
}

    public function view_student(){


    return View::make('Student/view');

}

    public function delete_student($id){

        $object= database::get_instance();


        $object->delete('students','id','=',"$id");

    return Redirect::to('view_student')->with('success',"You successfully Deleted Student Number $id.");

}

    public function get_update_student($id)
{

    Session::put('key',$id);

    return View::make('Student/edit');
}
    public function post_update_student($id){

        $object= database::get_instance();


        $val = array(
        'name' => Input::get('e_name'),
        'Address' => Input::get('e_Address'),
        'Date' => Input::get('e_date')
    );

    $object->update('students','id',$id,$val);

    return Redirect::to('view_student')->with('success',"You successfully Edit Student Status Number $id");
    //

}

/////////////////////////////////////////////////
    //Teacher
    public function get_add_teacher(){

    return View::make('Teacher/add');

}
    public function post_add_teacher(){

        $object= database::get_instance();

        $input1['mail'] = Input::get('Mail');

    $input2['Phone'] = Input::get('Phone');

    $rule1 = array('mail' => 'unique:admin,mail');
    $rule3 = array('mail' => 'unique:professor,Mail');
    $rule2 = array('mail' => 'unique:teacher,Mail');
    $rule4 = array('Phone' => 'unique:professor,Phone');
    $rule5 = array('Phone' => 'unique:teacher,Phone');
    $rule6 = array('Phone' => 'unique:admin,phone');

    $validator = Validator::make($input1, $rule1);
    $validator2 = Validator::make($input1, $rule2);
    $validator3 = Validator::make($input1, $rule3);
    $validator4 = Validator::make($input2, $rule4);
    $validator5 = Validator::make($input2, $rule5);
    $validator6 = Validator::make($input2, $rule6);

    if ($validator->fails() || $validator2->fails() || $validator3->fails() || $validator4->fails() || $validator5->fails() || $validator6->fails())  {

        return Redirect::to('add_teacher')->with('exists','That email address or Phone is already registered.');
    }
    else {

        $val = array(
            'name' => Input::get('name'),
            'Address' => Input::get('Address'),
            'Date' => Input::get('date'),
            'password' => Hash::make('123456'),
            'Phone' => Input::get('Phone'),
            'Mail' => Input::get('Mail')
        );

        $object->add('teacher',$val);

        return Redirect::to('add_teacher')->with('success','You successfully Added Teacher.');

    }
}

    public function get_view_teacher(){


    return View::make('Teacher/view');

}

    public function delete_teacher($id){
        $object= database::get_instance();

        $object->delete('teacher','id','=',"$id");

    return Redirect::to('view_teacher')->with('success',"You successfully Deleted Teacher Number $id.");

}

    public function get_update_teacher($id)
{

    Session::put('key',$id);

    return View::make('Teacher/edit');
}
    public function post_update_teacher($id){

        $object= database::get_instance();


        $input1['Mail'] = Input::get('e_mail');

    $input2['Phone'] = Input::get('e_phone');


    $view = $object->view('teacher',"where_first",'id','=',$id,'');


    if($view->Mail == Input::get('e_mail') )
    {
        if( $view->Phone == Input::get('e_phone'))
        {
            $val = array(
                'name' => Input::get('e_name'),
                'Address' => Input::get('e_Address'),
                'phone' => Input::get('e_phone'),
                'Mail' => Input::get('e_mail')
            );

            $object->update('teacher','id',$id,$val);

            return Redirect::to('view_teacher')->with('success',"You successfully Edit Teacher Status Number $id");
        }
        else{
            $rule4 = array('Phone' => 'unique:professor,Phone');
            $rule5 = array('Phone' => 'unique:teacher,Phone');
            $rule6 = array('Phone' => 'unique:admin,phone');

            $validator4 = Validator::make($input2, $rule4);
            $validator5 = Validator::make($input2, $rule5);
            $validator6 = Validator::make($input2, $rule6);

            if ( $validator4->fails() || $validator5->fails() || $validator6->fails()) {

                return Redirect::to('view_teacher')->with('exists', 'That email address or Phone is already registered.');
            }
            else {
                $val = array(
                    'name' => Input::get('e_name'),
                    'Address' => Input::get('e_Address'),
                    'phone' => Input::get('e_phone'),
                    'Mail' => Input::get('e_mail')
                );

                $object->update('teacher','id',$id,$val);

                return Redirect::to('view_teacher')->with('success',"You successfully Edit Teacher Status Number $id");
            }

        }
    }

    else{
        $rule1 = array('Mail' => 'unique:admin,mail');
        $rule3 = array('Mail' => 'unique:professor,Mail');
        $rule2 = array('Mail' => 'unique:teacher,Mail');


        $validator = Validator::make($input1, $rule1);
        $validator2 = Validator::make($input1, $rule2);
        $validator3 = Validator::make($input1, $rule3);



        if ($validator->fails() || $validator2->fails() || $validator3->fails() ) {

            return Redirect::to('view_teacher')->with('exists', 'That email address or Phone is already registered.');
        }
        else {
            $val = array(
                'name' => Input::get('e_name'),
                'Address' => Input::get('e_Address'),
                'phone' => Input::get('e_phone'),
                'mail' => Input::get('e_mail')
            );

            $object->update('teacher','id',$id,$val);

            return Redirect::to('view_teacher')->with('success',"You successfully Edit Teacher Status Number $id");
        }

        if( $view->Phone == Input::get('e_phone'))
        {

            $val = array(
                'name' => Input::get('e_name'),
                'Address' => Input::get('e_Address'),
                'phone' => Input::get('e_phone'),
                'Mail' => Input::get('e_mail')
            );

            $object->update('teacher','id',$id,$val);

            return Redirect::to('view_teacher')->with('success',"You successfully Edit Teacher Status Number $id");
        }
        else{
            $rule4 = array('Phone' => 'unique:professor,Phone');
            $rule5 = array('Phone' => 'unique:teacher,Phone');
            $rule6 = array('Phone' => 'unique:admin,phone');

            $validator4 = Validator::make($input2, $rule4);
            $validator5 = Validator::make($input2, $rule5);
            $validator6 = Validator::make($input2, $rule6);

            if ( $validator4->fails() || $validator5->fails() || $validator6->fails()) {

                return Redirect::to('view_teacher')->with('exists', 'That email address or Phone is already registered.');
            }
            else {

                $val = array(
                    'name' => Input::get('e_name'),
                    'Address' => Input::get('e_Address'),
                    'phone' => Input::get('e_phone'),
                    'mail' => Input::get('e_mail')
                );

                $object->update('teacher','id',$id,$val);

                return Redirect::to('view_teacher')->with('success',"You successfully Edit Teacher Status Number $id");
            }

        }


    }

}

/////////////////////////////////////////////////
    //Professor
    public function get_add_professor(){

    return View::make('Professor/add');

}
    public function post_add_professor(){

        $object= database::get_instance();

    $input1['Mail'] = Input::get('Mail');

    $input2['Phone'] = Input::get('Phone');

    $rule1 = array('mail' => 'unique:admin,mail');
    $rule3 = array('mail' => 'unique:professor,Mail');
    $rule2 = array('mail' => 'unique:teacher,Mail');
    $rule4 = array('Phone' => 'unique:professor,Phone');
    $rule5 = array('Phone' => 'unique:teacher,Phone');
    $rule6 = array('Phone' => 'unique:admin,phone');

    $validator = Validator::make($input1, $rule1);
    $validator2 = Validator::make($input1, $rule2);
    $validator3 = Validator::make($input1, $rule3);
    $validator4 = Validator::make($input2, $rule4);
    $validator5 = Validator::make($input2, $rule5);
    $validator6 = Validator::make($input2, $rule6);

    if ($validator->fails() || $validator2->fails() || $validator3->fails() || $validator4->fails() || $validator5->fails() || $validator6->fails())  {

        return Redirect::to('add_prof')->with('exists','That email address or Phone is already registered.');
    }
    else {


        $val = array(
            'name' => Input::get('name'),
            'Address' => Input::get('Address'),
            'Date' => Input::get('date'),
            'password' => Hash::make('123456'),
            'Phone' => Input::get('Phone'),
            'Mail' => Input::get('Mail')
        );

        $object->add('professor',$val);

        return Redirect::to('add_prof')->with('success','You successfully Added Professor.');

    }
}

    public function get_view_professor(){


    return View::make('Professor/view');

}

    public function delete_professor($id){

        $object= database::get_instance();

    $object->delete('professor','id','=',"$id");

    return Redirect::to('view_prof')->with('success',"You successfully Deleted Professor Number $id.");

}

    public function get_update_professor($id)
{

    Session::put('key',$id);

    return View::make('Professor/edit');
}
    public function post_update_professor($id){


        $object= database::get_instance();
        $input1['Mail'] = Input::get('e_mail');

        $input2['Phone'] = Input::get('e_phone');


        $view = $object->view('professor',"where_first",'id','=',$id,'');


        if($view->Mail == Input::get('e_mail') )
        {
            if( $view->Phone == Input::get('e_phone'))
            {
                $val = array(
                    'name' => Input::get('e_name'),
                    'Address' => Input::get('e_Address'),
                    'phone' => Input::get('e_phone'),
                    'Mail' => Input::get('e_mail')
                );

                $object->update('professor','id',$id,$val);

                return Redirect::to('view_prof')->with('success',"You successfully Edit professor Status Number $id");
            }
            else{
                $rule4 = array('Phone' => 'unique:professor,Phone');
                $rule5 = array('Phone' => 'unique:teacher,Phone');
                $rule6 = array('Phone' => 'unique:admin,phone');

                $validator4 = Validator::make($input2, $rule4);
                $validator5 = Validator::make($input2, $rule5);
                $validator6 = Validator::make($input2, $rule6);

                if ( $validator4->fails() || $validator5->fails() || $validator6->fails()) {

                    return Redirect::to('view_prof')->with('exists', 'That email address or Phone is already registered.');
                }
                else {
                    $val = array(
                        'name' => Input::get('e_name'),
                        'Address' => Input::get('e_Address'),
                        'phone' => Input::get('e_phone'),
                        'Mail' => Input::get('e_mail')
                    );

                    $object->update('professor','id',$id,$val);

                    return Redirect::to('view_prof')->with('success',"You successfully Edit professor Status Number $id");
                }

            }
        }

        else{
            $rule1 = array('Mail' => 'unique:admin,mail');
            $rule3 = array('Mail' => 'unique:professor,Mail');
            $rule2 = array('Mail' => 'unique:teacher,Mail');


            $validator = Validator::make($input1, $rule1);
            $validator2 = Validator::make($input1, $rule2);
            $validator3 = Validator::make($input1, $rule3);



            if ($validator->fails() || $validator2->fails() || $validator3->fails() ) {

                return Redirect::to('view_prof')->with('exists', 'That email address or Phone is already registered.');
            }
            else {
                $val = array(
                    'name' => Input::get('e_name'),
                    'Address' => Input::get('e_Address'),
                    'phone' => Input::get('e_phone'),
                    'mail' => Input::get('e_mail')
                );

                $object->update('professor','id',$id,$val);

                return Redirect::to('view_prof')->with('success',"You successfully Edit professor Status Number $id");
            }

            if( $view->Phone == Input::get('e_phone'))
            {

                $val = array(
                    'name' => Input::get('e_name'),
                    'Address' => Input::get('e_Address'),
                    'phone' => Input::get('e_phone'),
                    'Mail' => Input::get('e_mail')
                );

                $object->update('professor','id',$id,$val);

                return Redirect::to('view_prof')->with('success',"You successfully Edit professor Status Number $id");
            }
            else{
                $rule4 = array('Phone' => 'unique:professor,Phone');
                $rule5 = array('Phone' => 'unique:teacher,Phone');
                $rule6 = array('Phone' => 'unique:admin,phone');

                $validator4 = Validator::make($input2, $rule4);
                $validator5 = Validator::make($input2, $rule5);
                $validator6 = Validator::make($input2, $rule6);

                if ( $validator4->fails() || $validator5->fails() || $validator6->fails()) {

                    return Redirect::to('view_prof')->with('exists', 'That email address or Phone is already registered.');
                }
                else {

                    $val = array(
                        'name' => Input::get('e_name'),
                        'Address' => Input::get('e_Address'),
                        'phone' => Input::get('e_phone'),
                        'mail' => Input::get('e_mail')
                    );

                    $object->update('professor','id',$id,$val);

                    return Redirect::to('view_prof')->with('success',"You successfully Edit professor Status Number $id");
                }

            }


    }

}

/////////////////////////////////////////////////
    //Slider
    public function get_add_slider()
{
    return View::make('slider/add');
}
    public function post_add_slider()
{

    $object= database::get_instance();

    $add_slider=$object->upload_file('images','slider','upload','name','add','','','');

    if ($add_slider) {
        return Redirect::to('add_slider')->with('success', 'You successfully Added image in home page slider.');
    }
    else{
        return Redirect::to('add_slider')->with('exists','Please Select an Image');
    }


}

    public function view_slider(){


    return View::make('slider/view');

}

    public function delete_slider($id){

        $object= database::get_instance();

        $image_name=$object->view('slider','where_pluck','id','=',$id,'name');

    $object->upload_file('images','slider','','','delete','id',"$id",$image_name);


    return Redirect::to('view_slider')->with('success',"You successfully Deleted Image Number $id.");

}

    public function get_update_slider($id){

    /*create the session that equal the id which need to updated*/
    Session::put('update_slider', $id);

    return View::make('slider/update');

}
    public function post_update_slider($id){
        $object= database::get_instance();

        $image_name=$object->view('slider','where_pluck','id','=',$id,'name');
        $object->upload_file('images','slider','upload','name','update','id',"$id",$image_name);


    return Redirect::to('view_slider')->with('exists','something went Wrong');
}

//////////////////////////////////////////////////////////

    public  function deadline()
    {

        return View::make('admin/deadline');

    }

    public function post_deadline()
    {
        $val = array(

            'date' => Input::get('date'),
            'time' => Input::get('time')

        );

        $object = database::get_instance();
        $object->add('deadline',$val);

        return Redirect::to('deadline')->with('success','You Successfully add deadline');


    }


    public function view_deadline()
    {
        return View::make('admin/view_deadline');

    }


    public function get_update_deadline($id)
    {
        Session::put('update_deadline',$id);

        return View::make('admin/edit_deadline');

    }
    public function post_update_deadline($id)
    {
        $object = database::get_instance();
        $val = array(

            'date' => Input::get('date'),
            'time' => Input::get('time')

        );

        $object->update('deadline','id',$id,$val);

        return Redirect::to('view_deadline')->with('success','You Successfully update deadline');

    }

}