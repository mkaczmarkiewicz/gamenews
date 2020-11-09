<?php
	session_start();
	include('header.php');

	if(!isset($_SESSION['userType']) || isset($_SESSION['userType']) && $_SESSION['userType'] == "user" || isset($_SESSION['userType']) && $_SESSION['userType'] == "mod"){
		header('Location: entry_denied.php');
	}
?>

<div class="container">
	<div class="row">

		<div class="col-lg-12">
			<div class="img thumbnail">
				<div class="caption post-content">
				    <h3>Lista użytkowników</h3>
				     <div class="card">
				        <div class="card-body">
				          				       
				          <?php		

				          	require_once "connect.php";

							$connect = new PDO('mysql:host='.$host.';dbname='.$db_name, $db_user, $db_password);

							$query = "SELECT * FROM user";
							$statement = $connect->prepare($query);
							$statement->execute();
							$result = $statement->fetchAll();

									print("<table>
										<thead>
											<tr>
												<td>id</td>
												<td>nick</td>
												<td>email</td>
												<td>typ</td>
												<td></td>
												<td></td>
											</tr>
										</thead>
										<tbody>");

									foreach ($result as $row) {

										if($row['userType'] == 'user' && $row['banned'] == 0){

											print("<tr>
												<td>".$row['id']."</td>
												<td>".$row['nick']."</td>
												<td>".$row['email']."</td>
												<td>".$row['userType']."</td>
												<td><a href='promote.php?choosenUser=".$row['id']."'>Awansuj</a></td>
												<td><a href='ban.php?choosenUser=".$row['id']."'>Banuj</a></td>
												</tr>
												");
										}
										else if($row['userType'] == 'user' && $row['banned'] == 1)
										{
											print("<tr>
												<td>".$row['id']."</td>
												<td>".$row['nick']."</td>
												<td>".$row['email']."</td>
												<td>".$row['userType']."</td>
												<td><a href='promote.php?choosenUser=".$row['id']."'>Awansuj</a></td>
												<td><a href='unban.php?choosenUser=".$row['id']."'>Przywróć</a></td>
												</tr>
												");
										}
										else if($row['userType'] == 'mod' && $row['banned'] == 0)
										{
											print("<tr>
												<td>".$row['id']."</td>
												<td>".$row['nick']."</td>
												<td>".$row['email']."</td>
												<td>".$row['userType']."</td>
												<td><a href='degrade.php?choosenUser=".$row['id']."'>Zdegraduj</a></td>
												<td><a href='ban.php?choosenUser=".$row['id']."'>Banuj</a></td>
												</tr>
												");
										}
										else if($row['userType'] == 'mod' && $row['banned'] == 1)
										{
											print("<tr>
												<td>".$row['id']."</td>
												<td>".$row['nick']."</td>
												<td>".$row['email']."</td>
												<td>".$row['userType']."</td>
												<td><a href='degrade.php?choosenUser=".$row['id']."'>Zdegraduj</a></td>
												<td><a href='unban.php?choosenUser=".$row['id']."'>Przywróć</a></td>
												</tr>
												");
										}
										else
										{
											print("<tr>
												<td>".$row['id']."</td>
												<td>".$row['nick']."</td>
												<td>".$row['email']."</td>
												<td>".$row['userType']."</td>
												<td></td>
												<td></td>
												</tr>
												");
										}

									}

									print("</tbody>
									</table>");
								

							?>

				        </div>
				    </div>
				</div>
			</div>
		</div>
	</div>
</div>



</body>
</html>


