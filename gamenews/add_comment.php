<?php

	session_start();

	$connect = new PDO('mysql:host=localhost;dbname=gamenews', 'root', '');

	$error = '';
	$comment_name = '';
	$comment_content = '';

	
	$comment_name = $_SESSION['nick'];
	

	if(empty($_POST["comment_content"]))
	{
		$error .= '<p class="text-danger">Content is required</p>';
	}
	else
	{
		$comment_content = $_POST["comment_content"];
	}

	if($error == '')
	{
		$query = "INSERT INTO comment 
		(idParent, content, idUser, idPost) VALUES 
		(:idParent, :content, :idUser, :idPost)";

		$statement = $connect->prepare($query);
		$statement->execute(
			array(
				':idParent' => $_POST["comment_id"],
				':content' => $comment_content,
				':idUser' => $_SESSION['id'],
				':idPost' => $_POST["post_id"]
			)
		);
		//$error = '<label class="text-success">Comment Added</label>';
	}

$data = array(
	'error' => $error
);

echo json_encode($data);

?>