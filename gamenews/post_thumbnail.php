<?php
	session_start();

	include('header.php');

	if(!isset($_SESSION['userType']) || isset($_SESSION['userType']) && $_SESSION['userType'] == "user"){
		header('Location: entry_denied.php');
	}

	if (isset($_POST['upload'])) {

		$file_name = $_FILES['file']['name'];
		$file_type = $_FILES['file']['type'];
		$file_size = $_FILES['file']['size'];
		$file_tem_loc = $_FILES['file']['tmp_name'];
		$file_store = "img/".$file_name;

		if(@is_array(getimagesize($_FILES['file']['tmp_name']))){
    		$image = true;	

			list($width, $height) = getimagesize($_FILES['file']['tmp_name']);

			if($width == 1920 && $height == 1080 || $width == 1280 && $height == 720 || $width == 854 && $height == 480){

				if( move_uploaded_file($file_tem_loc, $file_store) ){
					$_SESSION['path'] = $file_store;
					header('Location: post_form.php');
				}
				else
				{
					echo "Coś poszło nie tak";
				}
			}
			else
			{
				$statusMsg = "Dopuszczalne rozmiary obrazka to 720p i 1080p!";
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
			
		</div>
		<div class="col-lg-6">
			<div class="img thumbnail">
				<div class="caption post-content">
				    <h3>Dodaj obrazek dla posta</h3>
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
			
		</div>
	</div>
</div>

</body>