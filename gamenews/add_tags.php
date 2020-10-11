<?php
session_start();
include('header.php');

	if(!isset($_SESSION['userType']) || isset($_SESSION['userType']) && $_SESSION['userType'] == "user"){
		header('Location: entry_denied.php');
	}

	$postid = $_GET['postid'];

	if (isset($_GET['tag'])){ 

		require_once "connect.php";

		$polaczenie = @new mysqli($host, $db_user, $db_password, $db_name);

		if($polaczenie->connect_errno!=0) //wyświetl komunikat w przypadku braku połączenia z bazą
		{
			echo "Error: ".$polaczenie->connect_errno . "Description: ". $polaczenie->connect_error;
		}
		else //jeśli połączenie się powiodło
		{
			$tag = $_GET['tag']; 
			$polaczenie->query("INSERT INTO tag VALUES ('$tag')");
			$polaczenie->query("INSERT INTO tag_post_relation VALUES ('$tag', '$postid')");
		}
	}
?>

<div class="container">
	<div class="row">

		<div class="col-lg-6">
			<div class="img thumbnail">
				<div class="caption post-content">
				    <h3>Dodaj tagi:</h3>
				    <div class="card">
				        <div class="card-body">
				          	<form>
						         <div class="md-form">
						         	<input type="hidden" id="postid" name="postid" value="<?php echo $postid ?>">
						            <label for="form-tag">Wprowadź nowy tag:</label>
						            <input type="text" required id="form-tag" name="tag" class="form-control">
						          </div>
									<br>
						          <div class="text-center mt-4">
						            <button type="submit" class="btn btn-light-blue">Dodaj</button>
						          </div>
						     </form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-6">
			<div class="img thumbnail">
				<div class="caption post-content">
				     <div class="card">
				        <div class="card-body">

				        	<?php
				        	print("<table>
										<thead>
											<tr>
												<td>Dodane tagi:</td>
												<td></td>
											</tr>
										</thead>
										<tbody>");
				          
				          	

				          	$connect = new PDO('mysql:host=localhost;dbname=gamenews', 'root', '');
							$query = "SELECT tagName FROM tag_post_relation WHERE idPost = $postid"; 
							$statement = $connect->prepare($query);
							$statement->execute();
							$result = $statement->fetchAll();

							foreach ($result as $row) 
							{
								//echo $row['tagName'].'<br />';

								print("<tr>
												<td>".$row['tagName']."</td>
												<td><a href='delete_tag.php?tagName=".$row['tagName']."&postid=".$postid."'>Usuń</a></td>
												</tr>
												");
							}

							?>

				          	<br>
				          	
				        </div>
				    </div>
				</div>
			</div>
		</div>

	</div>
</div>

</body>
</html>