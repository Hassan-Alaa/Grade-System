
<?php

$users = DB::table('users_login')
                ->orderBy('id', 'desc')->first();
            $mail = $users->user_session;

        $name = database::get_instance();

       $prof= $name->view('professor','where_pluck','Mail','=',$mail,'name');


  $content=Input::get('des');
  $courses=Input::get('courses');



 ?>
<div class="row">
	<div class="col-md-12">

		<div class="panel panel-primary" data-collapsed="0">

	            <div class="panel-heading">
				<div class="panel-title">
					<h3> By : Dr.{{$prof}}</h3>
					<h4>Course : {{$name->view('course','where_pluck','id','=',$courses,'name');}}</h4>
					<hr>
				</div>
				</div>
				<div class="panel-body">
                    {{$content}}
				</div>

</div>
</div>
</div>


<h2>



</h2>