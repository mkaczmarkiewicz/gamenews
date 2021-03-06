<?php
	session_start();

	include('header.php');

	if(!isset($_SESSION['userType']) || isset($_SESSION['userType']) && $_SESSION['userType'] == "user"){
		header('Location: entry_denied.php');
	}

	include_once 'edit_post_text.php';

	if(!isset($_POST['submit']))
	{
		$choosenPost = $_GET['choosenPost'];

		require_once "connect.php";

		$connect = new PDO('mysql:host='.$host.';dbname='.$db_name, $db_user, $db_password);

		$query = "SELECT * FROM post WHERE id = $choosenPost";
		$statement = $connect->prepare($query);
		$statement->execute();
		$result = $statement->fetchAll();
		foreach ($result as $row) 
		{
			$_SESSION['f_type'] = $row['type'];
			$_SESSION['f_title'] = $row['title'];
			$_SESSION['f_intro'] = $row['intro'];
			$_SESSION['f_content'] = $row['content'];
		}
	}
?>

<div class="container">
	<div class="row">
		<div class="col-lg-1">
		</div>
		<div class="col-lg-10">
			<div class="img thumbnail">
				<div class="caption post-content">
				    <h3>Dodaj nowy post</h3>
				     <div class="card">
				        <div class="card-body">
				            </br>
  
				            <form method="post" action="">

				            <div class="md-form">
				              	<label for="form-type">Type</label>
				              	<select name="type" id="type" class="form-control">
								  <option value="news">News</option>
								  <option value="article">Artykuł</option>
								  <option value="review">Recenzja</option>
								  <option selected="<?php if( isset($_SESSION['f_type']) ) { echo $_SESSION['f_type']; unset($_SESSION['f_type']); } else{ echo 'Wybierz typ'; } ?>"><?php if( isset($_SESSION['f_type']) ) { echo $_SESSION['f_type']; unset($_SESSION['f_type']); } else{ echo 'Wybierz typ'; } ?></option>
								</select>
				             	<!-- <input type="text"  name="type" id="type" class="form-control" value="<?php if( isset($_SESSION['f_type']) ) { echo $_SESSION['f_type']; unset($_SESSION['f_type']); } ?>"> -->
				            </div>

				            <!-- <div class="md-form">
				              	<label for="form-thumbnail">Thumbnail</label>
				             	<input type="text"  name="thumbnail" id="thumbnail" class="form-control">
				            </div> -->

				            <div class="md-form">
				              	<label for="form-title">Tytuł</label>
				             	<input type="text"  name="title" id="title" class="form-control"
				             	value="<?php if( isset($_SESSION['f_title']) ) { echo $_SESSION['f_title']; unset($_SESSION['f_title']); } ?>">
				            </div>

				            </br>
				          	
				          	<div class="md-form">
				          		<label for="form-intro">Wstęp</label>
				          		<textarea name="intro" id="intro" rows="10" cols="80">
				          			<?php if( isset($_SESSION['f_intro']) ) { echo $_SESSION['f_intro']; unset($_SESSION['f_intro']); } ?>
				          		</textarea>
				          	</div>

				          	</br>

				          	<input type="hidden" id="choosenPost" name="choosenPost" value="<?php echo $choosenPost ?>">
				          	
				          	<div class="md-form">
					          	<label for="form-editor">Treść posta</label>
					          	<textarea name="editor" id="editor" rows="10" cols="80">
					          		<?php if( isset($_SESSION['f_content']) ) { echo $_SESSION['f_content']; unset($_SESSION['f_content']); } ?>
					          	</textarea>
				          	</div>

				          	</br>
				          				          	
				          	<?php if(!empty($statusMsg)) { ?>
				          		<p class="stmsg"><?php echo $statusMsg; ?></p>
				          	<?php } ?>

				          	<input type="submit" name="submit" value="Akceptuj">
				          </form>

				        </div>
				    </div>
				</div>
			</div>			
		</div>
	</div>
</div>

<script>
	CKEDITOR.replace('intro');
	CKEDITOR.replace('editor');
</script>
</body>
</html>