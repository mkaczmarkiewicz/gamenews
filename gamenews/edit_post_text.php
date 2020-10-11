<?php 

require_once "connect.php";

if(!isset($_SESSION['userType']) || isset($_SESSION['userType']) && $_SESSION['userType'] == "user"){
		header('Location: entry_denied.php');
	}

$content = $statusMsg = "";

if(isset($_POST['submit']))
{

	$_SESSION['f_type'] = $_POST['type'];
	$_SESSION['f_title'] = $_POST['title'];
	$_SESSION['f_intro'] = $_POST['intro'];
	$_SESSION['f_content'] = $_POST['editor'];

	$choosenPost = $_POST['choosenPost'];
	$type = $_POST['type'];
	$title = $_POST['title'];
	$intro = $_POST['intro'];
	$content = $_POST['editor'];

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
	else
	{
		$connect = new PDO('mysql:host=localhost;dbname=gamenews', 'root', '');
		$query = "UPDATE post SET type = '$type', title = '$title', intro = '$intro', content = '$content' WHERE id = $choosenPost";
		$statement = $connect->prepare($query);
		$statement->execute();
		header('Location: list_of_posts.php');
	}
}

?>