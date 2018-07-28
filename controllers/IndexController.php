<?php 

/**
* 
*/
class IndexController
{
	
	public function view($module,$view, $data = []){

		if (file_exists('views/'.$module."/".$view.".php")) {
			include_once 'views/all/header.php';
			include_once 'views/'.$module."/".$view.".php";
			include_once 'views/all/footer.php';
		}
		
	}

	public function model($model){
		$model = ucwords($model).'Model';
		if (file_exists('models/'.$model.'.php')) {
			require_once 'models/'.$model.'.php';
			return new $model;
		}else{
			die('ERROR');
		}
	}

}