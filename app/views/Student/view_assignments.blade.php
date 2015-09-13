
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
        window.location="view_student_assignment="+ sel.value;
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
                        $courses = $view_fields->view('course',' ',' ',' ',' ','');
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


                     		         <option value="{{$cor->id }}">  {{$cor->name}} </option>
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

                                               	<a href="download_assignment=<?php echo $view2->id?>" class="member-img">
                                               	<?php
                                               	$photo = '';
                                                $extension = explode(".",$view2->assignment);
                                               	    if($extension[1] != 'jpg' || $extension[1] != 'png')
                                               	    {
                                                        $photo = 'assignments_main.jpg';
                                               	    }
                                               	    else
                                               	    {
                                               	        $photo = $view2->assignment;
                                               	    }


                                               	?>
                                               		<img src="assets/Notify_files/{{ $photo }}" class="img-rounded" style="width: 100px;height: 100px">
                                               		<i class="entypo-down-bold"></i>
                                               	</a>

                                               	<div class="member-details col-sm-4" style="float: left">
                                               		<h4>
                                                    <a href="#">{{$view2->assignment_name}}</a>
                                                        <?php if(strtotime($view2->deadline) < strtotime(date('m/d/Y'))){?>
                                                             <form role="form" class="form-horizontal form-groups-bordered" method="post" enctype="multipart/form-data" action="#" style="float: right">
                                                                                                                <div class="form-group" style="  margin-top: -20%;">

                                                            							                       <div class="col-sm-1" style="margin-left: 25%">

                                                                                                                    <font color="red">Closed</font>
                                                                                                                </div>
                                                                                                                </div>
                                                                                                                </form>
                                                        <?php }else{?>

			                                        <form role="form" class="form-horizontal form-groups-bordered" method="post" enctype="multipart/form-data" action="view_student_assignment=<?php echo $course_id?>" style="float: right">
                                                    <div class="form-group" style="  margin-top: -24%;">
                                                    <div class="col-sm-4" style="float: left;
                                                                                   position: fixed;
                                                                                   margin-left: -30%;
                                                                                   direction: rtl;">
                                                    <input type="file" name="upload_assignment" class="form-control file2 inline btn btn-blue" multiple="1" data-label="<i class='glyphicon glyphicon-circle-arrow-up'></i> &nbsp;Browse Files" >
                                                   </div>
                                                    <input type="hidden" name="assignment_id" value="<?php echo $view2->id?>">
							                       <div class="col-sm-4" style="margin-left: 25%">
							                         <input type="submit"  class="btn btn-primary " value="submit" Name="Add">
                                                    </div>
                                                    </div>
                                                    </form>
                                                    <?php }?>
                                                    </h4>

                                               			<div class="col-sm-4">
                                               			<?php echo $view_fields->view("course","where_pluck","id","=",$course_id,"name");?>

                                               			</div>

                                               			<div class="clear"></div>

                                               			<div class="col-sm-4">
                                               				<a href="#" style="color: red"><?php echo $view2->deadline;?></a>
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