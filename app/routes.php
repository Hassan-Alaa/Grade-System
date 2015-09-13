<?php
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

    Route::get('/', function()
    {

        if (Auth::check()) {
            // The user is logged in...
            return View::make('main/home_page');
        }else {

            return View::make('main/login');
        }



    });





// =============================================
// CATCH ALL ROUTE =============================
// =============================================
// all routes that are not home or api will be redirected to the frontend
// this allows angular to route them

App::missing(function($exception)
{
    return View::make('404');
});





Route::get('index={id}', function($id)
{

    Session::put('random',$id);
        return View::make('main/home_page');

});


    Route::get('/login={id}',function($id){

        if($id=='Administrator') {

            Session::put('type', $id);

        }
        else if($id=='Professor')
        {
            Session::put('type', $id);
        }
        else if($id=='Teacher')
        {
            Session::put('type', $id);

        }
        else if($id=='Student')
        {
            Session::put('type', $id);

        }


        if (Auth::check()) {
            // The user is logged in...
            return View::make('main/home_page');
        }else {

            return View::make('main/login');
        }


    });

    Route::get('logout',function(){

        sleep(5);
        Session::flush();
        Auth::logout();
        return Redirect::intended('/');
    });


    Route::post('/login=Administrator','Administrator@login');
    Route::post('/login=Professor','Professor@login');
    Route::post('/login=Teacher','teacher@login');
    Route::post('/login=Student','student@login');


/////////////////////////////////////////////////
    //Administrator
    Route::get('add_admin',"Administrator@get_add_admin");
    Route::Post('add_admin', "Administrator@post_add_admin");

    Route::get('view_admin',"Administrator@get_view_admin");

    Route::get('delete_admin={id}',"Administrator@delete_admin");

    Route::get('update_admin={id}',"Administrator@get_update_admin");
    Route::post('update_admin={id}',"post_update_admin");

/////////////////////////////////////////////////
    //departments
    Route::get('add_department',"Administrator@get_add_department");
    Route::Post('add_department',"Administrator@post_add_department");

    Route::get('view_department',"Administrator@get_view_department");

    Route::get('delete_department={id}',"Administrator@delete_department");

    Route::get('update_department={id}',"Administrator@get_update_department");
    Route::post('update_department={id}',"Administrator@post_update_department");

/////////////////////////////////////////////////
    //Courses
    Route::get('add_course',"Administrator@get_add_course");
    Route::Post('add_course',"Administrator@post_add_course");

    Route::get('view_courses',"Administrator@get_view_course");

    Route::get('delete_course={id}',"Administrator@delete_course");

    Route::get('update_course={id}',"Administrator@get_update_course");
    Route::post('update_course={id}',"Administrator@post_update_course");

////////////////////////////   Student  //////////////////////////////////////
    //Student
    Route::get('add_id',"Administrator@get_student_id");
    Route::post('Add_ID',"Administrator@post_student_id");

    Route::get('add_student', "Administrator@get_add_student");
    Route::Post('add_student', "Administrator@post_add_student");

    Route::get('view_student',"Administrator@view_student");

    Route::get('delete_student={id}',"Administrator@delete_student");

    Route::get('edit_student={id}',"Administrator@get_update_student");
    Route::post('edit_student={id}',"Administrator@post_update_student");

/////////////////////////////////////////////////
    //Teacher
    Route::get('add_teacher',"Administrator@get_add_teacher");
    Route::post('add_teacher',"Administrator@post_add_teacher");

    Route::get('view_teacher',"Administrator@get_view_teacher");

    Route::get('delete_teacher={id}',"Administrator@delete_teacher");

    Route::get('edit_teacher={id}',"Administrator@get_update_teacher");
    Route::post('edit_teacher={id}',"Administrator@post_update_teacher");

/////////////////////////////////////////////////
    //Professor
    Route::get('add_prof',"Administrator@get_add_professor");
    Route::post('add_prof',"Administrator@post_add_professor");

    Route::get('view_prof',"Administrator@get_view_professor");

    Route::get('delete_prof={id}',"Administrator@delete_professor");

    Route::get('edit_prof={id}',"Administrator@get_update_professor");
    Route::post('edit_prof={id}',"Administrator@post_update_professor");

/////////////////////////////////////////////////
    //Slider
    Route::get('add_slider', "Administrator@get_add_slider");
    Route::post('add_slider', "Administrator@post_add_slider");

    Route::get('view_slider',"Administrator@view_slider");

    Route::get('delete_slider={id}',"Administrator@delete_slider");

    Route::get('update_slider={id}',"Administrator@get_update_slider");
    Route::post('update_slider={id}',"Administrator@post_update_slider");

///////////////////////////////////////////////////////////////////////////

    Route::get('register_courses_first_step','professor@get_register_course_first');
    Route::post('register_courses_first_step','professor@post_register_course_first');

    Route::get('register_courses_second_step={type}={id}={id2}','professor@get_register_course_second');
    Route::post('post_add_register_course_second={type}={id}={id2}','professor@get_register_course_second');
    Route::post('register_courses_second_step={type}={id}={id2}','professor@post_register_course_second');

    Route::post('register_courses_third_step={course_id}','professor@post_register_course_third');
    Route::post('register_courses_third_step2={course_id}','professor@post_register_course_third2');
    Route::get('register_courses_third_step={course_id}','professor@get_register_course_third');

    Route::get('view_register_courses','professor@get_view_register_course');
    Route::get('view_course_fields={course_id}','professor@view_course_fields');
    Route::get('view_course_teachers={course_id}','professor@view_course_teachers');
    Route::get('delete_register_course={course_id}','professor@delete_register_course');
    Route::get('delete_register_course_field={course_id}={field_id}','professor@delete_register_course_field');

    Route::get('make_notify={type}','professor@get_make_notify');
    Route::post('make_notify={type}','professor@post_make_notify');

    Route::get('grade_field_for_each_student={course_id}','professor@grade_field_for_each_student');
    Route::post('grade_field_for_each_student={course_id}','professor@post_grade_field_for_each_student');

    Route::get('view_prof_assignment={course_id}','professor@get_view_prof_assignment');
    Route::post('delete_assignment={course_id}={ass_id}','professor@post_delete_prof_assignment');
    Route::get('view_uploaded_assignment={course_id}','professor@view_uploaded_assignment');
    Route::get('dawn_load_assignment={ass_id}','professor@get_download_assignment');
    Route::get('upload_dawnload_assignment={ass_id}','professor@get_upload_download_assignment');
    Route::post('set_grade','professor@set_assignment_grade');

//////////////////////////////////////////////////////////////////////////////////////////////////////////

    Route::get('register_course','student@get_register_course');
    Route::post('register_course','student@post_register_course');
    Route::get('teacher_select','student@get_select_teacher');
    Route::post('teacher_select','student@post_select_teacher');

    Route::get('view_registers','student@get_view_register');


    Route::post('update_course_registered','student@get_register_course');
    Route::Post('register_course','student@post_register_course');

    Route::get('view_student_assignment={course_id}','student@get_view_student_assignment');
    Route::post('view_student_assignment={course_id}','student@upload_solution');

    Route::get('download_assignment={id}','student@download_assignment');
    Route::get('View_grade','student@View_grade');

    Route::get('deadline','Administrator@deadline');
    Route::post('post_deadline','Administrator@post_deadline');

    Route::get('view_deadline','Administrator@view_deadline');

    Route::get('update_deadline={id}','Administrator@get_update_deadline');
    Route::post('update_deadline_course={id}','Administrator@post_update_deadline');


///////////////////////////////////////////////////////////////////////////////////////////////////////

    Route::get('profile=Student','student@get_profile');
    Route::post('profile=Student','student@post_profile');

    Route::get('profile=Administrator','Administrator@get_profile');
    Route::post('profile=Administrator','Administrator@post_profile');

    Route::get('profile=Professor','professor@get_profile');
    Route::post('profile=Professor','professor@post_profile');

    Route::get('profile=Teacher','teacher@get_profile');
    Route::post('profile=Teacher','teacher@post_profile');

//////////////////////////////////////////////////////////////////////

Route::get('make_teacher_notify={type}','teacher@get_make_notify');
Route::post('make_teacher_notify={type}','teacher@post_make_notify');

Route::get('teacher_grade_field_for_each_student={course_id}','teacher@grade_field_for_each_student');
Route::post('teacher_grade_field_for_each_student={course_id}','teacher@post_grade_field_for_each_student');

///////////////////////////////////////////////////////////////////////////////////////////////////////////////




Route::get('user_helper_admin','administrator@get_helper');
Route::get('user_helper_student','student@get_helper');
Route::get('user_helper_teacher','teacher@get_helper');
Route::get('user_helper_professor','professor@get_helper');


Route::get('assi_grade={id}','teacher@view_set_grade');
Route::post('assi_grade={id}','teacher@set_grade');

Route::get('view_assignmets', 'teacher@show_assi');
Route::get('delete_assignmets={id}','teacher@delete_assi');
Route::get('view_assignmets={id}','teacher@view_assi');

Route::get('student_assignment',function()
{
    return View::make('Teacher/student_assignment');
});

Route::get('download_homework={id}','teacher@download_homework');