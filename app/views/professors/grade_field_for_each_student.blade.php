
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
  $course_id=Session::get('course_id3');


  ?>
<script type="text/javascript">

    function get_page(sel)
   {
        window.location="grade_field_for_each_student="+ sel.value;
   }

</script>


<div class="row">
	<div class="col-md-12">

		<div class="panel panel-primary" data-collapsed="0">

	<div class="panel-heading">
				<div class="panel-title">
					<h2>View Uploaded Assignment</h2>
				</div>

			</div>
				<div class="panel-body">

                    <div class="row">

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


                    </div>
<br><br>

<?php

   $views2 = $view_fields->view("register_course_section","where_get","course_id","=","$course_id","");
              foreach($views2 as $view){
                  $ass_grade=0;

            $view3= $view_fields->view("student_assignment",'where_get','student_id','=',$view->student_id,'');
            foreach($view3 as $view4){

                $ass_grade+=$view4->student_grade;
            }



?>

                    <div class="row">


                         <div class="col-md-12">

            <div class="panel panel-invert" data-collapsed="0"><!-- setting the attribute data-collapsed="1" will collapse the panel -->

                <!-- panel head -->
                <div class="panel-heading">
                    <div class="panel-title">{{$view_fields->view('students',"where_pluck",'id','=',$view->student_id,'name');}}</div>

                    <div class="panel-options">
                        <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
                    </div>
                </div>

                <!-- panel body -->
                <div class="panel-body" style="display: none;">

                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 200px; border:none !important; ">
                        <div class="scrollable" data-height="200" data-scroll-position="right" data-rail-color="#fff" data-rail-opacity=".9" data-rail-width="8" data-rail-radius="10" data-autohide="0" style="overflow: hidden; width: auto; height: 200px;">

                          <form role="form" class="form-horizontal form-groups-bordered" method="post" enctype="multipart/form-data" action="grade_field_for_each_student={{$course_id}}">


                          <input type="hidden" class="form-control" id="field-1" placeholder="Final" name="stu_id" value="{{$view->student_id}}">



                            <div class="form-group col-sm-6" style=" border:none !important;">
                                    <label for="field-1" class="col-sm-3 control-label" style="margin-top: 2%; color: #ffffff">Final</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="field-1" placeholder="Final" name="final" required>
                                    </div>
                            </div>
                            <div class="form-group col-sm-6" style=" border:none !important;">
                                    <label for="field-1" class="col-sm-3 control-label" style="  margin-top: 2%; color: #ffffff">Mid-Term</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="field-1" placeholder="Mid-Term" name="miedterm" required>
                                    </div>
                            </div>

                            <div class="form-group col-sm-6" style=" border:none !important;">
                                    <label for="field-1" class="col-sm-3 control-label" style="margin-top: 2%; color: #ffffff">Project</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="field-1" placeholder="Project" name="project">
                                    </div>
                            </div>
                            <div class="form-group col-sm-6" style=" border:none !important;">
                                    <label for="field-1" class="col-sm-3 control-label" style="  margin-top: 2%; color: #ffffff">Other</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="field-1" placeholder="Other" name="other">
                                    </div>
                            </div>

                            <div class="form-group col-sm-6" style=" border:none !important;">
                                    <label for="field-1" class="col-sm-3 control-label" style="margin-top: 2%; color: #ffffff" >Assignment</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="field-1" placeholder="Assignment" disabled value="{{$ass_grade}}">
                                    </div>
                            </div>
                            <div class="form-group col-sm-6" style=" border:none !important;">
                                    <label for="field-1" class="col-sm-3 control-label" style="  margin-top: 2%; color: #ffffff">Submit</label>

                                    <div class="col-sm-9">
                                        <input type="submit" class="btn btn-orange col-sm-12" id="field-1" placeholder="Placeholder">
                                    </div>
                            </div>
                          </form>
                        </div>

                    </div>
                  </div>
                  </div>
                  </div>
                  </div>




<?php } ?>
		  </div>
          </div>
          </div>

<script type="text/javascript">
var responsiveHelper;
var breakpointDefinition = {
    tablet: 1024,
    phone : 480
};
var tableContainer;

	jQuery(document).ready(function($)
	{
		tableContainer = $("#table-1");

		tableContainer.dataTable({
			"sPaginationType": "bootstrap",
			"aLengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
			"bStateSave": true,


		    // Responsive Settings
		    bAutoWidth     : false,
		    fnPreDrawCallback: function () {
		        // Initialize the responsive datatables helper once.
		        if (!responsiveHelper) {
		            responsiveHelper = new ResponsiveDatatablesHelper(tableContainer, breakpointDefinition);
		        }
		    },
		    fnRowCallback  : function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
		        responsiveHelper.createExpandIcon(nRow);
		    },
		    fnDrawCallback : function (oSettings) {
		        responsiveHelper.respond();
		    }
		});

		$(".dataTables_wrapper select").select2({
			minimumResultsForSearch: -1
		});
	});
</script>

@stop







