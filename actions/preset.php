<?php
// (c) Harshal Gajjar (gotoharshal@gmail.com)
// This code is available under GNU General Public Licence v3

session_start();
date_default_timezone_set('Asia/Kolkata');

if ($_SERVER['REQUEST_METHOD']=='GET' AND isset($_GET['id']) AND isset($_GET['flag'])){
		include_once "../connections/connect.php";

		$sql = "SELECT * FROM users WHERE id='" . $_GET['id'] . "' AND rset_flag='" . $_GET['flag'] . "'";
		// echo $sql;
		$request = mysqli_query($conn,$sql);
		$valid = mysqli_num_rows($request);

		if($valid==0){
			header('Location:../admin.php');
		}else{
			$user = mysqli_fetch_array($request);

			$_SESSION['preset_check']=1;
			$_SESSION['preset_id']=$_GET['id'];
			$_SESSION['preset_flag']=$_GET['flag'];
			$_SESSION['user'] = $user;
			// echo $_SESSION['user']['name'];
			header('Location:../reset.php');
		}

} else{
	header('Location:../admin.php');
}

?>
