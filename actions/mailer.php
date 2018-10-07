<?php
// (c) Harshal Gajjar (gotoharshal@gmail.com)
// This code is available under GNU General Public Licence v3

session_start(); //starting session to retrieve session variables
date_default_timezone_set('Asia/Kolkata'); //setting default time zone

if ($_SERVER['REQUEST_METHOD']=='POST' && ($_POST['type']=="announce") AND isset($_SESSION['login']) AND $_SESSION['login']=="success" AND ($_SESSION['level']=="gsha")){
  include_once "../connections/connect.php";

  $issues = explode(",",$_POST['issues']);
  $hostels = explode(",",$_POST['hostels']);
  $message = nl2br($_POST["message"]);
  $subject = $_POST["subject"];

  $sql = "select distinct roll_no from `complains` where issue_type in (";

  for($i=0; $i<sizeof($issues); $i++){
    $sql = $sql . "'" . $issues[$i] . "'";
    if($i!=sizeof($issues)-1) $sql = $sql . ",";
  }

  $sql = $sql . ") and hostel_no in (";

  for($i=0; $i<sizeof($hostels); $i++){
    $sql = $sql . "'" . $hostels[$i] . "'";
    if($i!=sizeof($hostels)-1) $sql = $sql . ",";
  }

  $sql = $sql . ")";
  // echo $sql;

  $request=mysqli_query($conn,$sql);
  $nrows=mysqli_num_rows($request);

  $subject = "[Court] " . $subject;

  require_once "../resources/mail/PHPMailerAutoload.php";
  ini_set('include_path', 'resources');

  $mail = new PHPMailer;
  $mail->From = "gsha@iitdh.ac.in";
  $mail->FromName = "General Secretary Hostel Affairs";
  $mail->addCC("gsha@iitdh.ac.in");

  while($row=mysqli_fetch_array($request)){
    //echo "adding ".$row['roll_no'] . "@iitdh.ac.in ";
    $email=$row['roll_no'] . "@iitdh.ac.in";
    $mail->addBCC($email);
  }

  $mail->isHTML(true);
  $mail->Subject = $subject;
  $mail->Body = $message;
  $mail->AltBody = $message;

	if(!$mail->send())
	{
		echo "mail not sent";
		echo "Mailer Error: " . $mail->ErrorInfo;
	}
	else
	{
    $sql = "insert into `announcements` (`composer_level`, `hostel`, `issues`, `subject`, `message`, `composer_name`) VALUES ('" . $_SESSION['level'] . "', '" . $_SESSION['hostel'] . "', '" . $_POST['issues'] . "', '" . mysqli_real_escape_string($conn, $_POST["subject"]) . "', '" . mysqli_real_escape_string($conn, nl2br($_POST["message"])) . "', '" . $_SESSION['name'] . "');";
    $request = mysqli_query($conn, $sql);
		echo "success";
	}


};
?>
