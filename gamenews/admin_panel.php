<?php
	session_start();

	include('header.php');

	if(!isset($_SESSION['userType']) || isset($_SESSION['userType']) && $_SESSION['userType'] == "user" || isset($_SESSION['userType']) && $_SESSION['userType'] == "mod"){
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
				    <h3>Panel administratora</h3>

				    <div class="container">
						<div class="row">
							<div class="col-lg-3">
								<div class="row">
									<div class="col-lg-9">
										<div class="img thumbnail">
											<a href="post_thumbnail.php">
							    				<img src="img/dodajpost.jpg" alt=""/>
							    			</a>			
						    			</div>
						    		</div>
						    	</div>					
							</div>
							<div class="col-lg-3">
								<div class="row">
									<div class="col-lg-9">
										<div class="img thumbnail">
											<a  href="list_of_posts.php">
							    				<img src="img/zarzadzajpostami.jpg" alt=""/>
							    			</a>
							    		</div>
							    	</div>
							    </div>
							</div>
							<div class="col-lg-3">
								<div class="row">
									<div class="col-lg-9">
										<div class="img thumbnail">
											<a href="list_of_users.php">
							    				<img src="img/zarzadzajuzytkownikami.jpg" alt=""/>
							    			</a>
							    		</div>
							    	</div>
							    </div>
							</div>
							<div class="col-lg-3">
								<div class="row">
									<div class="col-lg-9">
										<div class="img thumbnail">
											<a href="list_of_ads.php">
							    				<img src="img/zarzadzajreklamami.jpg" alt=""/>
							    			</a>
						    			</div>
						    		</div>
						    	</div>
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