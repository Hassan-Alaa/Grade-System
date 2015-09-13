
 @extends('../includes/sidebar')
 @section('content')


<?php $success = Session::get('success') ?>
@if($success)

<div class="row">

    <div class="col-md-12">

            <div class="alert alert-success">

                    <center>
                    {{ $success }}
                    </center>

            </div>

    </div>
</div>
@endif

<?php $exists = Session::get('exists') ?>
            @if($exists)
            <div class="alert alert-danger">
            <center>{{$exists}}</center>
            </div>
            @endif






<div class="row">
	<div class="col-md-12">

		<div class="panel panel-primary" data-collapsed="0">

	<div class="panel-heading">
				<div class="panel-title">
					<h2>Course Registration</h2>
				</div>

			</div>
				<div class="panel-body">


				<form role="form" class="form-horizontal form-groups-bordered" method="post" enctype="multipart/form-data" action="register_course">


<table class="table table-bordered datatable" id="table-1">
	<thead>
		<tr>
			<th  data-hide="phone"><center>Choose</center></th>
			<th data-hide="phone">Course Name</th>
			<th data-hide="phone">Professor Name</th>
		</tr>
	</thead>
	<tbody>

<?php


           $view_object = database::get_instance();
           $view_obj=$view_object;


            $users = DB::table('users_login')
                         ->orderBy('id', 'desc')->first();
            $stu_id = $users->user_session;
            $student_id=$view_obj->view('students',"where_pluck",'stu_id','=',$stu_id,'id');

            $views = $view_obj->view('prof_course'," "," "," "," ",'');

       foreach ($views as  $view){

                    $views2 = $view_obj->view('register_course_section',"where_get","student_id","=","$student_id ",'');

                            $checked="";

                     foreach ($views2 as $view2){

                            if($view->course_id == $view2->course_id)
                            {
                            $checked="checked";
                            }
                    }

?>

		<tr class="gradeU">

			<td align="center">

			                        <div class="checkbox">
			                        <label>
             <input type="checkbox" name="select[]" value="{{$view->id}}" id="{{$view->id}}" multiple="true" {{ $checked }}>
                                     </label>
                               		</div>
            </td>

            <td>{{ $view_obj->view('course',"where_pluck",'id','=',"$view->course_id",'name'); }}</td>
            <td>{{ $view_obj->view('professor',"where_pluck",'id','=',"$view->prof_id",'name'); }}</td>




		</tr>

		<?php
		}
		?>
	</tbody>

</table>
<?php
    $deadline = DB::table('deadline')
                              ->orderBy('id', 'desc')->first();
        $date = strtotime($deadline->date);
        $time = strtotime($deadline->time);


        date_default_timezone_set("Egypt");
        if($date < strtotime(date('m/d/Y')))
        {
       ?>
            <div class="row">

                <div class="col-md-12">

                        <div class="alert alert-danger">

                                <center>
                                You are Not allowed To Register any Course.
                                </center>

                        </div>

                </div>
            </div>

        <?php
        }
            else {

            ?>


	<div class="panel-footer">
				<div class="panel-title">

	<div class="form-group">
                          						<label for="field-1" class="col-md-10 control-label"></label>

                          	<div class="col-sm-10">
                         		<input type="submit"  class="btn btn-primary " value="Next Step" Name="Add">
                          	</div>
                          					</div>
				</div>

			</div>
<?php }?>
				</form>
</div>
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

