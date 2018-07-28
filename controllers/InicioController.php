<?php 



class InicioController extends IndexController
{
	private $inicioModel;

	function __construct(){
		$this->inicioModel = $this->model('inicio');
	}

	public function index(){
		include_once 'views/all/header.php';
		include_once 'views/index.php';
		include_once 'views/all/footer.php';
	}


	public function login(){
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$data = $_POST['email'];
			$r = $this->inicioModel->get_usuario($data);
			if ($r->contrasena == $_POST['pass']) {
					$_SESSION['usuario'] = [];
					$_SESSION['usuario'][0] = $r->id_usuario;
					$_SESSION['usuario'][1] = $r->cod_rol;
				
				if ($_SESSION['usuario'][1] == 2) {
					header('Location: index.php?c=instructor&m=index');
				}

				if($_SESSION['usuario'][1] == 1){
					header('Location: index.php?c=tecnico&m=index');
				}
			}else{
				// header('Location: index.php');
			}

		}
	}

}