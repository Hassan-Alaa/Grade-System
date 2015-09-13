 @extends('../includes/sidebar')
 @section('content')

<?php

/*get the id from session*/
$id = Session::get('update_deadline');

/*select tha data that id has it*/

 $view_admin = database::get_instance();
$user = $view_admin->view('deadline','where_first','id','=',$id,'');

?>

<div class="panel panel-primary" data-collapsed="0">

			<div class="panel-heading">
				<div class="panel-title">
					Time And Date Picker
				</div>

				<div class="panel-options">
					<a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>

				</div>
			</div>

			<div class="panel-body">

			<form role="form" method="post" class="form-horizontal form-groups-bordered" action="update_deadline_course=<?php echo $id;?>">

					<div class="form-group">
						<label class="col-sm-3 control-label">Time Picker</label>

						<div class="col-sm-3">
							<input type="text" name="time" class="form-control timepicker" data-template="dropdown" data-show-seconds="true" data-default-time="11:25 AM" data-show-meridian="true" data-minute-step="5" required value="<?php echo $user->time?>">
						</div>
					</div>
                    <div class="form-group">
                						<label class="col-sm-3 control-label">Date</label>

                						<div class="col-sm-3">
                							<input type="text" class="form-control datepicker" data-start-view="2" name="date"  placeholder="Birth Date" required="" value="<?php echo $user->date?>">
                						</div>
                </div>



                    <div class="form-group">
                        <label class="col-sm-3 control-label"></label>
                        <div class="col-sm-3">
                        <input type="submit"  class="btn btn-primary " value="Add" Name="Add">
                        </div>
                        </div>



				</form>

			</div>


</div>

@stop