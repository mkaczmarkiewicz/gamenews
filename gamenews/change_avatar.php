<?php
	session_start();

	include('header.php');

	if (isset($_POST['upload'])) {

		$file_name = "avatar".$_SESSION['id'].".jpg";
		$file_type = $_FILES['file']['type'];
		$file_size = $_FILES['file']['size'];
		$file_tem_loc = $_FILES['file']['tmp_name'];
		$file_store = "img/".$file_name;

		if(@is_array(getimagesize($_FILES['file']['tmp_name']))){   		

			list($width, $height) = getimagesize($_FILES['file']['tmp_name']);

			if($width == $height){

				if( move_uploaded_file($file_tem_loc, $file_store) ){

					$userid = $_SESSION['id'];

					require_once "connect.php";

					$polaczenie = new mysqli($host, $db_user, $db_password, $db_name);

					if($polaczenie->connect_errno!=0) //wyświetl komunikat w przypadku braku połączenia z bazą
					{
						throw new Exception(mysqli_connect_errno());
					}else{

						$result = $polaczenie->query("UPDATE user SET avatar = '$file_store' WHERE user.id = '$userid'");
							
						if (!$result)
						{
							throw new Exception($polaczenie->error); //jeśli nie udało się wysłać
						} 
					}

					$polaczenie->close();

					header('Location: myprofile.php');
				}
			}
			else
			{
				$statusMsg = "Obrazek musi być kwadratowy!";
			}

		} 
		else 
		{
		    $statusMsg = "Plik który udostępniłeś nie jest obrazkiem!";
		}

	}
?>

<!DOCTYPE html>
<head>
	
</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-lg-3">
			<div class="img thumbnail">
				<img src="reklama1.jpg" alt="">
			</div>
		</div>
		<div class="col-lg-6">
			<div class="img thumbnail">
				<div class="caption post-content">
				    <h3>Zmień swój awatar</h3>
				     <div class="card">
				        <div class="card-body">

							<form action = "?" method = "POST" enctype = "multipart/form-data">
								<p><input type="file" name="file"></p>
								<p><input type="submit" name="upload" value="Zatwierdź"></p>
							</form>

							<?php if(!empty($statusMsg)) { ?>
				          		<p class="stmsg"><?php echo $statusMsg; ?></p>
				          	<?php } ?>

						</div>
				    </div>
				</div>
			</div>
			

		</div>
		
		<div class="col-lg-3">
			<div class="img thumbnail">
				<img src="reklama1.jpg" alt="">
			</div>
		</div>
	</div>
</div>

</body>