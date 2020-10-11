<?php 

	session_start();

	include('header.php');


	if(!isset($_SESSION['register_success']))
	{
		header('Location: main.php');
		exit();
	}
	else
	{
		unset($_SESSION['register_success']);
		if( isset($_SESSION['f_nick']) ) { unset($_SESSION['f_nick']); }
		if( isset($_SESSION['f_email']) ) { unset($_SESSION['f_email']); }
		if( isset($_SESSION['f_password1']) ) { unset($_SESSION['f_password1']); }
		if( isset($_SESSION['f_password2']) ) { unset($_SESSION['f_password2']); }

		if( isset($_SESSION['e_nick']) ) { unset($_SESSION['e_nick']); }
		if( isset($_SESSION['e_email']) ) { unset($_SESSION['e_email']); }
		if( isset($_SESSION['e_password1']) ) { unset($_SESSION['e_password1']); }
		if( isset($_SESSION['e_password2']) ) { unset($_SESSION['e_password2']); }
	}
?>

<div class="container">
	<div class="row">
		<div class="col-lg-1">
		</div>
		<div class="col-lg-10">
			<div class="img thumbnail">
				<div class="caption post-content">
				    <h3>Witamy na pokładzie! Aby spersonalizować swój profil, po zalogowaniu się kliknij w swój nick na pasku nawigacyjnym.</h3>
				     
				</div>
			</div>
		</div>
	</div>
</div>
	
</body>
</html>