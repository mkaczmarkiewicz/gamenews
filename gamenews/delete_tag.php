<?php
	session_start();

	if(!isset($_SESSION['userType']) || isset($_SESSION['userType']) && $_SESSION['userType'] == "user"){
		header('Location: entry_denied.php');
	}

	$postid = $_GET['postid'];
	$tagName = $_GET['tagName'];

	require_once "connect.php";

	$connect = new PDO('mysql:host='.$host.';dbname='.$db_name, $db_user, $db_password);

	$query = "DELETE FROM tag_post_relation WHERE idPost = $postid && tagName = '$tagName'";
	$statement = $connect->prepare($query);
	$statement->execute();

	header('Location: add_tags.php?postid='.$postid);

?>