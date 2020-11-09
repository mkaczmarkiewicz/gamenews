<?php
	session_start();
	include('header.php');

	if(!isset($_SESSION['userType']) || isset($_SESSION['userType']) && $_SESSION['userType'] == "user"){
		header('Location: entry_denied.php');
	}

	$choosenPost = $_GET['choosenPost'];

	require_once "connect.php";

	$connect = new PDO('mysql:host='.$host.';dbname='.$db_name, $db_user, $db_password);

	$query = "SELECT * FROM post WHERE id = $choosenPost";
	$statement = $connect->prepare($query);
	$statement->execute();
	$result = $statement->fetchAll();

	foreach($result as $row)
	{
		$choosenPostTitle = $row["title"];
	}
	echo $choosenPostTitle;
?>

<div class="container">
	<div class="row">
		<div class="col-lg-1">
		</div>
		<div class="col-lg-10">
			<div class="img thumbnail">
				<div class="caption post-content">
				    <h3>Czy jesteś pewien, że chcesz usunąć post "<?php echo $choosenPostTitle ?>"?</h3>
				     <div class="card">
				        <div class="card-body">

				        	<a href="post_deleted.php?choosenPost=<?php echo $choosenPost ?>">
				    		<button type="button" class="btn btn-default reply">Tak</button>
				    		</a>
				    		<a href="list_of_posts.php">
				    		<button type="button" class="btn btn-default reply">Nie</button>
				    		</a>

				        </div>
				    </div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>