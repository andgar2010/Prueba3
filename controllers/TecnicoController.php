<?php 
/**
* 
*/
class TecnicoController extends IndexController
{
	private $tecnicoModel;
	function __construct()
	{
		if (!isset($_SESSION['usuario'])) {
			header('Location: index.php');
		}else{
			$this->tecnicoModel = $this->model('tecnico');
		}
	}
	public function index()
	{
		$r = $this->tecnicoModel->get_reportes();
		include_once 'views/all/header.php';	
		 include_once 'views/tecnico/navbar.php';
		 include_once 'views/tecnico/slide.php';
		 include_once 'views/tecnico/busquedaTodo.php';
		 include_once 'views/all/footer.php';
	}

	public function cambiar_estado($id){
		$data = ['estado' => 2, 'id' => $id];
		$r = $this->tecnicoModel->update_estado($data);
		header('Location: index.php?c=tecnico&m=index');
	}

	public function salir(){
		session_destroy();
		$_SESSION['usuario'];
		header('Location: index.php');
	}

}

 ?>