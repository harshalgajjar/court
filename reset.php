<?php
// (c) Harshal Gajjar (gotoharshal@gmail.com)
// This code is available under GNU General Public Licence v3

session_start(); //starting session
if($_SESSION['preset_check']!=1){
  header('Location:admin.php');
}
?>

<!DOCTYPE html>
<html lang="en-US">
<head>
<title>Password Reset - Court</title>
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

if(isset($_POST['reset_submit'])){ //if submit button clicked

	$password1=sha1($_POST['password1']); //removing sql injection attempt
	$password2=sha1($_POST['password2']); //hashing password

	include_once "connections/connect.php"; //connecting to database


  if(strlen($_POST['password1'])<8){
    $error = "Password length needs to be greater than 8";
  }else if($password1!=$password2){
    $error = "Repeated password needs to match";
  }else{
  	if(preg_match("/DROP/i",$username) OR preg_match("/DELETE/i",$username)){ //if DROP or DELETE found in username field, password is anyways hashed
  		$error = "Invalid keywords found"; //show error message below login form
  	} else{
  		//no drop or delete keyword found in username
  		if($_SESSION['db_connection_status']==0){
  			//database connection has failed
  			$error = "Database connection failed";
  		} else{
  			//connection to database successful
        $rset_flag = sha1(rand(100,200));

  			$sql="UPDATE users SET password='" . $password1 . "' WHERE id='" . $_SESSION['preset_id'] . "' AND rset_flag='" . $_SESSION['preset_flag'] . "'"; //sql to find user with entered username and password
  			$request=mysqli_query($conn,$sql);

  			$sql="update users SET rset_flag='" . $rset_flag . "' WHERE id='" . $_SESSION['preset_id'] . "'";
  			$request=mysqli_query($conn,$sql);

        header('Location:login.php');
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
    Hello <?php echo $_SESSION['user']['name']; ?>,<br />Reset your password<br /><br />
		<form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post">
			New password<br /><input type="password" name="password1"><br />
			Repeat<br /><input type="password" name="password2"><br /><br/>
			<input type="submit" name="reset_submit" value="Reset">
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
