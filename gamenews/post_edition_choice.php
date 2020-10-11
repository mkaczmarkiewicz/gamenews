<?php
	session_start();

	include('header.php');

	if(!isset($_SESSION['userType']) || isset($_SESSION['userType']) && $_SESSION['userType'] == "user"){
		header('Location: entry_denied.php');
	}

	$choosenPost = $_GET['choosenPost'];
?>

<div class="container">
	<div class="row">
		<!--<div class="col-lg-3">
		</div>-->

		<div class="col-lg-12">
			<div class="img thumbnail">
				<div class="caption post-content">
				    <h3>Edycja posta - co chcesz edytować?</h3>

				    <div class="container">
						<div class="row">
							<div class="col-lg-1">
							</div>
							<div class="col-lg-3">
								<a href="post_thumbnail_edition.php?choosenPost= <?php echo $choosenPost ?>">
				    				<img src="img/zmienobrazek.jpg" alt=""/>
				    			</a>								
							</div>
							<div class="col-lg-3">
								<a  href="post_text_edition.php?choosenPost= <?php echo $choosenPost ?>">
				    				<img src="img/edytujtekst.jpg" alt=""/>
				    			</a>
							</div>
							<div class="col-lg-3">
								<a href="add_tags.php?postid= <?php echo $choosenPost ?>">
				    				<img src="img/zarzadzajtagami.jpg" alt=""/>
				    			</a>
							</div>
						</div>
					</div>

				     
				</div>
			</div>
		</div>

		<!--<div class="col-lg-3">
		</div>-->
	</div>
</div>

</body>
</html>