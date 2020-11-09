<?php
	session_start();

	include('header.php');

	require_once "connect.php";

	$connect = new PDO('mysql:host='.$host.';dbname='.$db_name, $db_user, $db_password);

	//$output = '';

	$commentid = $_GET['commentid'];
	$postid = $_GET['postid'];
	
	function funkcja($dane_id)
	{
		echo "a";
		$connect = new PDO('mysql:host=localhost;dbname=gamenews', 'root', '');
		$query = "SELECT * FROM comment WHERE idParent = $dane_id"; //czy ma dzieci
		$statement = $connect->prepare($query);
		$statement->execute();
		$result = $statement->fetchAll();

		if($statement->rowCount() > 0) //ma dzieci
		{
			echo "b";
			$query = "UPDATE comment SET content = 'Komentarz został usunięty' WHERE id = $dane_id";
			$statement = $connect->prepare($query);
			$statement->execute();
		}
		else //nie ma dzieci 
		{		
			echo "c";
			$query = "SELECT idParent FROM comment WHERE id = $dane_id";
			$statement = $connect->prepare($query);
			$statement->execute();
			$result = $statement->fetchAll();

			foreach ($result as $row) 
			{
				$idParent = $row['idParent']; //zapamiętaj jego idParent
			}

			$query = "DELETE FROM comment WHERE id = $dane_id"; //usuń go
			$statement = $connect->prepare($query);
			$statement->execute();

			if ($idParent != 0)  //jeśli ma rodzica
			{
				echo "d";
				$query = "SELECT * FROM comment WHERE id = $idParent";
				$statement = $connect->prepare($query);
				$statement->execute();
				$result = $statement->fetchAll();
				foreach ($result as $row) 
				{					
					if($row['content'] == 'Komentarz został usunięty')
					{
						echo "e";
						funkcja($row['id']);
					}
				}
			}

		}
	}

	funkcja($commentid);

	header('Location: single.php?postid='.$postid);
?>						




<!--
function usun_dzieci($dane_id)
	{
		$output = '';
		$connect = new PDO('mysql:host=localhost;dbname=gamenews', 'root', '');
		$query = "DELETE FROM comment WHERE idParent = $dane_id";
		$statement = $connect->prepare($query);
		$statement->execute();
		$result = $statement->fetchAll();
		foreach ($result as $row) {
			$output .= $row["id"].',';
			usun_dzieci($row["id"]);
		}
		echo $output;
	}

	
	
		$query = "DELETE FROM comment WHERE id = $commentid";
		$statement = $connect->prepare($query);
		$statement->execute();
		$result = $statement->fetchAll();
		foreach ($result as $row) {
			$output .= $row["id"].',';
			$output .= usun_dzieci($commentid);
		}
	//$output .= usun_dzieci($commentid);

	$output .= 'post'.$postid;
	echo $output;
	header('Location: single.php?postid='.$postid);



-------------------------------------------------------------------------


	$output = '';
	$connect = new PDO('mysql:host=localhost;dbname=gamenews', 'root', '');
	$query = "SELECT * FROM comment WHERE idParent = $dane_id";
	$statement = $connect->prepare($query);
	$statement->execute();
	$result = $statement->fetchAll();


	if($statement->rowCount() = 0) //nie ma dzieci
	{
		$query2 = "DELETE FROM comment WHERE id = $commentid"; //usuń komentarz
		$statement2 = $connect->prepare($query2);
		$statement2->execute();
	}
	else //ma dzieci
	{	
		$not_empty_children = 0;
		foreach ($result as $row) //sprawdź czy dzieci zawierają istotną treść
		{
			"SELECT * FROM comment WHERE idParent = $dane_id"
			if($statement->rowCount() = 0) //nie ma dzieci
			{
				if($row["content"] != "Komentarz został usunięty")
			}
			/*if($row["content"] != "Komentarz został usunięty")
			$not_empty_children = 1;
			break;*/
		}
		if ($not_empty_children == 0)
		{
			$query2 = "DELETE FROM comment WHERE id = $commentid";
			$statement2 = $connect->prepare($query2);
			$statement2->execute();
			usun_dzieci($commentid);
		}
		else
		{
			$query3 = "UPDATE comment SET content = 'Komentarz został usunięty' WHERE id = $commentid"
		}
	}
-->