<?php
// (c) Harshal Gajjar (gotoharshal@gmail.com)
// This code is available under GNU General Public Licence v3

session_start();
date_default_timezone_set('Asia/Kolkata');

if (isset($_SESSION['login']) AND $_SESSION['login']=="success" AND ($_SESSION['level']=="admin" || $_SESSION['level']=="secy" || $_SESSION['level']=="warden" || $_SESSION['level']=="gsha")){

	if(isset($_GET['del_submit'])){

		include_once "../connections/connect.php";

		$complain_id=$_GET['complain_id'];

		$sql="SELECT * from complains WHERE complain_id='$complain_id'";
		$request=mysqli_query($conn,$sql);
		$complain_info=mysqli_fetch_array($request);

		$mail_id = $complain_info['roll_no'] . "@iitdh.ac.in";

		require_once "../resources/mail/PHPMailerAutoload.php";
		ini_set('include_path', 'resources');

		$mail = new PHPMailer;
		$mail->Host = 'localhost';
		$mail->From = "no-reply@fromabctill.xyz";
		$mail->FromName = "IITDH Court";

		$hostel_no=$complain_info['hostel_no'];

		$mail->addAddress($mail_id);

		$sql = "select * from users where level='secy' and hostel='" . $hostel_no . "'";
		$request = mysqli_query($conn, $sql);

		while($row=mysqli_fetch_array($request)){
			$mail->addCC($row['email'], $row['name']);
		}

		// if($hostel_no == 0) {
		// 	//if the complain is from hostel number 1
		// 	if($floor_no == 0)
		// 	$mail->addCC("180010026@iitdh.ac.in", "Purnima Priyadarshini");
		// 	else if($floor_no == 1)
		// 	$mail->addCC("180010038@iitdh.ac.in", "Tarun Goyal");
		// 	else if($floor_no == 2)
		// 	$mail->addCC("180020033@iitdh.ac.in", "Sameer Dohadwalla");
		// } else if($hostel_no == 1){
		// 	$mail->addCC("170020028@iitdh.ac.in", "G. Nischay Sri Niketh");
		// } else if($hostel_no == 2){
		// 	$mail->addCC("170010037@iitdh.ac.in", "Soma Siddhartha");
		// } else if($hostel_no == 3){
		// 	$mail->addCC("170010004@iitdh.ac.in", "Ojas Raundale");
		// } else if($hostel_no == 4){
		// 	$mail->addCC("160010008@iitdh.ac.in", "Ashish Arora");
		// } else if($hostel_no == 6){
		// 	$mail->addCC("160010027@iitdh.ac.in", "Varsha Thandu");
		// } else if($hostel_no == 8){
		// 	$mail->addCC("160020004@iitdh.ac.in", "Sushant Patil");
		// } else if($hostel_no == 7){
		// 	$mail->addCC("160030027@iitdh.ac.in", "Punyashlok Panda");
		// } else if($hostel_no == 15){
		// 	$mail->addCC("harshalg98@gmail.com", "Harshal Gajjar");
		// }

		$mail->addCC("gsha@iitdh.ac.in");

		$mail->isHTML(true);

		$mail->Subject = "[Court] Complaint resolved";
		$mail->Body = "Hello " . $complain_info['roll_no'] . ", your complaint has been marked as resolved. Please contact Hostel Secretary or add the complaint again if you think this is a mistake.<hr />Complaint details:<br />Hostel no: ".$complain_info['hostel_no']."<br/>Floor no: ".$complain_info['floor_no']."<br/>Room no: ".$complain_info['room_no']."<br />Issue type: ".$complain_info['issue_type']."<br/>Roll no: ".$complain_info['roll_no']."<br />Phone no: ".$complain_info['phone_no']."<br/>Issue:".$complain_info['issue']."<br /><br />Court";
		$mail->AltBody = "Hello " . $complain_info['roll_no'] . ", your complaint has been marked as resolved. Please contact Hostel Secretary or add the complaint again if you think this is a mistake.<hr />Complaint details:<br />Hostel no: ".$complain_info['hostel_no']."<br/>Floor no: ".$complain_info['floor_no']."<br/>Room no: ".$complain_info['room_no']."<br />Issue type: ".$complain_info['issue_type']."<br/>Roll no: ".$complain_info['roll_no']."<br />Phone no: ".$complain_info['phone_no']."<br/>Issue:".$complain_info['issue']."<br /><br />Court";

		if(!$mail->send()) echo "Mailer Error: " . $mail->ErrorInfo;
		else echo "Message has been sent successfully";

		$sql="DELETE FROM complains WHERE complain_id='$complain_id'";
		$request=mysqli_query($conn,$sql);

		if($request){
			echo "Success! <p>You'll be redirected back, please <span style='font-weight:700'>don't</span> refresh the page</p>";
			//$_SESSION['last_del_post']=1;
			header('Location:../admin.php');
		}else{
			echo "Failed! <p>Try refreshing the page and if that doesn't work, contact network administrator</p>";
			echo mysqli_error($conn);
		}
	}

} else{
	header('Location:../admin.php');
}

?>
