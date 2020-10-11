<?php
	session_start();

	include('header.php');

	if(!isset($_SESSION['userType']) || isset($_SESSION['userType']) && $_SESSION['userType'] == "user" || isset($_SESSION['userType']) && $_SESSION['userType'] == "mod"){
		header('Location: entry_denied.php');
	}

	if(isset($_GET['add']))
	{
		$add_nr = $_GET['add'];
	}
	else
	{
		$add_nr = $_POST['add'];
	}

	if (isset($_POST['upload'])) {

		$file_name = "reklama".$add_nr.".jpg";
		$file_type = $_FILES['file']['type'];
		$file_size = $_FILES['file']['size'];
		$file_tem_loc = $_FILES['file']['tmp_name'];
		$file_store = "img/".$file_name;

		if(@is_array(getimagesize($_FILES['file']['tmp_name']))){

			list($width, $height) = getimagesize($_FILES['file']['tmp_name']);

			if($width == 300 && $height == 600){

				if( move_uploaded_file($file_tem_loc, $file_store) ){

					header('Location: list_of_ads.php');
				}
			}
			else
			{
				$statusMsg = "Obrazek musi mieć wymiary 300x600!";
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
				    <h3>Zmień reklamę</h3>
				     <div class="card">
				        <div class="card-body">

							<form action = "?" method = "POST" enctype = "multipart/form-data">
								<input type="hidden" id="add" name="add" value="<?php echo $add_nr ?>">
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