<?php
// (c) Harshal Gajjar (gotoharshal@gmail.com)
// This code is available under GNU General Public Licence v3

require_once "../resources/mail/PHPMailerAutoload.php";
ini_set('include_path', 'resources');

//PHPMailer Object
$mail = new PHPMailer;

$mail->Host = 'localhost';

//From email address and name
$mail->From = "harshal@fromabctill.xyz";
$mail->FromName = "Test mail";

$mail->addAddress("160010003@iitdh.ac.in", "Harshal Gajjar");

//$mail->addAddress("recepient1@example.com"); //Recipient name is optional

//Address to which recipient will reply
//$mail->addReplyTo("reply@yourdomain.com", "Reply");

//CC and BCC
//gsha@iitdh.ac.in
//$mail->addCC("160020013@iitdh.ac.in"); //sending one copy to the hostel maintenance secretary
//$mail->addCC("160010003@iitdh.ac.in"); //sending one copy to the hostel maintenance secretary
//$mail->addBCC("bcc@example.com");

//Send HTML or Plain Text email
$mail->isHTML(true);

$mail->Subject = "Test mail";
$mail->Body = "body 9:40";
$mail->AltBody = "altbody";

if(!$mail->send()){
	echo "mail not sent";
	echo "Mailer Error: " . $mail->ErrorInfo;
} else {
	echo "Message has been sent successfully";
}

?>
