<?php

if (isset($_POST['search'])) {
	$search = $_POST['search'];
	header('Location: search.php?search='.$search);
}

?>

<!DOCTYPE html>
<html lang="pl">
<head>

	<script src="//cdn.ckeditor.com/4.13.0/standard/ckeditor.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<title>Game News</title>

	<link rel="stylesheet" href="styles.css" type="text/css" />

	

</head>
<body class="hasSkin">



<div class='container'>
	<nav class="navbar navbar-default rounded">
		<div class='container'>
		<div class="navbar-header">
			<a href="main.php?page=0" class="navbar-brand">GameNews</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="search.php?search=ps4"><i class="fab fa-playstation"></i> PS4</a></li>
			<li><a href="search.php?search=x1"><i class="fab fa-xbox"></i> X1</a></li>
			<li><a href="search.php?search=ns"><i class="fab fa-nintendo-switch"> NS</i></a></li>
			<li><a href="search.php?search=pc"><i class="fas fa-desktop"></i> PC</a></li>
			<li><a href="reviews.php">Recenzje</a></li>
			<li><a href="articles.php">Artykuły</a></li>
			<li><div class="search-container">
				<form action = "?" method = "POST">
					<input type="text" id="navbar-search" placeholder="Wyszukaj..." name="search">
				</form>
			</div></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<?php if(!isset($_SESSION['nick'])){ ?>
				<li><a href="register.php"><i class="fas fa-user-plus"></i> Zarejestruj </a></li>
				<li><a href="log.php"><i class="fas fa-user"></i> Zaloguj </a></li>
			<?php }else{ ?>
				<?php if(isset($_SESSION['userType']) && $_SESSION['userType'] == "admin"){ ?>
					<li><a href="admin_panel.php"><i class="fas fa-users-cog"></i> Panel admina </a></li>
				<?php } else if (isset($_SESSION['userType']) && $_SESSION['userType'] == "mod"){ ?>
					<li><a href="mod_panel.php"><i class="fas fa-users-cog"></i> Panel moderatora </a></li>
				<?php } ?>
				<li><a href="myprofile.php"><i class="fas fa-user"></i> <?php echo $_SESSION['nick']; ?> </a></li>
				<li><a href="logout.php"><i class="fas fa-user"></i> Wyloguj </a></li>
			<?php } ?>
			<li><a href="#">	</a></li>
		</ul>
	</div>
	</nav>
</div>