<?php
// (c) Harshal Gajjar (gotoharshal@gmail.com)
// This code is available under GNU General Public Licence v3

session_start(); //starting session to retrieve session variables
date_default_timezone_set('Asia/Kolkata'); //setting default time zone

if (isset($_SESSION['login']) AND $_SESSION['login']=="success" AND $_SESSION['level']=="gsha"){ //checking for login status

	if($_SERVER['REQUEST_METHOD']=='POST'){

		include_once "../connections/connect.php";

		if(isset($_POST['update'])){
			$sql = "UPDATE users SET hostel='" . $_POST['hostel'] . "', name='" . $_POST['name'] . "', username='" . $_POST['username'] . "', email='" . $_POST['email'] . "', phone='" . $_POST['phone'] . "' WHERE id='" . $_POST['id'] . "'";
			$request = mysqli_query($conn, $sql);
			header('Location:../team.php');
		} else if(isset($_POST['remove'])){
			$sql = "DELETE FROM users WHERE id='" . $_POST['id'] . "'";
			$request = mysqli_query($conn, $sql);
			header('Location:../team.php');
		}else if(isset($_POST['add'])){
			$sql = "SELECT * FROM users WHERE hostel='" . $_POST['hostel'] . "' and name='" . $_POST['name'] . "' and username='" . $_POST['username'] . "' and email='" . $_POST['email'] . "' and phone='" . $_POST['phone'] . "'";
			$request = mysqli_query($conn, $sql);
			if(mysqli_num_rows($request)>0){
				$_SESSION['edit_warden_message'] = "Warden exists!";
			}else{
				$rset_flag = sha1(rand(10,100));
				// echo $rset_flag;
				$sql = "INSERT INTO users (hostel, name, username, email, phone, level, rset_flag) VALUES ('" . $_POST['hostel'] . "','" . $_POST['name'] . "','" . $_POST['username'] . "','" . $_POST['email'] . "','" . $_POST['phone'] . "', 'warden', '$rset_flag')" ;
				$request = mysqli_query($conn, $sql);
				$_SESSION['edit_warden_message'] = "Warden added.";

				$sql = "SELECT * FROM users WHERE hostel='" . $_POST['hostel'] . "' and name='" . $_POST['name'] . "' and username='" . $_POST['username'] . "' and email='" . $_POST['email'] . "' and phone='" . $_POST['phone'] . "'";
				$request = mysqli_query($conn, $sql);
				$newWarden = mysqli_fetch_array($request);

				require_once "../resources/mail/PHPMailerAutoload.php";
				ini_set('include_path', 'resources');
				$mail = new PHPMailer;
				$mail->Host = 'localhost';
				$mail->From = "no-reply@fromabctill.xyz";
				$mail->FromName = "IITDH Court";
				$mail->addAddress($newWarden['email'], $newWarden['name']);
				$mail->addCC("gsha@iitdh.ac.in");
				$mail->isHTML(true);

				$linkdata = array(
			    'id' => $newWarden['id'],
			    'flag' => $rset_flag
				);
				$link = "http://fromabctill.xyz/iitdh/actions/preset.php?" . http_build_query($linkdata);

				// echo $link;

				$mail->Subject = "[Court] Welcome to IITDH Court!";
				$mail->Body = "Hello " . $newWarden['name'] . ",<br /> <a href='http://fromabctill.xyz/iitdh/'>Court</a> is a hostel complaint management portal.<br /><br />An account for you has been created by " . $_SESSION['name'] . ", following are the details:<br />username: '" . $newWarden['username'] . "'<br />Password: Click <a href='" . $link . "'>here</a> to set a password.<br /><br />Court";
				$mail->AltBody = "Hello " . $newWarden['name'] . ",<br /> <a href='http://fromabctill.xyz/iitdh/'>Court</a> is a hostel complaint management portal.<br /><br />An account for you has been created by " . $_SESSION['name'] . ", following are the details:<br />username: '" . $newWarden['username'] . "'<br />Password: Click <a href='" . $link . "'>here</a> to set a password.<br /><br />Court";

				if(!$mail->send())
				{
					echo "Mailer Error: " . $mail->ErrorInfo;
				}
				else
				{
					echo "Message has been sent successfully";
				}

			}

			header('Location:../team.php');
		} else{
			header('Location:../admin.php');
		}
	}else{
		header('Location:../admin.php');
	}

} else{ //if user is not logged in
	header('Location:../admin.php');
}

?>
