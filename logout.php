<?php
// (c) Harshal Gajjar (gotoharshal@gmail.com)
// This code is available under GNU General Public Licence v3

	session_start();
	$_SESSION['name']="";
	$_SESSION['login']="failed";
	$_SESSION['level']="";
	$_SESSION['hostel']="";
	session_unset();
	session_destroy();
	header('Location: login.php');
	exit();
?>
