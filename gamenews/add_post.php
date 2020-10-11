<?php 

require_once "connect.php";

$content = $statusMsg = "";

if(isset($_POST['submit']))
{

	$_SESSION['f_type'] = $_POST['type'];
	$_SESSION['f_title'] = $_POST['title'];
	$_SESSION['f_intro'] = $_POST['intro'];
	$_SESSION['f_content'] = $_POST['editor'];

	$type = $_POST['type'];
	$title = $_POST['title'];
	$title = htmlentities($title, ENT_QUOTES, "UTF-8");
	$intro = $_POST['intro'];
	$content = $_POST['editor'];
	$idUser = $_SESSION['id'];
	$thumbnail =$_SESSION['path'];

	if(empty($type))
	{
		$statusMsg = 'Wybierz typ posta';
	}
	else if(empty($title))
	{
		$statusMsg = 'Uzupełnij tytuł posta';
	}
	else if(empty($intro))
	{
		$statusMsg = 'Uzupełnij wstęp do posta';
	}
	else if(empty($content))
	{
		$statusMsg = 'Uzupełnij treść posta';
	}
	else if(empty($thumbnail)) 
	{
		$statusMsg = 'Załącz miniaturkę do posta';
	}
	else
	{
		$db = @new mysqli($host, $db_user, $db_password, $db_name);
		$insert = $db->query("INSERT INTO post (type, title, intro, content, idUser, date, thumbnail) VALUES ('".$type."', '".$title."', '".$intro."', '".$content."', '".$idUser."', NOW(), '".$thumbnail."')");

		if($insert)
		{
			
				if($result = $db->query("SELECT * FROM post WHERE id=(SELECT max(id) FROM post)"))
				{
					$row = $result->fetch_assoc();

					$postid = $row['id'];

					header('Location: add_tags.php?postid='.$postid);				
				}
			
		}
		else
		{
			$statusMsg = "Coś poszło nie tak";
		}
	}
}

?>