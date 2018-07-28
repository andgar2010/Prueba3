<?php 
/**
By: Kevin
*/
class TecnicoModel
{
	private $pdo;
	function __construct()
	{
		$this->pdo = Conexion::conectar();
	}

	public function get_reportes(){
		$stmt = $this->pdo->prepare('SELECT * from ticket INNER JOIN estado_ticket ON ticket.estado_ticket_id_estado_ticket = estado_ticket.id_estado_ticket');
		$stmt->execute(); 
		return $stmt->fetchAll(PDO::FETCH_OBJ);
	}

	public function update_estado($data){
		$stmt = $this->pdo->prepare('UPDATE ticket SET estado_ticket_id_estado_ticket = ? WHERE id_ticket = ? ');
		$stmt->bindParam(1, $data['estado']);
		$stmt->bindParam(2, $data['id']);
		if ($stmt->execute()) {
			return true;
		}else{
			return false;
		}
	}


}