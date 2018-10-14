<?php
// (c) Harshal Gajjar (gotoharshal@gmail.com)
// This code is available under GNU General Public Licence v3

session_start(); //starting session
error_reporting(0);
date_default_timezone_set('Asia/Kolkata'); //changing default time zone

if($_SERVER['REQUEST_METHOD']=='POST'){
  include_once "../connections/connect.php";

  // if(!isset($_POST['action'])){ echo "failure"; return;}
  //
  $action=$_POST['action'];

  if($action=="add"){
    $name = $_POST['name'];
    $roll_no = $_POST['roll_no'];
    $pContact = $_POST['pContact'];
    $dContact = $_POST['dContact'];
    $dTime = $_POST['dTime'];
    $aTime = $_POST['aTime'];
    $destination = $_POST['destination'];
    $cause = $_POST['cause'];
    $hostel_no = $_POST['hostel_no'];
    $floor_no = $_POST['floor_no'];
    $room_no = $_POST['room_no'];

    // echo $dTime;

    $dtimeStamp1 = strtotime(str_replace("%3A",":",$dTime));
    $dtimeStamp = date("Y-m-d H:i:s",$dtimeStamp1);

    // echo $dtimeStamp;

    $atimeStamp2 = strtotime(str_replace("%3A",":",$aTime));
    $atimeStamp = date("Y-m-d H:i:s",$atimeStamp2);

    $sql="select * from users where hostel=" . $hostel_no . " and level='warden'";
    $request = mysqli_query($conn, $sql);

    if(!$request){
      echo "add failed1";
    }

    // $row = mysqli_fetch_array($request);

    // echo mysqli_num_rows($request);

    $sql2="INSERT INTO leave_requests (name,roll_no,hostel_no,floor_no,room_no,pnumber,dnumber,departure,arrival,cause,destination,status) VALUES ('$name','$roll_no','$hostel_no','$floor_no','$room_no','$pContact','$dContact','$dtimeStamp','$atimeStamp','$cause','$destination','Approval Pending')"; //creating sql to insert data into primary database
    // echo $sql2;
    $request2 = mysqli_query($conn, $sql2);

    if($request2){
      echo "success";

      require_once "../resources/mail/PHPMailerAutoload.php";
      ini_set('include_path', 'resources');
      $mail = new PHPMailer;
      $mail->Host = 'localhost';
      $mail->From = "no-reply@fromabctill.xyz";
      $mail->FromName = "IITDH Court";
      $mail->addAddress($roll_no."@iitdh.ac.in");

      while($row=mysqli_fetch_array($request)){
        $mail->addCC($row['email'], $row['name']);
        // echo $row['email'];
      }

      $mail->isHTML(true);
      $mail->Subject = "[Court] New Leave Request";
      $mail->Body = "Name: $name<br/>Roll number: $roll_no<br />Room Number: $room_no<br/>Personal Contact: +91$pContact<br />Destination Contact: +91$dContact<br/>Departure: " . date("d-m-Y H:i:s",$dtimeStamp1) . "<br />Arrival: " . date("d-m-Y H:i:s",$atimeStamp2) . "<br />Cause: $cause<br /><br />Court";

      if(!$mail->send())
      {
        echo "Mailer Error: " . $mail->ErrorInfo;
      }

    }else{
      echo "add failed2";
    }

//if action==add ends


}else if($action=="decline"){

  if($_SESSION['level']!='warden') return;

  $id = $_POST['id'];

  // $sql="select * from leave_requests where id='" . $id . "'";
  // $request=mysqli_query($conn,$sql);

  $sql="update leave_requests set status='Declined' where id=" . $id;
  $request=mysqli_query($conn,$sql);

  if($request){
    echo "success";

    require_once "../resources/mail/PHPMailerAutoload.php";
    ini_set('include_path', 'resources');
    $mail = new PHPMailer;
    $mail->Host = 'localhost';
    $mail->From = "no-reply@fromabctill.xyz";
    $mail->FromName = "IITDH Court";

    $sql2="SELECT * from leave_requests where id=".$id;
    $request2=mysqli_query($conn,$sql2);
    $row2 = mysqli_fetch_array($request2);
    $mail->addAddress($row2['roll_no']."@iitdh.ac.in");

    $sql3="SELECT email, users.name as name FROM `leave_requests` join `users` where leave_requests.hostel_no=users.hostel and users.level='warden' and leave_requests.id=".$id;
    $request3=mysqli_query($conn,$sql3);

    while($row3=mysqli_fetch_array($request3)){
      $mail->addCC($row3['email'], $row3['name']);
    }

    $mail->isHTML(true);
    $mail->Subject = "[Court] Leave Request Declined";
    $mail->Body = "Name: " . $row2['name'] . "<br/>Roll number: " . $row2['roll_no'] . "<br />Room Number: ".$row2['room_no']."<br/>Personal Contact: +91".$row2['pnumber']."<br />Destination Contact: +91".$row2['dnumber']."<br/>Departure: " . $row2['departure'] . "<br />Arrival: " . $row2['arrival'] . "<br />Cause: ".$row2['cause']."<br /><br />Court";

    if(!$mail->send())
    {
      echo "Mailer Error: " . $mail->ErrorInfo;
    }

  }else{
    echo "decline failed";
  }

}else if($action=="approve"){

  if($_SESSION['level']!='warden') return;

  $id = $_POST['id'];

  $sql="select * from leave_requests where id='" . $id . "'";
  $request=mysqli_query($conn, $sql);

  $sql="update leave_requests set status='Approved' where id=" . $id;
  $request=mysqli_query($conn, $sql);

  if($request){
    echo "success";

    require_once "../resources/mail/PHPMailerAutoload.php";
    ini_set('include_path', 'resources');
    $mail = new PHPMailer;
    $mail->Host = 'localhost';
    $mail->From = "no-reply@fromabctill.xyz";
    $mail->FromName = "IITDH Court";

    $sql2="SELECT * from leave_requests where id=".$id;
    $request2=mysqli_query($conn,$sql2);
    $row2 = mysqli_fetch_array($request2);
    $mail->addAddress($row2['roll_no']."@iitdh.ac.in");

    $sql3="SELECT email, users.name as name FROM `leave_requests` join `users` where leave_requests.hostel_no=users.hostel and users.level='warden' and leave_requests.id=".$id;
    $request3=mysqli_query($conn,$sql3);

    while($row3=mysqli_fetch_array($request3)){
      $mail->addCC($row3['email'], $row3['name']);
    }

    $mail->isHTML(true);
    $mail->Subject = "[Court] Leave Request Approved";
    $mail->Body = "Name: " . $row2['name'] . "<br/>Roll number: " . $row2['roll_no'] . "<br />Room Number: ".$row2['room_no']."<br/>Personal Contact: +91".$row2['pnumber']."<br />Destination Contact: +91".$row2['dnumber']."<br/>Departure: " . $row2['departure'] . "<br />Arrival: " . $row2['arrival'] . "<br />Cause: ".$row2['cause']."<br /><br />Court";

    if(!$mail->send())
    {
      echo "Mailer Error: " . $mail->ErrorInfo;
    }

  }else{
    echo "approve failed";
  }

}else if($action=="reset"){

  if($_SESSION['level']!='warden') return;

  $id = $_POST['id'];

  $sql="select * from leave_requests where id='" . $id . "'";
  $request=mysqli_query($conn, $sql);

  $sql="update leave_requests set status='Approval Pending' where id=" . $id;
  $request=mysqli_query($conn, $sql);

  if($request){
    echo "success";

    require_once "../resources/mail/PHPMailerAutoload.php";
    ini_set('include_path', 'resources');
    $mail = new PHPMailer;
    $mail->Host = 'localhost';
    $mail->From = "no-reply@fromabctill.xyz";
    $mail->FromName = "IITDH Court";

    $sql2="SELECT * from leave_requests where id=".$id;
    $request2=mysqli_query($conn,$sql2);
    $row2 = mysqli_fetch_array($request2);
    $mail->addAddress($row2['roll_no']."@iitdh.ac.in");

    $sql3="SELECT email, users.name as name FROM `leave_requests` join `users` where leave_requests.hostel_no=users.hostel and users.level='warden' and leave_requests.id=".$id;
    $request3=mysqli_query($conn,$sql3);

    while($row3=mysqli_fetch_array($request3)){
      $mail->addCC($row3['email'], $row3['name']);
    }

    $mail->isHTML(true);
    $mail->Subject = "[Court] Leave Request Approval Pending";
    $mail->Body = "Name: " . $row2['name'] . "<br/>Roll number: " . $row2['roll_no'] . "<br />Room Number: ".$row2['room_no']."<br/>Personal Contact: +91".$row2['pnumber']."<br />Destination Contact: +91".$row2['dnumber']."<br/>Departure: " . $row2['departure'] . "<br />Arrival: " . $row2['arrival'] . "<br />Cause: ".$row2['cause']."<br /><br />Court";

    if(!$mail->send())
    {
      echo "Mailer Error: " . $mail->ErrorInfo;
    }

  }else{
    echo "approve failed";
  }

}



}else{
  header('Location:../admin.php');
}

?>
