<?php
	session_start();

	include('header.php');

	if(!isset($_SESSION['userType']) || isset($_SESSION['userType']) && $_SESSION['userType'] == "user"){
		header('Location: entry_denied.php');
	}
?>

<div class="container">
	<div class="row">
		<!--<div class="col-lg-3">
		</div>-->

		<div class="col-lg-12">
			<div class="img thumbnail">
				<div class="caption post-content">
				    <h3>Panel moderatora</h3>

				    <div class="container">
						<div class="row">
							<div class="col-lg-2">								
							</div>
							<div class="col-lg-3">
								<div class="img thumbnail">
									<a href="post_thumbnail.php">
					    				<img src="img/dodajpost.jpg" alt=""/>
					    			</a>	
					    		</div>							
							</div>
							<div class="col-lg-2">								
							</div>
							<div class="col-lg-3">
								<div class="img thumbnail">
									<a  href="list_of_posts.php">
					    				<img src="img/zarzadzajpostami.jpg" alt=""/>
					    			</a>
					    		</div>
							</div>							
							<div class="col-lg-2">								
							</div>
						</div>
					</div>

				     
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>