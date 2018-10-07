<?php
// (c) Harshal Gajjar (gotoharshal@gmail.com)
// This code is available under GNU General Public Licence

session_start(); //starting session
date_default_timezone_set('Asia/Kolkata'); //changing default time zone
include_once "../connections/connect.php"; //connecting to database

$sql="SELECT * FROM all_complains";

$request=mysqli_query($conn,$sql);

while($row=mysqli_fetch_array($request)){
  $floor=floor($row['room_no']/100)-1;
  $request_update=mysqli_query($conn,"UPDATE all_complains SET hostel_no='1', floor_no='$floor' WHERE complain_id='$row[complain_id]'");
}

?>
