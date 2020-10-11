<?php
	session_start();

	if(!isset($_SESSION['userType']) || isset($_SESSION['userType']) && $_SESSION['userType'] == "user" || isset($_SESSION['userType']) && $_SESSION['userType'] == "mod"){
		header('Location: entry_denied.php');
	}

	$choosenUser = $_GET['choosenUser'];

	require_once "connect.php";

	$connect = new PDO('mysql:host=localhost;dbname=gamenews', 'root', '');

	$query = "UPDATE user SET userType = 'user' WHERE id = $choosenUser";
	$statement = $connect->prepare($query);
	$statement->execute();

	header('Location: list_of_users.php');

?>