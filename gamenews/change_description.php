<?php
	session_start();

	include('header.php');

	require_once "connect.php";

	$connect = new PDO('mysql:host='.$host.';dbname='.$db_name, $db_user, $db_password);

	$userid = $_SESSION['id'];

	$query = "SELECT description FROM user WHERE id = $userid";
	$statement = $connect->prepare($query);
	$statement->execute();
	$result = $statement->fetchAll();

	$desc_of_user = $result[0]['description'];

	if(isset($_POST['submit'])){
		if(empty($_POST['editor']))
		{
			$statusMsg = "Uzupełnij opis!";
		}
		else
		{
			$description = $_POST['editor'];
			$description = htmlentities($description, ENT_QUOTES, "UTF-8");

			$query = "UPDATE user SET description =  '$description' WHERE user.id = '$userid'";
			$statement = $connect->prepare($query);
			$statement->execute();
			header('Location: myprofile.php');
		}
	}
	
?>

<div class="container">
	<div class="row">
		<div class="col-lg-2">
			
		</div>
		<div class="col-lg-8">
			<div class="img thumbnail">
				<div class="caption post-content">
				    <h3>Ustaw swój opis</h3>
				     <div class="card">
				        <div class="card-body">

							<form action = "?" method = "POST">
								<div class="md-form">
					          	<textarea name="editor" id="editor" rows="10" cols="80"><?php echo $desc_of_user;  ?></textarea>
				          	</div>
							
							<input type="submit" name="submit" value="Ustaw">

							</form>

							<?php if(!empty($statusMsg)) { ?>
				          		<p class="stmsg"><?php echo $statusMsg; ?></p>
				          	<?php } ?>

						</div>
				    </div>
				</div>
			</div>
			

		</div>
		
		<div class="col-lg-2">
			
		</div>
	</div>
</div>

</body>