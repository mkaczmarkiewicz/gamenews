<?php
	session_start();

	include('header.php');

	if (isset($_GET['nick'])) //jeśli formularz został przesłany
	{ 
		//czy wszystko ok
		$all_good = true;

		//walidacja nicku

		$nick = $_GET['nick'];
		$nick = htmlentities($nick, ENT_QUOTES, "UTF-8");

		if( (strlen($nick) < 3) || (strlen($nick) > 20) )
		{
			$all_good = false;
			$_SESSION['e_nick'] = "Nick musi się składać z 3 do 20 znaków";		
		}

		if(ctype_alnum($nick) == false)
		{
			$all_good = false;
			$_SESSION['e_nick'] = "Nick może składać się tylko z liter i cyfr (bez polskich znaków)";	
		}

		//walidacja email

		$email = $_GET['email'];
		$safe_email = filter_var($email, FILTER_SANITIZE_EMAIL);

		if ( (filter_var($safe_email, FILTER_VALIDATE_EMAIL) == false) || ($safe_email != $email) )
		{
			$all_good = false;
			$_SESSION['e_email'] = "Podaj poprawny adres email";
		}

		//walidacja hasła

		$password1 = $_GET['password1'];
		$password1 = htmlentities($password1, ENT_QUOTES, "UTF-8");
		$password2 = $_GET['password2'];
		$password2 = htmlentities($password2, ENT_QUOTES, "UTF-8");

		if( (strlen($password1) < 8) || (strlen($password1) > 20) )
		{
			$all_good = false;
			$_SESSION['e_password'] = "Hasło musi zawierać od 8 do 20 znaków";
		}

		if($password1 != $password2)
		{
			$all_good = false;
			$_SESSION['e_password'] = "Podane hasła nie są identyczne";
		}

		$hashed_password = password_hash($password1, PASSWORD_DEFAULT); //zahashowanie hasła

		//Zapamiętanie wprowadzonych danych

		$_SESSION['f_nick'] = $nick;
		$_SESSION['f_email'] = $email;
		$_SESSION['f_password1'] = $password1;
		$_SESSION['f_password2'] = $password2;


		//połączenie z bazą

		require_once "connect.php";

		mysqli_report(MYSQLI_REPORT_STRICT); //wyświetlaj wyjątki zamiast pełnych błędów

		try
		{
			$polaczenie = new mysqli($host, $db_user, $db_password, $db_name);

			if($polaczenie->connect_errno!=0) //wyświetl komunikat w przypadku braku połączenia z bazą
			{
				throw new Exception(mysqli_connect_errno());
			}
			else //połączenie udane
			{
				//sprawdza czy istnieje konto z takim nickiem
				$result = $polaczenie->query("SELECT id FROM user WHERE nick = '$nick'");
				
				if (!$result)
				{
					throw new Exception($polaczenie->error); //jeśli nie udało się wysłać
				} 

				$users_found = $result->num_rows; //ilość zwróconych rekordów

				if($users_found > 0) //jeśli taki użytkownik już istnieje
				{
					$all_good = false;
					$_SESSION['e_nick'] = "Nick zajęty";
				}

				//sprawdza czy istnieje konto z takim emailem
				$result = $polaczenie->query("SELECT id FROM user WHERE email = '$email'");
				
				if (!$result)
				{
					throw new Exception($polaczenie->error); //jeśli nie udało się wysłać
				} 

				$users_found = $result->num_rows; //ilość zwróconych rekordów

				if($users_found > 0) //jeśli taki użytkownik już istnieje
				{
					$all_good = false;
					$_SESSION['e_email'] = "Podany email jest już przypisany do innego konta";
				}

				//sukces walidacji
				if($all_good == true)
				{
					if($polaczenie->query("INSERT INTO user VALUES (NULL, '$nick', '$hashed_password', '$email', 'img/default_avatar.jpg', 'user', 0, 'Ustaw swój opis za pomocą przycisku na górze!')"))
					{
						$_SESSION['register_success'] = true;
						header('Location: registered.php');
					}
					else
					{
						throw new Exception($polaczenie->error);
					} 
				}

				$polaczenie->close();
			}
		}
		catch(Exception $e)
		{
			echo "Błąd serwera!".$e;
			echo NULL, "'$nick', '$hashed_password', '$email', 'avatar', 'user', 0";
		}
	}


?>

<div class="container">
	<div class="row">
		<div class="col-lg-3">
			<div class="img thumbnail">
				<img src="reklama1.jpg" alt="">
			</div>
		</div>
		<div class="col-lg-6">
			<div class="img thumbnail">
				<div class="caption post-content">
				    <h3>Załóż nowe konto</h3>
				     <div class="card">
				        <div class="card-body">
				          <!--Header-->
				          
				          <p>I dołącz do największej społeczności fanów gier wideo w Polsce!</p>

				          <br>

				          <!--Body-->
				          <form>
				          <div class="md-form">
				            <label for="form-nick">Nick</label>
				            <input type="text" required id="form-nick" name="nick" class="form-control" 
				            value="<?php if( isset($_SESSION['f_nick']) ) { echo $_SESSION['f_nick']; unset($_SESSION['f_nick']); } ?>">
				          </div>

				          <?php 
				          	if(isset($_SESSION['e_nick']))
				          	{
				          		echo '<div id="error">'.$_SESSION['e_nick'].'</div>';
				          		unset($_SESSION['e_nick']);
				          	}		          		
				          ?>

				          <div class="md-form">
				            <label for="form-email">Email</label>
				            <input type="email" required id="form-email" name="email" class="form-control"
				            value="<?php if( isset($_SESSION['f_email']) ) { echo $_SESSION['f_email']; unset($_SESSION['f_email']); } ?>">
				          </div>

				          <?php 
				          	if(isset($_SESSION['e_email']))
				          	{
				          		echo '<div id="error">'.$_SESSION['e_email'].'</div>';
				          		unset($_SESSION['e_email']);
				          	}		          		
				          ?>

				          <div class="md-form">
				            <label for="form-password">Hasło</label>
				            <input type="password" required id="form-password" name="password1" class="form-control"
				            value="<?php if( isset($_SESSION['f_password1']) ) { echo $_SESSION['f_password1']; unset($_SESSION['f_password1']); } ?>">
				          </div>

				          <?php 
				          	if(isset($_SESSION['e_password']))
				          	{
				          		echo '<div id="error">'.$_SESSION['e_password'].'</div>';
				          		unset($_SESSION['e_password']);
				          	}		          		
				          ?>

				          <div class="md-form">
				            <label for="form-password">Powtórz hasło</label>
				            <input type="password" required id="form-password" name="password2" class="form-control"
				            value="<?php if( isset($_SESSION['f_password2']) ) { echo $_SESSION['f_password2']; unset($_SESSION['f_password2']); } ?>">
				          </div>
							<br>
				          <div class="text-center mt-4">
				            <button type="submit" class="btn btn-light-blue">Załóż konto</button>
				          </div>
				      	  </form>
				        </div>
				    </div>
				</div>
			</div>
			

		</div>
		
		<div class="col-lg-3">
			<div class="img thumbnail">
				<img src="img/reklama2.jpg" alt="">
			</div>
		</div>
	</div>
</div>

</body>
</html>