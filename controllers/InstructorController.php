<?php 
/** 
* 
*/
class InstructorController extends IndexController
{
	private $instructorModel;

	function __construct(){
		$this->instructorModel = $this->model('instructor');
	}

	public function index()
	{
		$r = $this->instructorModel->get_equipos();
		include_once 'views/all/header.php';	
		include_once 'views/instructor/navbar.php';	 
	 	include_once 'views/instructor/reporte.php';
		include_once 'views/all/footer.php';

	}

	public function send_reporte(){
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$data = [ 'serial' => $_POST['serial'], 'desc' => $_POST['desc'], 'id_usuario' => $_SESSION['usuario'][0]];
			// var_dump($data);
			$r = $this->instructorModel->registrar($data);

			header('Location: index.php?c=instructor&m=index');
		}else{
			header('Location: index.php');
		}
	}
}
?>