<?php

$type=Session::get('kind');
$id=Session::get('field_id');
 $course_id=Session::get('course_id');

?>
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

<script type="text/javascript">
    var x=<?php echo $course_id ?>



    function get_page(sel) {
window.location="register_courses_second_step={{$type}}="+x+"="+ sel.value ;    }

</script>



 <div class="row">
 	<div class="col-md-12">

 		<div class="panel panel-primary" data-collapsed="0">

 			<div class="panel-heading">
 				<div class="panel-title">
 					<h2>Add Some Fields For This Course</h2>
 				</div>

 			</div>

 			<div class="panel-body">

 				<form role="form" class="form-horizontal form-groups-bordered" method="post" enctype="multipart/form-data" action="register_courses_second_step={{$type}}=<?php echo $course_id ."=".$id;?>">

 					<!-- inputs -->


                    <?php

 						/*select all fields*/


                        $view_fields = database::get_instance();
                        $fields = $view_fields->view('fields',' ',' ',' ',' ','');
 					?>




 					<div class="form-group">
                     	<label class="col-sm-2 control-label">All Courses Fields</label>

                     	<div class="col-sm-9">

                     	<select class="selectboxit visible" data-first-option="false" style="display: none;" name="fields" onChange="get_page(this);" required>
 								<option value="0">Select Field</option>


                     				<?php
                     					foreach ($fields as $fie)
                     				    {?>


                     		         <option value="{{$fie->id}}">  {{$fie->name}} </option>
						              <?php } ?>
                     	</select>

                     	</div>
                     </div>


                      <div class="form-group">
                                                                     	<label class="col-sm-2 control-label">Value Of Field</label>

                                                                  		<div class="col-sm-9">
                                             							    <input type="text" class="form-control" name="value_field" id="field-1" placeholder="Value Of Field"
                                             							    required value="<?php echo DB::table('course_fields')
                                                                                                                            ->where('field_id', '=', $id)
                                                                                                                            ->where('course_id','=',$course_id)
                                                                                                                            ->orderBy('id','desc')
                                                                                                                            ->pluck('value');
                                                                                                                            ?>">
                                                                  		</div>
                                                                  </div>

                     <div class="form-group">
                     	<label for="field-1" class="col-sm-2 control-label"></label>

                     	<div class="col-sm-9">
                     		<input type="submit"  class="btn btn-primary " value="Register" name="Add">
                     	</div>
                     </div>

 			    </form>

<hr>

<?php if($type=="add"){?>

                <form role="form" class="form-horizontal form-groups-bordered" method="post" enctype="multipart/form-data" action="register_courses_third_step=<?php echo $course_id ?>">

 			        <div class="form-group">
                            <label for="field-1" class="col-sm-2 control-label"></label>

                            <div class="col-sm-9">
                                 <input type="submit"  class="btn btn-orange " value="Next Step" name="Next_Step">
                         	</div>
                       </div>

                </form>
<?php } ?>

 			</div>

        </div>

   	</div>
  </div>

 @stop