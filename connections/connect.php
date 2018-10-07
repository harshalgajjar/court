<?php
// (c) Harshal Gajjar (gotoharshal@gmail.com)
// This code is available under GNU General Public Licence v3

if(session_status() == PHP_SESSION_NONE){
	session_start();
}

$db_host="";
$db_username="";
$db_password="";
$db_name="";

//error_reporting(0);

$conn=mysqli_connect($db_host,$db_username,$db_password,$db_name);

if($conn){
	$_SESSION['db_connection_status'] = 1;
}else{
	$_SESSION['db_connection_status'] = 0;
}

?>
