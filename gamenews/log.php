<?php
	session_start();
	include('header.php');

	//jeśli formularz został przesłany

	if (isset($_GET['nick'])){ 

		require_once "connect.php";

		$polaczenie = @new mysqli($host, $db_user, $db_password, $db_name);

		if($polaczenie->connect_errno!=0) //wyświetl komunikat w przypadku braku połączenia z bazą
		{
			echo "Error: ".$polaczenie->connect_errno . "Description: ". $polaczenie->connect_error;
		}
		else //jeśli połączenie się powiodło
		{
			$nick = $_GET['nick'];
			$password = $_GET['password'];

			$nick = htmlentities($nick, ENT_QUOTES, "UTF-8");
			

			if($result = $polaczenie->query( //wysłanie query $sql do bazy danych, if dla bezpieczeństwa gdyby się nie udało wysłać
			sprintf("SELECT * FROM user WHERE nick='%s'", //zmienne użyte w zapytaniu zapisane jako %s - string
			mysqli_real_escape_string($polaczenie, $nick)))) //%s
			{
				$amount_of_users = $result->num_rows;
				if($amount_of_users>0)
				{
					$row = $result->fetch_assoc();

					//udane logowanie
					if (password_verify($password, $row['password']))
					{
						if($row['banned'] == 1)
						{
							header('Location: banned_info.php');
						}
						else{

							$_SESSION['id'] = $row['id'];
							$_SESSION['nick'] = $row['nick'];
							$_SESSION['avatar'] = $row['avatar'];
							$_SESSION['userType'] = $row['userType'];

							$result->close();

							if( isset($_SESSION['e_login']) ) { unset($_SESSION['e_login']); }
							header('Location: main.php');
							exit();
						}
					}
					else //błędne hasło
					{
						$_SESSION['e_login'] = "Błędna nazwa lub hasło";
					}
				} //brak usera o tym nicku
				else
				{
					$_SESSION['e_login'] = "Błędna nazwa lub hasło";
				}
			}

			else
			{
				echo "Błąd połączenia z bazą";
			}

			$polaczenie->close();
		}
	}
?>

<div class="container">
	<div class="row">

		<div class="col-lg-6">
			<div class="img thumbnail">
				<div class="caption post-content">
				    <h3>Zaloguj się na swoje konto</h3>
				     <div class="card">
				        <div class="card-body">
				          <!--Header-->
				          
				          <!--Formularz-->
				          <form>
				         <div class="md-form">
				            <label for="form-nick">Nick</label>
				            <input type="text" required id="form-nick" name="nick" class="form-control">
				          </div>

				          <?php 
				          	if(isset($_SESSION['e_login']))
				          	{
				          		echo '<div id="error">'.$_SESSION['e_login'].'</div>';
				          		unset($_SESSION['e_login']);
				          	}		          		
				          ?>

				          <div class="md-form">
				            <label for="form-password">Hasło</label>
				            <input type="password" required id="form-password" name="password" class="form-control">
				          </div>
							<br>
				          <div class="text-center mt-4">
				            <button type="submit" class="btn btn-light-blue">Zaloguj</button>
				          </div>
				      </form>
				        </div>
				    </div>
				</div>
			</div>
		</div>

		<div class="col-lg-6">
			<div class="img thumbnail">
				<div class="caption post-content">
				    <h3>Nie masz konta? Zarejestruj się!</h3>
				     <div class="card">
				        <div class="card-body">
				          <!--Header-->
				          
				          	<p>Dołącz do największej społeczności fanów gier wideo w Polsce!</p>

				          	<br>
				          	<div class="text-center mt-4">
				          	<a href="register.php">
								<button class="btn btn-light-blue" name="next">Załóż konto</button>
							</a>
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