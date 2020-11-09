<?php
	session_start();

	include('header.php');

?>

<div class="container">
	<div class="row">
		<div class="col-lg-2">
		</div>
		<div class="col-lg-8">
			<div class="img thumbnail">
				<div class="caption post-content">
				    <h3>
				    	<!--<?php echo $_SESSION['nick']; ?>--> 
				    	<a href="change_avatar.php">
				    	<button type="button" class="btn btn-default reply">Zmień avatar</button></a>
				    	<a href="change_description.php">
				    	<button type="button" class="btn btn-default reply">Zmień opis</button></a>
					</h3>

				     <div class="card">
				        <div class="card-body">
	<?php

	$userid = $_SESSION['id'];

	require_once "connect.php";

	$connect = new PDO('mysql:host='.$host.';dbname='.$db_name, $db_user, $db_password);

	$query = "SELECT nick, avatar, description FROM user WHERE user.id = $userid";

	$statement = $connect->prepare($query);

	$statement->execute();

	$result = $statement->fetchAll();

	$output = '';

	$output .= '<div class="jumbotron" id="custom_padding">
				<div class="row">
					<div class="col-lg-4">
						<div class="img thumbnail">
							<img src="'.$result[0]["avatar"].'" alt=""/>
							<div class="caption post-content">
								'.$result[0]["nick"].'
							</div>
						</div>
					</div>
					<div class="col-lg-8">
						<div class="panel panel-default" style="min-height: 252px">
							<div class="panel-body" style="height:auto">'.$result[0]["description"].'</div>
						</div>
						
					</div>
				</div>';

	$query = "SELECT comment.*, nick, avatar FROM comment, user WHERE user.id = comment.idUser AND comment.idUser = $userid ORDER BY comment.id DESC";

	$statement = $connect->prepare($query);

	$statement->execute();

	$result = $statement->fetchAll();

	foreach ($result as $row) {
		$output .= '
			
				<div class="row">
					<div class="col-lg-2">
						<div class="img thumbnail">
							<img src="'.$row["avatar"].'" alt=""/>
							<div class="caption post-content">
								'.$row["nick"].'
							</div>
						</div>
					</div>
					<div class="col-lg-10">
						<div class="panel panel-default">
							<div class="panel-heading">By <b>'.$row["nick"].'</b> on <i>'.$row["date"].'</i></div>
							<div class="panel-body" style="height:auto">'.$row["content"].'</div>
							<a href="single.php?postid='.$row["idPost"].'">
							<div class="panel-footer" allign="right"><button type="button" class="btn btn-default reply" id="'.$row["id"].'">Przejdź do posta</button></div>
							</a>
						</div>
					</div>
				</div>';
	}

	$output .= '</div>';

	echo $output;
?> 






				        </div>
				    </div>
				</div>
			</div>
			

		</div>
	</div>
</div>