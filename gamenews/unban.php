<?php
	session_start();
	include('header.php');

	if(!isset($_SESSION['userType']) || isset($_SESSION['userType']) && $_SESSION['userType'] == "user" || isset($_SESSION['userType']) && $_SESSION['userType'] == "mod"){
		header('Location: entry_denied.php');
	}

	$choosenUser = $_GET['choosenUser'];

	require_once "connect.php";

	$connect = new PDO('mysql:host='.$host.';dbname='.$db_name, $db_user, $db_password);

	$query = "SELECT * FROM user WHERE id = $choosenUser";
	$statement = $connect->prepare($query);
	$statement->execute();
	$result = $statement->fetchAll();

	foreach($result as $row)
	{
		$choosenUserNick = $row["nick"];
	}

?>

<div class="container">
	<div class="row">
		<div class="col-lg-1">
		</div>
		<div class="col-lg-10">
			<div class="img thumbnail">
				<div class="caption post-content">
				    <h3>Czy jesteś pewien, że chcesz przywrócić użytkownika <?php echo $choosenUserNick ?>?</h3>
				     <div class="card">
				        <div class="card-body">

				        	<a href="unbanned.php?choosenUser=<?php echo $choosenUser ?>">
				    		<button type="button" class="btn btn-default reply">Tak</button>
				    		</a>
				    		<a href="list_of_users.php">
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
