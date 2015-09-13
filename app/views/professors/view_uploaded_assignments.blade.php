
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
  $course_id=Session::get('course_id2');


  ?>
<script type="text/javascript">

    function get_page(sel)
   {
        window.location="view_uploaded_assignment="+ sel.value;
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
   $views2 = $view_fields->view("prof_teacher_assignment","where_get","course_id","=","$course_id","");
              foreach($views2 as $view){

?>

                    <div class="row">


                         <div class="col-md-12">

            <div class="panel  panel-dark " data-collapsed="0"><!-- setting the attribute data-collapsed="1" will collapse the panel -->

                <!-- panel head -->
                <div class="panel-heading">
                    <div class="panel-title">{{$view->assignment_name}}</div>

                    <div class="panel-options">
                        <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
                    </div>
                </div>

                <!-- panel body -->
                <div class="panel-body" style="display: none;">

                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 200px; "><div class="scrollable" data-height="200" data-scroll-position="right" data-rail-color="#fff" data-rail-opacity=".9" data-rail-width="8" data-rail-radius="10" data-autohide="0" style="overflow: hidden; width: auto; height: 200px;">

                      <table class="table table-bordered datatable dataTable" id="table-1" aria-describedby="table-1_info">

                                                        <thead>
                                                            <tr role="row">
                                                                <th data-hide="phone" class="sorting_asc" role="columnheader" tabindex="0" aria-controls="table-1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">
                                                                    ID
                                                                </th>
                                                                <th class="sorting" role="columnheader" tabindex="0" aria-controls="table-1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">
                                                                    Name Of Student
                                                                </th>
                                                                <th data-hide="phone" class="sorting" role="columnheader" tabindex="0" aria-controls="table-1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">
                                                                    ID Of Student
                                                                </th>
                                                                <th data-hide="phone" class="sorting" role="columnheader" tabindex="0" aria-controls="table-1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">
                                                                    Student Grade
                                                                </th>
                                                                <th data-hide="phone,tablet" class="sorting" role="columnheader" tabindex="0" aria-controls="table-1" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
                                                                    Student Assignment
                                                                </th>

                                                                <th class="sorting" role="columnheader" tabindex="0" aria-controls="table-1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">
                                                                    Set Grade
                                                                </th>
                                                            </tr>
                                                        </thead>


                                        <tbody role="alert" aria-live="polite" aria-relevant="all">
                                            <?php

                                                    $student_assignment = $view_fields->view('student_assignment','where_get','assignment_id',"=",$view->id,'');


                                                            foreach ($student_assignment as $dep)
                                                            {

                                                    ?>
                                                                <tr class="gradeU">
                                                                            <td><?php echo $view_fields->view("students","where_pluck","id",'=',$dep->student_id,'id'); ?></td>
                                                                            <td><?php echo $view_fields->view("students","where_pluck","id",'=',$dep->student_id,'name'); ?></td>
                                                                            <td><?php echo $view_fields->view("students","where_pluck","id",'=',$dep->student_id,'stu_id'); ?></td>
                                                                            <td><?php echo $dep->student_grade?></td>
                                                                            <td class="center"><a href="upload_dawnload_assignment={{$dep->id}}"  style="color:#ff0000">{{$dep->student_assignment}}</a> </td>

                                                                            <td class="center">

                                                                            <form role="form" class="form-horizontal form-groups-bordered" method="post" enctype="multipart/form-data" action="set_grade">

                                                                                                <!-- inputs -->

                                                                                    <div class="form-group">

                                                                                        <div class="col-sm-12">
                                                                                            <input type="text" class="form-control" id="field-1" placeholder="Grade" name="grade" required style="background: #333;color: #ffffff;">
                                                                                            <input type="hidden" class="form-control" id="field-1" value="<?php echo $view_fields->view("students","where_pluck","id",'=',$dep->student_id,'id'); ?>" name="stu_id" required style="background: #333;color: #ffffff;">
                                                                                        </div>
                                                                                    </div>




                                                                             </form>
                                                                            </td>
                                                                        </tr>
                                                    <?php
                                                            }
                                                    ?>
                                        </tbody>
                                    </table>



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







