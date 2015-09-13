    <?php
    $course_id=session::get('view_course_fields');
    ?>
     @extends('../includes/sidebar')
     @section('content')
    <?php $success = Session::get('success') ?>
                @if($success)
                <div class="alert alert-success">
                <center>{{ $success }}</center>
                </div>
                @endif

                <?php $exists = Session::get('exists') ?>
                @if($exists)
                <div class="alert alert-danger">
                <center>{{ $exists }}</center>
                </div>
                @endif




    <div class="row">
        <div class="col-md-12">

            <div class="panel panel-primary" data-collapsed="0">

        <div class="panel-heading">
                    <div class="panel-title">
                        <h2>Professor Information</h2>

                    </div>

                </div>
                <div class="panel-footer">
                                <div class="panel-footer">
                 <form role="form" class="form-horizontal form-groups-bordered" method="post" enctype="multipart/form-data" action="post_add_register_course_second=add2={{$course_id}}=0">

                                                            <div class="form-group">

                                                                    <div class="col-sm-9">
                                                                         <input type="submit"  class="btn btn-primary " value="Add another fields " name="Next_Step">
                                                                    </div>
                                                               </div>

                                    </form>
                    </div>
                    </div>

                    <div class="panel-body">


    <table class="table table-hover">
        <thead>
            <tr>

                        <th data-hide="phone,tablet">Field name</th>
                        <th data-hide="phone,tablet">Field value</th>
                        <th><center>Actions</center></th>
            </tr>
        </thead>
        <tbody>

    <?php
                $view_obj = database::get_instance();


                $views2 = DB::table('course_fields')
                                    ->where('course_id', '=', $course_id)
                                    ->orderBy('id', 'desc')
                                    ->distinct("field_id")
                                    ->groupBy("field_id")
                                    ->get();


                    foreach ($views2 as $view2){
                        $field_name = $view_obj->view('fields',"where_pluck","id","=",$view2->field_id,'name');

                    ?>


                    <tr class="gradeU">
                        <td class="center"><?php echo $field_name?></td>
                        <td><?php echo $view2->value?></td>
                        <td class="center">

                        <center>
                              <div class="btn-group ">
                                    <button type="button" class="btn btn-blue dropdown-toggle" data-toggle="dropdown">
                                        <span class="caret"></span> Course Action</button>


                                    <ul class="dropdown-menu dropdown-blue" role="menu">
                                      <li><a href="delete_register_course_field={{$course_id}}={{$view2->field_id}}">Delete This Course</a></li>
                                     </ul>
                               </div>
    .
                        </center>


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







    @stop

