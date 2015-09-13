 @extends('../includes/sidebar')
 @section('content')


<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="position:fixed;height: 100%">
  <!-- Indicators -->


  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox" style="height: 100%">


    <?php

    					$view_department = database::get_instance();
    					$departments = $view_department->view('slider',' ',' '," ",' ','');

                          $count=0;

    						    foreach ($departments as $dep)
    						    {
    						    $count++;
    						    if($count==1)
    						    {
    					?>
    <div class="item active" style="height: 100%">
      <img src="assets/images/<?php echo $dep->name?>" alt="..." style="height:100%;width: 100%">

    </div>

<?php } else {?>
 <div class="item " style="height: 100%">
      <img src="assets/images/<?php echo $dep->name?>" alt="..." style="height:100%;width: 100%">

    </div>

<?php }} ?>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev" style="height: 100%">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next" style="height: 100%">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

 @stop