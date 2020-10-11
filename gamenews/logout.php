<?php
	session_start();
	unset($_SESSION['id']);
	unset($_SESSION['nick']);
	unset($_SESSION['avatar']);
	unset($_SESSION['userType']);
	header('Location: main.php');
?>