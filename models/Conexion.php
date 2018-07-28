<?php 
/**
by : Felipe
Crear conexión
*/
class Conexion
{	
	public static function conectar(){
		try {
			$pdo=new PDO('mysql:host=localhost;dbname=prueba3;charset=utf8','root',null);
			$pdo->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
			return $pdo;
		} catch (Exception $e) {
			
		}
	}
}
 ?>