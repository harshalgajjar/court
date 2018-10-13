<?php
// (c) Harshal Gajjar (gotoharshal@gmail.com)
// This code is available under GNU General Public Licence v3

session_start(); //starting session to retrieve session variables
date_default_timezone_set('Asia/Kolkata'); //setting default time zone

if ($_SERVER['REQUEST_METHOD']=='POST' && ($_POST['type']=="announce") AND isset($_SESSION['login']) AND $_SESSION['login']=="success" AND ($_SESSION['level']=="gsha" || $_SESSION['level']=="warden" || $_SESSION['level']=="secy")){
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

  if($_SESSION['level']=="gsha"){
    $mail->From = "gsha@iitdh.ac.in";
    $mail->FromName = "General Secretary Hostel Affairs";
  }else if($_SESSION['level']=="warden"){
    $sql2 = "select * from users where level='warden' and hostel='" . $_POST['senderHostel'] . "'";
    $request2=mysqli_query($conn, $sql2);
    $row2 = mysqli_fetch_array($request2);
    $mail->From = $row2['email'];
    $mail->FromName = $row2['name'] .  " (Hostel warden)" ;
  }else if($_SESSION['level']=="secy"){
    $sql2 = "select * from users where level='secy' and hostel='" . $_POST['senderHostel'] . "'";
    $request2=mysqli_query($conn, $sql2);
    $row2 = mysqli_fetch_array($request2);
    $mail->From = $row2['email'];
    $mail->FromName = $row2['name'] .  " (Hostel secretary)" ;
    //echo $row2['email'] . $row2['name'];
  }

  $mail->addCC("gsha@iitdh.ac.in");


      $sql2 = "select email from `users` where hostel in (";
      for($i=0; $i<sizeof($hostels); $i++){
        $sql2 = $sql2 . "'" . $hostels[$i] . "'";
        if($i!=sizeof($hostels)-1) $sql2 = $sql2 . ",";
      }
      $sql2 = $sql2 . ") and (level='secy' or level='warden')";
      $request2 = mysqli_query($conn, $sql2);

      while($row2=mysqli_fetch_array($request2)){
        //echo "adding ".$row['roll_no'] . "@iitdh.ac.in ";
        $email=$row2['email'];
        $mail->addCC($email);
      }

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
