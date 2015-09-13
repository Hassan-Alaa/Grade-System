<?php

class StudentProfile extends BaseController implements profile
{

    public $add_file;

    private function __construct(){}

    static  public function get_instance(){

        return new StudentProfile();
    }


    public function get_profile()
    {
        $return =View::make('main/profile');
        return $return;
    }

    public function post_profile($table,$col_name,$type)
    {
        $object=database::get_instance();

        $users = DB::table('users_login')
            ->orderBy('id', 'desc')->first();
        $stu_id = $users->user_session;
        $id=$object->view($table,"where_pluck",$col_name,'=',$stu_id,'id');

        $profile_image = $object->view($table,"where_pluck",'id','=',$id,'profile_image');

        Session::put('table',$table);

        if(Auth::attempt(array('password' => Input::get('old_pass')))){
            if (Input::get('new_pass') == Input::get('pass_confirm')) {
                $this->add_file = $object->upload_file('profile_images', $table, 'upload', 'profile_image', "update", 'id', $id,$profile_image);
                $val = array('password' => Hash::make(Input::get('new_pass')),'mail' =>
                    Input::get('update_mail'));
                $object->update($table, 'id', $id, $val);
            } else {
                $return= Redirect::to('profile='.$type)->with('exists', 'Please Enter Correct new password');
            }
        } else {
            $return= Redirect::to('profile='.$type)->with('exists', 'Please Enter Correct Old password');

        }


        if ($this->add_file) {
            $return= Redirect::to('profile='.$type)->with('success', 'You successfully Update Your Profile.');
        } else {
            $return= Redirect::to('profile='.$type)->with('exists', 'Please Select a file');
        }

        return $return;

    }

}


?>