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
				    <h3>Zarządzaj reklamami</h3>

				    <div class="container">
						<div class="row">
							<div class="col-lg-1">
							</div>
							<div class="col-lg-2">

								<div class="img thumbnail">
									<img src="img/reklama1.jpg" alt="">
								</div>

								<a href="change_add.php?add=1">
				    				<button type="button" class="btn btn-default reply">Zmień</button>
				    			</a>	

							</div>
							<div class="col-lg-2">

								<div class="img thumbnail">
									<img src="img/reklama2.jpg" alt="">
								</div>

								<a  href="change_add.php?add=2">
				    				<button type="button" class="btn btn-default reply">Zmień</button>
				    			</a>

							</div>
							<div class="col-lg-2">

								<div class="img thumbnail">
									<img src="img/reklama3.jpg" alt="">
								</div>

								<a href="change_add.php?add=3">
				    				<button type="button" class="btn btn-default reply">Zmień</button>
				    			</a>

							</div>
							<div class="col-lg-2">

								<div class="img thumbnail">
									<img src="img/reklama4.jpg" alt="">
								</div>

								<a href="change_add.php?add=4">
				    				<button type="button" class="btn btn-default reply">Zmień</button>
				    			</a>

							</div>
							<div class="col-lg-2">

								<div class="img thumbnail">
									<img src="img/reklama5.jpg" alt="">
								</div>

								<a href="change_add.php?add=5">
				    				<button type="button" class="btn btn-default reply">Zmień</button>
				    			</a>

							</div>
							<div class="col-lg-1">
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