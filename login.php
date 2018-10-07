<?php
// (c) Harshal Gajjar (gotoharshal@gmail.com)
// This code is available under GNU General Public Licence v3

session_start(); //starting session
//session variables:
//$_SESSION['login'], $_SESSION['username'], $_SESSION['level'], $_SESSION['name']
?>

<!DOCTYPE html>
<html lang="en-US">
<head>
<title>Login - Court</title>
    <meta type="robots" content="nofollow">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>-->
	<link rel="stylesheet" href="bootstrap.min.css">
	<script src="jquery.min.js"></script>
	<script src="bootstrap.min.js"></script>
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="style_login.css">
</head>
<body>

<?php
$error = ""; //preset message shown on invalid login attempt

//error_reporting(0);

if(isset($_SESSION['login']) && $_SESSION['login']=="success"){
	header('Location:admin.php'); //redirecting already logged in user
}

if(isset($_POST['login_submit'])){ //if submit button clicked

	$username=str_replace(";","",str_replace("--","",str_replace("#","",$_POST['username']))); //removing sql injection attempt
	$password=sha1($_POST['password']); //hashing password

	include_once "connections/connect.php"; //connecting to database

	if(preg_match("/DROP/i",$username) OR preg_match("/DELETE/i",$username)){ //if DROP or DELETE found in username field, password is anyways hashed
		$error = "Invalid keywords found"; //show error message below login form
	} else{
		//no drop or delete keyword found in username
		if($_SESSION['db_connection_status']==0){
			//database connection has failed
			$error = "Database connection failed";
		} else{
			//connection to database successful
			$sql="SELECT * FROM users WHERE username='$username' AND password='$password'"; //sql to find user with entered username and password
			$request=mysqli_query($conn,$sql);

			if(mysqli_num_rows($request) == 1){
				//user found
				$_SESSION['login']="success"; //setting session variables
				$_SESSION['username']=$username;

				$row=mysqli_fetch_array($request); //fetching sql result for level and name data
				$_SESSION['level']=$row['level'];
        $_SESSION['hostel']=$row['hostel'];
				$_SESSION['name']=$row['name'];

				mysqli_close(); //closing sql connection
				header('Location:admin.php'); // USER LOGIN SUCCESSFUL, redirecting to admin page
			}else{
				//user with entered username and password not found
				$error ="Invalid credentials"; //showing error below login form
				//echo $sql; //for debugging
			}
		}
	}
}else if(isset($_POST['reset_submit'])){
  $username=str_replace(";","",str_replace("--","",str_replace("#","",$_POST['username']))); //removing sql injection attempt

  if($username==""){
    $error = "Invalid username";
  }else{

  include_once "connections/connect.php"; //connecting to database
  if(preg_match("/DROP/i",$username) OR preg_match("/DELETE/i",$username)){ //if DROP or DELETE found in username field, password is anyways hashed
    $error = "Invalid keywords found"; //show error message below login form
  } else{
		//no drop or delete keyword found in username
		if($_SESSION['db_connection_status']==0){
			//database connection has failed
			$error = "Database connection failed";
		} else{
			//connection to database successful
			$sql="SELECT * FROM users WHERE username='$username'"; //sql to find user with entered username and password
			$request=mysqli_query($conn,$sql);

			if(mysqli_num_rows($request) == 1){
				//user found
        $user = mysqli_fetch_array($request);

        $rset_flag = sha1(rand(10,100));
        $sql = "UPDATE users SET rset_flag='" . $rset_flag . "' WHERE id='" . $user['id'] . "'";
        $request = mysqli_query($conn, $sql);

        require_once "resources/mail/PHPMailerAutoload.php";
        ini_set('include_path', 'resources');
        $mail = new PHPMailer;
        $mail->Host = 'localhost';
        $mail->From = "no-reply@fromabctill.xyz";
        $mail->FromName = "IITDH Court";
        $mail->addAddress($user['email'],$user['name']); //sending one copy to the hostel secretary
        $mail->addCC("gsha@iitdh.ac.in"); //sending one copy to the hostel secretary
        $mail->isHTML(true);

        $linkdata = array(
          'id' => $user['id'],
          'flag' => $rset_flag
        );
        $link = "http://fromabctill.xyz/iitdh/actions/preset.php?" . http_build_query($linkdata);

				$mail->Subject = "[Court] Reset Password";
        $mail->Body = "Hello " . $user['name'] . ",<br />Password reset link was requested for your <a href='http://fromabctill.xyz/iitdh/'>Court</a> account.<br />Click <a href='" . $link . "'>here</a> to reset password.<br />It is safe to ignore this mail if you didn't request password reset.<br /><br />Court";
        $mail->AltBody = "Hello " . $user['name'] . ",<br />Password reset link was requested for your <a href='http://fromabctill.xyz/iitdh/'>Court</a> account.<br />Click <a href='" . $link . "'>here</a> to reset password.<br />It is safe to ignore this mail if you didn't request password reset.<br /><br />Court";

        if(!$mail->send())
				{
					$error = "Mailer Error: " . $mail->ErrorInfo;
				}
				else
				{
					$error = "Please check your email account for password reset link";
				}
				mysqli_close($conn); //closing sql connection
			}else{
				//user with entered username and password not found
				$error = "Please check your email account for password reset link"; //showing error below login form
				//echo $sql; //for debugging
			}
		}
	}
}
}
?>

<header>
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			 <a class="navbar-brand" href="#"><span class="logo"><h1 style="color:#555">IITDh Court</h1></span></a>
		</div>
	</div>
</nav>
</header>

<div class="container" id="login_container">
	<div id="login_well">
		<form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post">
			Username<br /><input type="text" name="username"><br />
			Password<br /><input type="password" name="password"><br /><br/>
			<input type="submit" name="login_submit" value="Login">
      <input id="forgot-password" type="submit" name="reset_submit" value="Forgot Password?">
		</form>
		<span class="error logo"><?php echo "<br/>" . $error ?></span>
	</div>
</div>

<footer class="power">
<div class="container">
<a href="mailto:harshalg98+iitdhcourt@gmail.com?Subject=IITdh%20Court%20suggestion" target="_top">Suggestion</a><br />
Powered by <a href="https://github.com/harshalgajjar/court" target="_blank" class="logo">Court</a><br/>
<span class="logo">&copy; <?php echo date('Y');?> <a href="https://fromabctill.xyz" target="_blank" class="logo" style="color:#000">Harshal Gajjar</a></span><br/>
</div>
</footer>

<div id="stats">
  <script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-87834345-3', 'auto');
    ga('send', 'pageview');

  </script>
</div>
</body>
</html>
