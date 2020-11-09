<?php
	session_start();
	include('header.php');

	if(!isset($_SESSION['userType']) || isset($_SESSION['userType']) && $_SESSION['userType'] == "user"){
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

							$query = "SELECT * FROM post";
							$statement = $connect->prepare($query);
							$statement->execute();
							$result = $statement->fetchAll();

									print("<table>
										<thead>
											<tr>
												<td>ID</td>
												<td>Title</td>
												<td>Author</td>
												<td></td>
												<td></td>
											</tr>
										</thead>
										<tbody>");

									foreach ($result as $row) 
									{
										print("<tr>
											<td>".$row['id']."</td>
											<td align='left'>".$row['title']."</td>
											<td>".$row['idUser']."</td>
											<td><a href='post_edition_choice.php?choosenPost=".$row['id']."'>Edytuj</a></td>
											<td><a href='delete_post.php?choosenPost=".$row['id']."'>Usuń</a></td>
											</tr>
											");
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