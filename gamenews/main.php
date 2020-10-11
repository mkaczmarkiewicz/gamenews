<?php
	session_start();

	include('header.php');
?>
	
<div class="container">
	<div class="row">
		<div class="col-lg-9">
				<?php
					require_once "connect.php";

					if(isset($_GET['page'])){
						$page = $_GET['page'];
					}else{
						$page = 0;
					}
					
					$news_per_page = 5;
					$skipped_news = $page * $news_per_page;

					$polaczenie = @new mysqli($host, $db_user, $db_password, $db_name);

					if($polaczenie->connect_errno!=0) //wyświetl komunikat w przypadku braku połączenia z bazą
					{
						echo "Error: ".$polaczenie->connect_errno . "Description: ". $polaczenie->connect_error;
					}
					else //jeśli połączenie się powiodło
					{
						$sql = "SELECT * FROM post WHERE type = 'news' ORDER BY id DESC LIMIT $news_per_page OFFSET $skipped_news";

						if($result = $polaczenie->query($sql)) //wysłanie query $sql do bazy danych, if dla bezpieczeństwa gdyby się nie udało wysłać
						{
							$amount_of_posts = $result->num_rows;
							if($amount_of_posts>0)
							{
								while($row = $result->fetch_assoc()){

									$id = $row['id'];
									$title = $row['title'];
									$thumbnail = $row['thumbnail'];
									$intro = $row['intro'];

									//wyświetlanie kolejnych newsów
									?>
									<a href="single.php?postid= <?php echo $id ?>"> 
										<div class="img thumbnail">
											<img src="<?php echo $thumbnail; ?>" alt=""/>
											<div class="caption post-content">
											    <h4><?php echo $title; ?></h4>
											    <h5><?php echo $intro; ?></h5>
											</div>
										</div>
									</a>
									<?php 

								}
								if($amount_of_posts<5){ //jeśli ilość wyświetlonych postów jest mniejsza niż ustalona (tj są to ostatnie posty) zachowuje informacje o tym
									$end_of_posts = true;
								}

								$result->close();

								$next_page = $page +1;
								$previous_page = $page-1;

							}							

							else
							{
								$no_posts_info = 
								'<div class="img thumbnail">
									<div class="caption post-content">
										<h3>Brak postów do wyświetlenia!</h3>
									</div>
								</div>"';
								echo $no_posts_info;
								$end_of_posts = true;
							}
						}
					}

				?>

				<?php if($page>0){ ?>
					<a href="main.php?page= <?php echo $previous_page ?>">				
						<button class="btn btn-default" name="previous" id="buttons">Cofnij</button>
					</a>
				<?php } ?>	

				<?php if(!isset($end_of_posts)){ ?>
					<a href="main.php?page= <?php echo $next_page ?>">
						<button class="btn btn-default" name="next" id="buttons">Dalej</button>
					</a>
				<?php } ?>	

						
			
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

</body>
</html>
