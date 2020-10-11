<?php
	session_start();

	include('header.php');
?>

<?php
	$postid = $_GET['postid'];

	require_once "connect.php";

	$polaczenie = @new mysqli($host, $db_user, $db_password, $db_name);

	if($polaczenie->connect_errno!=0) //wyświetl komunikat w przypadku braku połączenia z bazą
	{
		echo "Error: ".$polaczenie->connect_errno . "Description: ". $polaczenie->connect_error;
	}
	else //jeśli połączenie się powiodło
	{
		$sql = "SELECT * FROM post WHERE id=$postid";

		if($result = $polaczenie->query($sql)) //wysłanie query $sql do bazy danych, if dla bezpieczeństwa gdyby się nie udało wysłać
		{
			$amount_of_posts = $result->num_rows;
			if($amount_of_posts>0)
			{
				while($row = $result->fetch_assoc()){

					$title = $row['title'];
					$thumbnail = $row['thumbnail'];
					$intro = $row['intro'];
					$content = $row['content'];

					//wyświetlanie kolejnych newsów
					?>
					<div class="container">
						<div class="row">
							<div class="col-lg-9">
								<div class="img thumbnail">
									<img src="<?php echo $thumbnail ?>" alt=""/>
									<div class="caption post-content">
									    <h3><?php echo $title ?></h3>
									    <h4><?php echo $intro ?></h4>
									    <h5><?php echo $content ?></h5>
									</div>
									
								</div>
			
								<!--Jeśli użytkownik jest zalogowany, daj możliwość posostawienia komentarza-->

								<?php if(isset($_SESSION['nick'])){ ?>
									<form method="POST" id="comment_form">
										<div>
											<textarea name="comment_content" id="comment_content" class="form-control" placeholder="Enter Comment" rows="5"></textarea>
										</div>
										<div class="form-group">
											<input type="hidden" name="comment_id" id="comment_id" value="0" /> <!-- przekazywane do add_comment.php -->
											<input type="hidden" name="post_id" id="post_id" value="<?php echo $postid ?>" /> <!-- przekazywane do add_comment.php -->
											<input type="submit" name="submit" id="submit" class="btn btn-default" value="Wyślij"/>
										</div>
									</form>
								<?php } else { ?>
									<div class="img thumbnail">
										<div class="caption post-content">
											<h4>Zaloguj się by dodawać komentarze</h4>
											<a href="log.php">
												<button class="btn btn-default" id="login" name="login">Zaloguj</button>
											</a>
												<div class="card">
												    <div class="card-body">
												    </div>
												</div>
										</div>
									</div>
								<?php } ?>
									<span id="comment_message"></span> <!-- chyba już niepotrzebne ale boję się usunąć -->
									<br />
									<div id="display_comment"></div>

					<?php 
				}

				$result->close();

			}							
			else
			{
				echo "NIE ZNALEZIONO POSTU, PRZYKRA SPRAWA";
				
			}	
		}
	}
?>	

<!-- wyświetlanie komentarzy -->

<?php

$connect = new PDO('mysql:host=localhost;dbname=gamenews', 'root', '');

// funkcja wyświetlająca odpowiedzi pod komentarzami - rodzicami

function get_reply_comment($connect, $parent_id = 0, $marginleft = 0)
{
	$postid = $_GET['postid'];
	$query = "SELECT comment.*, nick, avatar FROM comment, user WHERE user.id = comment.idUser AND idParent = '".$parent_id."'";
	$output ="";
	$statement = $connect->prepare($query);
	$statement->execute();
	$result = $statement->fetchAll();
	$count = $statement->rowCount();
	if($parent_id == 0)
	{
		$marginleft = 0;
	}
	else
	{
		if($marginleft < 100)
		{
			$marginleft = $marginleft + 48; //przesuwanie marginesu
		}
	}
	if($count > 0)
	{
		foreach ($result as $row)  {

			if(isset($_SESSION['nick']) && $_SESSION['nick'] == $row["nick"]  || isset($_SESSION['userType']) && $_SESSION['userType'] != "user"){

				$output .= '
				<div class="jumbotron" id="custom_padding" style="margin-left:'.$marginleft.'px">
					<div class="row">
						<div class="col-lg-2">
							<a href="profile.php?userid='.$row["idUser"].'">
								<div class="img thumbnail">
									<img src="'.$row["avatar"].'" alt=""/>
									<div class="caption post-content">
										'.$row["nick"].'
									</div>
								</div>
							</a>
						</div>
						<div class="col-lg-10">
							<div class="panel panel-default">
								<div class="panel-heading">By <b>'.$row["nick"].'</b> on <i>'.$row["date"].'</i></div>
								<div class="panel-body">'.$row["content"].'</div>
								<div class="panel-footer" allign="right">
									<button type="button" class="btn btn-default reply" id="'.$row["id"].'">Odpowiedz</button>
									<a href="delete_comment.php?commentid='.$row["id"].'&postid='.$postid.'">	
										<button type="button" class="btn btn-default" id="delete">Usuń</button>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>';

			}

			else{

				$output .= '
				<div class="jumbotron" id="custom_padding" style="margin-left:'.$marginleft.'px">
					<div class="row">
						<div class="col-lg-2">
							<a href="profile.php?userid='.$row["idUser"].'">
								<div class="img thumbnail">
									<img src="'.$row["avatar"].'" alt=""/>
									<div class="caption post-content">
										'.$row["nick"].'
									</div>
								</div>
							</a>
						</div>
						<div class="col-lg-10">
							<div class="panel panel-default">
								<div class="panel-heading">By <b>'.$row["nick"].'</b> on <i>'.$row["date"].'</i></div>
								<div class="panel-body">'.$row["content"].'</div>
								<div class="panel-footer" allign="right"><button type="button" class="btn btn-default reply" id="'.$row["id"].'"> Odpowiedz</button></div>
							</div>
						</div>
					</div>
				</div>';

			}
			
			$output .= get_reply_comment($connect, $row["id"], $marginleft);
		}
	}

	return $output;
}

// wyświetlanie komentarzy - rodziców (z idParent = 0)

$query = "SELECT comment.*, nick, avatar FROM comment, user WHERE user.id = comment.idUser AND comment.idPost = $postid AND idParent = '0' ORDER BY comment.id DESC";

$statement = $connect->prepare($query);

$statement->execute();

$result = $statement->fetchAll();

$output = '';
foreach ($result as $row) {

	//jeśli użytkownik jest zalogowany i kolejny komentarz jest jego autorstwa
	
	if(isset($_SESSION['nick']) && $_SESSION['nick'] == $row["nick"] || isset($_SESSION['userType']) && $_SESSION['userType'] != "user"){

	$output .= '
		
		<div class="jumbotron" id="custom_padding">
			<div class="row">
				<div class="col-lg-2">
					<a href="profile.php?userid='.$row["idUser"].'">
						<div class="img thumbnail">
							<img src="'.$row["avatar"].'" alt=""/>
							<div class="caption post-content">
								'.$row["nick"].'
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-10">
					<div class="panel panel-default">
						<div class="panel-heading">By <b>'.$row["nick"].'</b> on <i>'.$row["date"].'</i></div>
						<div class="panel-body" style="height:auto">'.$row["content"].'</div>
						<div class="panel-footer" allign="right">
							<button type="button" class="btn btn-default reply" id="'.$row["id"].'"> Odpowiedz</button>
							<a href="delete_comment.php?commentid='.$row["id"].'&postid='.$postid.'">	
								<button type="button" class="btn btn-default" id="delete">Usuń</button>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>';

	}

	//komentarze nienależące do obecnie zalogowanego użytkownika

	else {

		$output .= '
		
		<div class="jumbotron" id="custom_padding">
			<div class="row">
				<div class="col-lg-2">
					<a href="profile.php?userid='.$row["idUser"].'">
						<div class="img thumbnail">
							<img src="'.$row["avatar"].'" id="avatar" alt=""/>
							<div class="caption post-content">
								'.$row["nick"].'
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-10">
					<div class="panel panel-default">
						<div class="panel-heading">By <b>'.$row["nick"].'</b> on <i>'.$row["date"].'</i></div>
						<div class="panel-body" style="height:auto">'.$row["content"].'</div>
						<div class="panel-footer" allign="right"><button type="button" class="btn btn-default reply" id="'.$row["id"].'"> Odpowiedz</button></div>
					</div>
				</div>
			</div>
		</div>';
	}

	$output .= get_reply_comment($connect, $row["id"]);
}

echo $output;

?> 

							</div>
		
							<div class="col-lg-3">
								<div class="img thumbnail">
									<img src="img/reklama1.jpg" alt="">
								</div>
								<div class="img thumbnail">
									<img src="img/reklama2.jpg" alt="">
								</div>
								<div class="img thumbnail">
									<img src="img/reklama3.jpg" alt="">
								</div>
								<div class="img thumbnail">
									<img src="img/reklama4.jpg" alt="">
								</div>
								<div class="img thumbnail">
									<img src="img/reklama5.jpg" alt="">
								</div>
							</div>

						</div>
					</div>

<!-- zapisanie komentarza (wywołuje add_comment.php) -->
		
<script>
	$(document).ready(function(){
		$('#comment_form').on('submit', function(event){
			event.preventDefault();
			var form_data = $(this).serialize();
			$.ajax({
				url:"add_comment.php",
				method:"POST",
				data:form_data,
				dataType:"JSON",
				success:function(data)
				{
					if(data.error != '')
					{
						$('#comment_form')[0].reset();
						$('#comment_message').html(data.error);
					}
					window.location.reload();
				}
			})
		});

/*		load_comment();

		function load_comment()
		{
			$.ajax({
				url:"fetch_comment.php",
				method:"POST",
				success:function(data)
				{
					$('#comment_message').html(data);
				}
			})
		}*/
	});
	
</script>

<?php if(isset($_SESSION['nick'])){ ?>
	<script>
		$(document).on('click', '.reply', function(){ //po wciśnięciu reply button gdy użytkownik jest zalogowany
			var comment_id = $(this).attr("id"); //
			$('#comment_id').val(comment_id);
			$('#comment_content').focus();			
		});
	</script>
<?php }else{ ?>
	<script>
		$(document).on('click', '.reply', function(){ //po wciśnięciu reply button gdy nie jest zalogowany
			var comment_id = $(this).attr("id"); //
			$('#comment_id').val(comment_id);
			$('#login').focus();		
		});
	</script>			
<?php } ?>

</body>
</html>