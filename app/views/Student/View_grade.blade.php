
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
					<h2>Student Information</h2>
				</div>

			</div>
				<div class="panel-body">


<table class="table table-bordered datatable" id="table-1">
	<thead>
		<tr>
			<th data-hide="phone">Course Name</th>
			<th>Total Grade</th>

		</tr>
	</thead>
	<tbody>

<?php


           $view_obj = database::get_instance();


$views = $view_obj->view('student_total_grade'," "," "," "," ",'');

       foreach ($views as $view){
?>

		<tr class="gradeU">
			<td><?php echo $view_obj->view("course","where_pluck","id","=",$view->course_id,"name");?></td>
			<td><?php echo $view->total_grade?></td>

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




@stop