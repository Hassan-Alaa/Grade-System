
 @extends('../includes/sidebar')
 @section('content')


   	<?php $success = Session::get('success') ?>
            @if($success)
            <div class="alert alert-success">
            <center>{{ $success }}</center>
            </div>
            @endif


<div class="row">
	<div class="col-md-12">

		<div class="panel panel-primary" data-collapsed="0">

	<div class="panel-heading">
				<div class="panel-title">
					<h2>All Assignments</h2>
				</div>

			</div>
				<div class="panel-body">


<table class="table table-bordered datatable" id="table-1">
	<thead>
		<tr>
			<th data-hide="phone">Assignment ID</th>

			<th data-hide="phone">Assignment</th>
			<th data-hide="phone">Course Name</th>
			<th data-hide="phone">Deadline</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>

<?php


$view_course= database::get_instance();
          $users = DB::table('users_login')
                        ->orderBy('id', 'desc')->first();
                    $teacher_mail = $users->user_session;
                    $teacher_id=$view_course->view('teacher',"where_pluck",'Mail','=',$teacher_mail,'id'); //get teacher ID
                    $sub_teacher_id=$view_course->view('sub_teacher',"where_pluck",'teacher_id','=',$teacher_id,'id');//get sub_TA_id
  
  //  $prof_course_id=$view_course->view('sub_teacher',"where_get",'teacher_id','=',$teacher_id,'');

//

$views = $view_course->view('prof_teacher_assignment',"where_get","teacher_id","=",$teacher_id,'');







       foreach ($views as $view){
                    $course_id=$view->course_id;
                   $course_name=$view_course->view('course',"where_pluck",'id','=',$course_id,'name');
?>

		<tr class="gradeU">
			<td><?php echo $view->id?></td>
			<td><?php echo $view->assignment?></td>
			<td><?php echo $course_name?></td>
			<td><?php echo $view->deadline?></td>

			<td class="center">

			 <a href="view_assignmets=<?php echo $view->id?>" class="btn btn-gold" sub="delete">

                                                            		Download
                                                            				</a>
             <a href="delete_assignmets=<?php echo $view->id?>" class="btn btn-danger" sub="delete">

                                                            		Delete
                                                            				</a>



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

