 @extends('../includes/sidebar')
 @section('content')
<?php 
$id = Session::get('assi_id');
?>
 <div class="row">
  <div class="col-md-12">

    <div class="panel panel-primary" data-collapsed="0">


      <div class="panel-heading">
        <div class="panel-title">
          <h2>Upload File</h2>
        </div>
      </div>

      <div class="panel-body">

 <form role="form" class="form-horizontal form-groups-bordered" method="post" enctype="multipart/form-data" action="assi_grade=<?php echo $id ?>">


                              <div class="fileinput fileinput-new" data-provides="fileinput"><input type="hidden">

          <div class="form-group">
            <div class="col-sm-9">

            </div>
          </div>

<div class="form-group">

                            <div class="col-sm-9">
                             
                            </div>
                </div>

                                
                              Grade <input type="text" name="grade" required>
                                
                              </div>
                              <div class="form-group">
                                      <label for="field-1" class=" control-label"></label>
                                              <div class="col-sm-9">
                                                <input type="submit"  class="btn btn-primary " value="Set Grade" Name="Add">
                                      </div>
                                          </div>
</form>

      </div>

    </div>
    </div>
  </div>
 @stop