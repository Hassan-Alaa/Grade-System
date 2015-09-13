
 @extends('../includes/sidebar')
 @section('content')
        	<?php $success = Session::get('success') ?>
            @if($success)
            <div class="alert alert-success">
            <center>{{$success}}</center>
            </div>
            @endif

            <?php $exists = Session::get('exists') ?>
            @if($exists)
            <div class="alert alert-danger">
            <center>{{$exists}}</center>
            </div>
            @endif
  <?php
  $course_id=Session::get('course_id');


  ?>
<script type="text/javascript">

    function get_page(sel)
   {
        window.location="view_prof_assignment="+ sel.value;
   }

</script>


<div class="row">
	<div class="col-md-12">

		<div class="panel panel-primary" data-collapsed="0">

	<div class="panel-heading">
				<div class="panel-title">
					<h2>View Assignment</h2>
				</div>

			</div>
				<div class="panel-body">

                     <?php

                                             						/*select all fields*/
                            $view_fields = database::get_instance();

                            $users = DB::table('users_login')
                                                ->orderBy('id', 'desc')->first();
                             $id = $view_fields->view('professor',"where_pluck",'Mail','=',$users->user_session,'id');

                            $courses = $view_fields->view('prof_course','where_get','prof_id','=',$id,'','');
                        ?>




 					<div class="form-group">
                     	<label class="col-sm-2 control-label" style="
                            margin-top: 9px;
                        ">All Courses</label>

                     	<div class="col-sm-9">

                     	<select class="selectboxit visible" data-first-option="false" style="display: none;" name="fields" onChange="get_page(this);" required>
 								<option value="0">Select Field</option>


                     				<?php
                     					foreach ($courses as $cor)
                     				    {?>


                                         <option value="{{$cor->course_id }}">  {{$view_fields->view('course',"where_pluck",'id','=',$cor->course_id,'name');}} </option>
						              <?php } ?>
                     	</select>

                     	</div>
                     </div>



        <br><br><br>

                 					<?php
                 					if($course_id != 'course')
                 					{
                 					?>
                 			<div class="col-md-12">

                            		<div class="panel minimal minimal-gray">

                            			<div class="panel-heading">
                            				<div class="panel-title"><h4>Assignments</h4></div>
                            				<div class="panel-options">

                            					<ul class="nav nav-tabs">
                            							<?php


                                                    $views = $view_fields->view("prof_teacher_assignment","where_get","course_id","=","$course_id","");
                                                    foreach($views as $view)
                                                    {

                                                    ?>
                            						<li class=""><a href="#profile-{{ $view->id }}" data-toggle="tab" style="color: #fff;background-color: #303641;border-color: #39414e;">{{ $view->assignment_name }}</a></li>
                            						<?php }?>

                            					</ul>
                            				</div>
                            			</div>

                            			<div class="panel-body">

                            				<div class="tab-content">

                                                <?php

                                                  $views2 = $view_fields->view("prof_teacher_assignment","where_get","course_id","=","$course_id","");
                                                            foreach($views2 as $view2){

                                                   ?>
                            					<div class="tab-pane" id="profile-{{$view2->id}}">

                                               <div class="member-entry">

                                               	<a href="dawn_load_assignment={{$view2->id}}" class="member-img">
                                               		<img src="http://demo.neontheme.com/assets/images/attach-2.png" class="img-rounded" style="width: 100px;height: 100px">
                                               		<i class="entypo-down-bold"></i>
                                               	</a>

                                               	<div class="member-details col-sm-4" style="float: left">
                                               		<h4>
                                               			<a href="#">{{$view2->assignment_name}}</a>

                                               			  <form style="float: right;margin-top: -2%; margin-right: -3%;" role="form" class="form-horizontal form-groups-bordered" method="post" enctype="multipart/form-data" action="delete_assignment={{$course_id}}={{$view2->id}}">
                                                             <div class="form-group">
                                                                 <div class="col-sm-9">
                                                                      <input type="submit" class="btn btn-red popover-secondary" data-toggle="popover" data-trigger="hover" data-placement="bottom" data-content="Delete all Conversation and All Upload Solution!" data-original-title="Delete Assignment" value="Delete">
                                                                 </div>
                                                              </div>
                                                        </form>
                                               		</h4>



                                               			<div class="col-sm-4">
                                               			<?php echo $view_fields->view("course","where_pluck","id","=",$course_id,"name");?>

                                               			</div>




                                               			<div class="clear"></div>

                                               			<div class="col-sm-4">
                                               				<a href="#" style="color: red">{{$view2->deadline}}</a>
                                               			</div>



                                               	</div>

                                               	<div class="col-sm-8" style="float: right; margin-top: -3.6%;">
                                                                                                                {{$view2->description}}
                                                                                                            </div>

                                               </div>

                            					</div>

                                                <?php } ?>

                            			</div>

                            		</div>

                            	</div>

                 					<?php
                 					}
                                    ?>


                </div>


                </div>


    </div>
    </div>
    </div>




 @stop