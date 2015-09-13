 @extends('../index')
 @section('sidebar')


<?php

$users = DB::table('users_login')
                    ->orderBy('id', 'desc')->first();
    $mail = $users->user_session;
    $type=$users->type;

    $id = '';


$object = NULL;

$table = '' ;

        if($type == 'Administrator')
            {
           $table = 'admin' ;
           $object= database::get_instance();
            $id = $object->view('admin',"where_pluck",'mail','=',$mail,'id');
            }
        elseif($type == 'Professor')
            {
           $table = 'professor' ;
           $object= database::get_instance();
            $id = $object->view('professor',"where_pluck",'Mail','=',$mail,'id');
            }
        elseif($type == 'Teacher')
            {
           $table = 'teacher' ;
           $object= database::get_instance();
            $id = $object->view('teacher',"where_pluck",'Mail','=',$mail,'id');

            }
        elseif($type == 'Student')
            {
           $table = 'students' ;
           $object= database::get_instance();
            $id = $object->view('students',"where_pluck",'stu_id','=',$mail,'id');
            }


$random = str_random(32);
?>

<div class="sidebar-menu">

		<header class="logo-env">

			<!-- logo -->
            			<div class="logo">
            				<a href="index=<?php echo $random;?>">
            					<div style="font-size: 20px;
                                            color: white;
                                            margin-left: -12px;
                                            font-family: -webkit-pictograph;
                                            font-weight: bold;">
                                                FCIH-Grade System
                                            </div>
            				</a>
            			</div>

						<!-- logo collapse icon -->

			<div class="sidebar-collapse">
				<a href="#" class="sidebar-collapse-icon with-animation"><!-- add class "with-animation" if you want sidebar to have animation during expanding/collapsing transition -->
					<i class="entypo-menu"></i>
				</a>
			</div>



			<!-- open/close menu icon (do not remove if you want to enable menu on mobile devices) -->
			<div class="sidebar-mobile-menu visible-xs">
				<a href="#" class="with-animation"><!-- add class "with-animation" to support animation -->
					<i class="entypo-menu"></i>
				</a>
			</div>

		</header>





            <div class="sidebar-user-info">

            			<div class="sui-normal">
            				<a href="#" class="user-link">
            					<img src="assets/profile_images/<?php echo  $object->view($table,"where_pluck",'id','=',$id,'profile_image');?>" class="img-circle" style="width:65px;height:65px;">

            					<span>Welcome,</span>
            					<strong><?php

                            echo $object->view($table,"where_pluck",'id','=',$id,'name');

            					?></strong>
            				</a>
            			</div>

            			<div class="sui-hover inline-links animate-in">
            				<a href="profile={{$type}}">
            					<i class="entypo-pencil"></i>
            					Profile
            				</a>



            				<a href="logout">
            					<i class="entypo-lock"></i>
            					Log Out
            				</a>

            				<span class="close-sui-popup">×</span>			</div>
            		</div>



						<!-- logo collapse icon -->

			<div class="sidebar-collapse">
				<a href="#" class="sidebar-collapse-icon with-animation"><!-- add class "with-animation" if you want sidebar to have animation during expanding/collapsing transition -->
					<i class="entypo-menu"></i>
				</a>
			</div>



			<!-- open/close menu icon (do not remove if you want to enable menu on mobile devices) -->
			<div class="sidebar-mobile-menu visible-xs">
				<a href="#" class="with-animation"><!-- add class "with-animation" to support animation -->
					<i class="entypo-menu"></i>
				</a>
			</div>

		</header>


<ul id="main-menu" class="">

			<!--sidebar buttons -->

<?php
if($type=="Administrator")
{
?>
	<li class=" active">
			<a href="#"><i class="entypo-gauge"></i><span>Administrator</span></a>


			<ul>
				<li class="active">
					<a href="add_admin"><span>Add</span></a>
				</li>

				<li>
					<a href="view_admin"><span>View</span></a>
				</li>

			</ul>

	</li>

	<li class=" active">
                <a href="#"><i class="entypo-doc-text"></i><span>Slider</span></a>


                <ul>
                    <li class="active">
                        <a href="add_slider"><span>Add</span></a>
                    </li>

                    <li>
                        <a href="view_slider"><span>View</span></a>
                    </li>

                </ul>

        </li>

    <li class=" active">
            <a href="#"><i class="entypo-doc-text"></i><span>Departments</span></a>


            <ul>
                <li class="active">
                    <a href="add_department"><span>Add</span></a>
                </li>

                <li>
                    <a href="view_department"><span>View</span></a>
                </li>

            </ul>

    </li>

    <li class=" active">
            <a href="#"><i class="entypo-doc-text"></i><span>Courses</span></a>


            <ul>
                <li class="active">
                    <a href="add_course"><span>Add</span></a>
                </li>

                <li>
                    <a href="view_courses"><span>View</span></a>
                </li>

            </ul>

    </li>

    <li class="active">
			<a href="#"><i class="entypo-doc-text"></i><span>Student</span></a>


			<ul>

			<li class="active">
                <a href="add_id"><span>Start ID Controller</span></a>
               </li>
				<li>
					<a href="add_student"><span>Add</span></a>
				</li>

				<li>
					<a href="view_student"><span>View</span></a>
				</li>



			</ul>

	</li>

	<li class="active">
			<a href="#"><i class="entypo-doc-text"></i><span>Teacher</span></a>


			<ul>
				<li class="active">
					<a href="add_teacher"><span>Add</span></a>
				</li>

				<li>
					<a href="view_teacher"><span>View</span></a>
				</li>

			</ul>

	</li>

	<li class="active">
    			<a href="#"><i class="entypo-doc-text"></i><span>Professor</span></a>


    			<ul>
    				<li class="active">
    					<a href="add_prof"><span>Add</span></a>
    				</li>

    				<li>
    					<a href="view_prof"><span>View</span></a>
    				</li>

    			</ul>

    	</li>

	<li class="active">
        			<a href="#"><i class="entypo-doc-text"></i><span>DeadLine</span></a>


        			<ul>
        				<li class="active">
        					<a href="deadline"><span>Add</span></a>
        				</li>

        				<li>
        					<a href="view_deadline"><span>View</span></a>
        				</li>

        			</ul>

        	</li>
        				<li class="active">
                <a href="user_helper_admin"><i class="entypo-doc-text"></i><span>User helper</span></a>
            </li>

<?php } elseif($type=="Professor") {?>


<li class=" active">
                        <a href="#"><i class="entypo-doc-text"></i><span>Reguster Course</span></a>


                        <ul>
                            <li class="active">
                                <a href="register_courses_first_step"><span>Register</span></a>
                            </li>

                            <li>
                                <a href="view_register_courses"><span>View</span></a>
                            </li>

                        </ul>

                </li>
                <li class=" active">
                        <a href="make_notify=notify"><i class="entypo-doc-text"></i><span>Make Notify</span></a>
                </li>
            <li class=" active">
                        <a href="#"><i class="entypo-doc-text"></i><span>Assignments</span></a>


                        <ul>
                            <li class=" active">
                                         <a href="view_prof_assignment=course"><i class="entypo-doc-text"></i><span>View Courses Assignments</span></a>
                                            </li>
                            <li class=" active">
                             <a href="view_uploaded_assignment=course"><i class="entypo-doc-text"></i><span>View Upload Assignments</span></a>
                                </li>
                        </ul>
            </li>

            <li class=" active">
                                    <a href="#"><i class="entypo-doc-text"></i><span>Grades</span></a>


                                    <ul>
                                        <li class=" active">
                                                     <a href="grade_field_for_each_student=course"><i class="entypo-doc-text"></i><span>Set Grade For Each Student</span></a>
                                                        </li>

                                    </ul>
                        </li>
<li class="active">
                <a href="user_helper_professor"><i class="entypo-doc-text"></i><span>User helper</span></a>
            </li>

<?php } elseif($type=="Student"){ ?>


    		<li class=" active">
                                    <a href="#"><i class="entypo-doc-text"></i><span>Reguster Course</span></a>


                                    <ul>
                <li class="active">
                					<a href="register_course"><span>Register Course</span></a>

                	</li>

                                        <li>
                                            <a href="view_registers"><span>View</span></a>
                                        </li>

                                    </ul>

                            </li>

                            <li class=" active">
                                                    <a href="view_student_assignment=course"><i class="entypo-doc-text"></i><span>View Courses Assignments</span></a>
                            </li>
                             <li class=" active">
                                                    <a href="View_grade"><i class="entypo-doc-text"></i><span>View Course Grade</span></a>
                            </li>
                            <li class="active">
                                            <a href="user_helper_student"><i class="entypo-doc-text"></i><span>User helper</span></a>
                                        </li>

<?php } elseif($type=="Teacher"){ ?>

 <li class=" active">
                         <a href="make_teacher_notify=notify"><i class="entypo-doc-text"></i><span>Make Notify</span></a>
                 </li>

                 <li class=" active">
                      <a href="teacher_grade_field_for_each_student=course"><i class="entypo-doc-text"></i><span>Set Grade For Each Student</span></a>
                 </li>


                             <li class="active">
                                         <a href="#"><i class="entypo-doc-text"></i><span>Assignments</span></a>


                                         <ul>

                                              <li>
                                                 <a href="view_assignmets"><span>View Assignments</span></a>
                                             </li>
                                             <li>
                                                 <a href="student_assignment"><span>View Student Assignment</span></a>
                                             </li>


                                         </ul>

                                 </li>
                                 <li class="active">
                                                                      <a href="user_helper_teacher"><i class="entypo-doc-text"></i><span>User helper</span></a>
                                                                  </li>
 <?php }?>
</ul>


	</div>










<?php
if(Request::is('/') ||Request::is("login=".$type)|| Request::is('index='.Session::get('random')))
{

?>

<!--header-->
	<div class="main-content" style="padding: 0; height: 660px;">
<?php } else {?>
<div class="main-content">

<?php } ?>
    <div class="row">




    </div>



        @yield('content')</div></div></body>
        @stop
