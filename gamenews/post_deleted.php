<?php
	session_start();



	$choosenPost = $_GET['choosenPost'];

	require_once "connect.php";

	if(!isset($_SESSION['userType']) || isset($_SESSION['userType']) && $_SESSION['userType'] == "user"){
		header('Location: entry_denied.php');
	}

	require_once "connect.php";

	$connect = new PDO('mysql:host='.$host.';dbname='.$db_name, $db_user, $db_password);

	$query = "DELETE FROM post WHERE id = $choosenPost";
	$statement = $connect->prepare($query);
	$statement->execute();

	$query = "DELETE FROM tag_post_relation WHERE idPost = $choosenPost";
	$statement = $connect->prepare($query);
	$statement->execute();

	header('Location: list_of_posts.php');

?>