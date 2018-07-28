<?php 
/**
* 
*/
class InicioModel
{
	private $pdo;
	function __construct(){
		$this->pdo = Conexion::conectar();
	}

	public function index(){
		echo "model";
	}

	public function get_usuario($email){
		$stmt = $this->pdo->prepare('SELECT * FROM usuario WHERE email = ?');
		$stmt->bindParam(1,$email);
		$stmt->execute();
		return $stmt->fetch(PDO::FETCH_OBJ);

	}

}