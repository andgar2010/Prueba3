<?php 
/**
* 
*/
class InstructorModel
{
	private $pdo;
	function __construct()
	{
		$this->pdo = Conexion::conectar();
	}

	public function get_equipos(){
		$stmt = $this->pdo->prepare('SELECT * FROM equipo');
		$stmt->execute(); 
		return $stmt->fetchAll(PDO::FETCH_OBJ);
	} 

	public function registrar($data){
		$stmt = $this->pdo->prepare('INSERT INTO ticket (descripcion, estado_ticket_id_estado_ticket, equipo_id_equipo, usuario_id_usuario) VALUES (?,1,?,?)');

		$stmt->bindParam(1,$data['desc']);
		$stmt->bindParam(2,$data['serial']);
		$stmt->bindParam(3,$data['id_usuario']);

		if ($stmt->execute()) {
			return true;
		}else{
			return false;
		}
	}
}