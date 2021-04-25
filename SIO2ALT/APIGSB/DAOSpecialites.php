<?php
	include "cnx.php";
	$request_method = $_SERVER["REQUEST_METHOD"];
	
	function getLesSpecialites()
	{
		global $cnx;
		$reponse = array();
		$sql = $cnx->prepare("select * from  specialite ");
		$sql->execute();
		$lesSpecialites = $sql->fetchAll(PDO::FETCH_NUM);
		//var_dump($lesSecteurs);
		foreach($lesSpecialites as $row)
		{
			$uneSpecialite = [
				'id' => $row[0],
				'nom' => $row[1],
			];
			$reponse[] = $uneSpecialite;
		}
		echo json_encode($reponse);
	}
  
	function getLaSpecialite($id)
	{
		global $cnx;
		$sql = $cnx->prepare("select SPE_CODE, SPE_LIBELLE from  specialite where SPE_CODE = ?");
		$sql->bindValue(1,$id);
		$sql->execute();
		$row = $sql->fetch(PDO::FETCH_NUM);
		$laSpecialite = [
			'id' => $row[0],
			'nom' => $row[1],
		];
		echo json_encode($laSpecialite);
	}

	function AddSpecialite()
	{
		global $cnx;
		$json_str = file_get_contents('php://input');
		$nom = json_decode($json_str);
		$sql = $cnx->prepare("select max(SPE_CODE) from specialite");
		$sql->execute();
		$row = $sql->fetch(PDO::FETCH_NUM);
		$sql = $cnx->prepare("insert into specialite values(?,?)");
		$sql->bindValue(1,intval($row[0]) + 1);
		$sql->bindValue(2,$nom->Spe);
		$sql->execute();
	}

	function UpdateSpecialite()
	{
		global $cnx;
		$json_str = file_get_contents('php://input');
		$laSpecialite = json_decode($json_str);
		$sql = $cnx->prepare("update specialite set SPE_LIBELLE = ? where SPE_CODE = ?");
		$sql->bindValue(1,$laSpecialite->Nom);
	 	$sql->bindValue(2,$laSpecialite->Id);
		$sql->execute();
	}
	switch($request_method)
	{
		case 'GET':
			if(!empty($_GET["id"]))
			{
				getLaSpecialite($_GET["id"]);
			}
			else
			{
				getLesSpecialites();
			}
			break;
		case 'POST':
			AddSpecialite();
			break;
		case 'PUT':
			UpdateSpecialite();
			break;
		default:
			header("HTTP/1.0 405 Method Not Allowed");
			break;
	}
?>