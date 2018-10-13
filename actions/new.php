<?php
// (c) Harshal Gajjar (gotoharshal@gmail.com)
// This code is available under GNU General Public Licence v3

session_start(); //starting session to retrieve session variables
date_default_timezone_set('Asia/Kolkata'); //setting default time zone

if (isset($_SESSION['login']) AND $_SESSION['login']=="success"){ //checking for login status

	echo "login success";

	if(isset($_POST['new_submit'])){ //checking whether new complain button was pressed

		echo "new_submit set";

		include_once "../connections/connect.php";

		$problems=0;
		$hacker_flag=0; //variable to flag sql injection
		$hostel_no=str_replace(";","",str_replace("--","",str_replace("#","",$_POST['hostel_no']))); //removing all malicious special characters
		$floor_no=str_replace(";","",str_replace("--","",str_replace("#","",$_POST['floor_no']))); //removing all malicious special characters
		$room_no=str_replace(";","",str_replace("--","",str_replace("#","",$_POST['room_no']))); //removing all malicious special characters
		$issue_type=$_POST['issue_type'];
		$issue=str_replace(";","",str_replace("--","",str_replace("#","",mysqli_real_escape_string($conn,$_POST['issue'])))); //removing all malicious special characters
		$roll_no=str_replace(";","",str_replace("--","",str_replace("#","",$_POST['roll_no']))); //removing all malicious special characters
		$phone_no=str_replace(";","",str_replace("--","",str_replace("#","",$_POST['phone_no']))); //removing all malicious special characters
		$time=date('Y-m-d H:i:s'); //setting present time to be stored in the database

		if(empty($issue_type) || empty($issue) || empty($phone_no) || empty($roll_no) || (empty($hostel_no) && $hostel_no!="0")){ //check for null values
			$_SESSION['last_new_post']="Entries missing"; //message to be returned
			header('Location:../admin.php');
			$_SESSION['last_new_post_hostel_no']=$_POST['hostel_no'];
			$_SESSION['last_new_post_floor_no']=$_POST['floor_no'];
			$_SESSION['last_new_post_room_no']=$_POST['room_no'];
			$_SESSION['last_new_post_issue']=$_POST['issue'];
			$_SESSION['last_new_post_roll_no']=$_POST['roll_no'];
			$_SESSION['last_new_post_phone_no']=$_POST['phone_no'];
			$_SESSION['last_new_issue_type']=$_POST['issue_type'];
			$problems++;
		}
		else if($hostel_no>15 || $hostel_no<0){ //hostel number verification
			$_SESSION['last_new_post']="Invalid hostel number"; //message to be returned
			header('Location:../admin.php');
			$_SESSION['last_new_post_hostel_no']=$_POST['hostel_no'];
			$_SESSION['last_new_post_floor_no']=$_POST['floor_no'];
			$_SESSION['last_new_post_room_no']=$_POST['room_no'];
			$_SESSION['last_new_post_issue']=$_POST['issue'];
			$_SESSION['last_new_post_roll_no']=$_POST['roll_no'];
			$_SESSION['last_new_post_phone_no']=$_POST['phone_no'];
			$_SESSION['last_new_issue_type']=$_POST['issue_type'];
			$problems++;
		}
		else if(!empty($floor_no) && ($floor_no>2 || $floor_no<0)){ //floor number verification
			$_SESSION['last_new_post']="Invalid floor number"; //message to be returned
			header('Location:../admin.php');
			$_SESSION['last_new_post_hostel_no']=$_POST['hostel_no'];
			$_SESSION['last_new_post_floor_no']=$_POST['floor_no'];
			$_SESSION['last_new_post_room_no']=$_POST['room_no'];
			$_SESSION['last_new_post_issue']=$_POST['issue'];
			$_SESSION['last_new_post_roll_no']=$_POST['roll_no'];
			$_SESSION['last_new_post_phone_no']=$_POST['phone_no'];
			$_SESSION['last_new_issue_type']=$_POST['issue_type'];
			$problems++;
		}
		else if(!empty($room_no) && ($room_no>=400 || $room_no<0)){ //room number verification
			$_SESSION['last_new_post']="Invalid room number"; //message to be returned
			header('Location:../admin.php');
			$_SESSION['last_new_post_hostel_no']=$_POST['hostel_no'];
			$_SESSION['last_new_post_floor_no']=$_POST['floor_no'];
			$_SESSION['last_new_post_room_no']=$_POST['room_no'];
			$_SESSION['last_new_post_issue']=$_POST['issue'];
			$_SESSION['last_new_post_roll_no']=$_POST['roll_no'];
			$_SESSION['last_new_post_phone_no']=$_POST['phone_no'];
			$_SESSION['last_new_issue_type']=$_POST['issue_type'];
			$problems++;
		}
		else if($roll_no>=(date('Y')%100 + 1)*pow(10,7) || $roll_no<16*pow(10,7) || empty($roll_no)){ //roll number verification
			$_SESSION['last_new_post']="Invalid roll number"; //message to be returned
			header('Location:../admin.php');
			$_SESSION['last_new_post_hostel_no']=$_POST['hostel_no'];
			$_SESSION['last_new_post_floor_no']=$_POST['floor_no'];
			$_SESSION['last_new_post_room_no']=$_POST['room_no'];
			$_SESSION['last_new_post_issue']=$_POST['issue'];
			$_SESSION['last_new_post_roll_no']=$_POST['roll_no'];
			$_SESSION['last_new_post_phone_no']=$_POST['phone_no'];
			$_SESSION['last_new_issue_type']=$_POST['issue_type'];
			$problems++;
		}
		else if($phone_no<=99999999 || $phone_no>9999999999){ //phone number verification
			$_SESSION['last_new_post']="Invalid phone number"; //message to be returned
			header('Location:../admin.php');
			$_SESSION['last_new_post_hostel_no']=$_POST['hostel_no'];
			$_SESSION['last_new_post_floor_no']=$_POST['floor_no'];
			$_SESSION['last_new_post_room_no']=$_POST['room_no'];
			$_SESSION['last_new_post_issue']=$_POST['issue'];
			$_SESSION['last_new_post_roll_no']=$_POST['roll_no'];
			$_SESSION['last_new_post_phone_no']=$_POST['phone_no'];
			$_SESSION['last_new_issue_type']=$_POST['issue_type'];
			$problems++;
		}
		else if(!empty($room_no) && (empty($floor_no) && $floor_no!="0")){ //phone number verification
			$_SESSION['last_new_post']="Invalid floor number"; //message to be returned
			header('Location:../admin.php');
			$_SESSION['last_new_post_hostel_no']=$_POST['hostel_no'];
			$_SESSION['last_new_post_floor_no']=$_POST['floor_no'];
			$_SESSION['last_new_post_room_no']=$_POST['room_no'];
			$_SESSION['last_new_post_issue']=$_POST['issue'];
			$_SESSION['last_new_post_roll_no']=$_POST['roll_no'];
			$_SESSION['last_new_post_phone_no']=$_POST['phone_no'];
			$_SESSION['last_new_issue_type']=$_POST['issue_type'];
			$problems++;
		}

		echo $problems;

		if($problems==0){ //verification success

				if($room_no != $_POST['room_no'] OR $issue != mysqli_real_escape_string($conn,$_POST['issue']) OR $phone_no != $_POST['phone_no'] OR $hostel_no != $_POST['hostel_no'] OR $floor_no != $_POST['floor_no'] OR $roll_no != $_POST['roll_no']){ //checking whether the input matches with itself after removing all malicious characters, if not then probably SQL injection was attempted
					echo "So you're the hacker trying to peek into our database!<br />We're extremely glad to find you, you can help us improve this portal.<br />Contact harshal (+91 8879585099) for further information. <br />Also, \"&ltinfinity/&gt\" is the secret keyword. Don't share it!";
				}else{ //if input data is SQL injection safe
					$sql="INSERT INTO complains (hostel_no,floor_no,room_no,issue,issue_type,roll_no,phone_no,time) VALUES ('$hostel_no','$floor_no','$room_no','$issue','$issue_type','$roll_no','$phone_no','$time')"; //creating sql to insert data into primary database
					$request=mysqli_query($conn,$sql); //inserting data into primary  database
					$sql="INSERT INTO all_complains (hostel_no,floor_no,room_no,issue,issue_type,roll_no,phone_no,time) VALUES ('$hostel_no','$floor_no','$room_no','$issue','$issue_type','$roll_no','$phone_no','$time')"; //creating sql to insert into backup database
					$request=mysqli_query($conn,$sql); //inserting data into backup database

					if($request){ //sql request was successfully executed, hence data stored, now inform the user about the same
						echo "Success! <p>You'll be redirected back, please <span style='font-weight:700'>don't</span> refresh the page</p>";
						$_SESSION['last_new_post']="Posted successfully"; //message to be returned

						//MAIL STARTS, do NOT change the code, user will be redirected back after mailing the complain

							require_once "../resources/mail/PHPMailerAutoload.php";
							ini_set('include_path', 'resources');

							//PHPMailer Object
							$mail = new PHPMailer;
							$mail->Host = 'localhost';

							//From email address and name
							$mail->From = "no-reply@fromabctill.xyz";
							$mail->FromName = "IITDH Court";

							//To address and name

							$sql = "select * from users where level='secy' and hostel='" . $hostel_no . "'";
							$request = mysqli_query($conn, $sql);

							while($row=mysqli_fetch_array($request)){
								$mail->addAddress($row['email'], $row['name']);
							}


							// if($hostel_no == 0) {
							// 	//if the complain is from hostel number 1
							// 	if($floor_no == 0)
							// 	$mail->addAddress("180010026@iitdh.ac.in", "Purnima Priyadarshini");
							// 	else if($floor_no == 1)
							// 	$mail->addAddress("180010038@iitdh.ac.in", "Tarun Goyal");
							// 	else if($floor_no == 2)
							// 	$mail->addAddress("180020033@iitdh.ac.in", "Sameer Dohadwalla");
							// } else if($hostel_no == 1){
							// 	$mail->addAddress("170020028@iitdh.ac.in", "G. Nischay Sri Niketh");
							// } else if($hostel_no == 2){
							// 	$mail->addAddress("170010037@iitdh.ac.in", "Soma Siddhartha");
							// } else if($hostel_no == 3){
							// 	$mail->addAddress("170010004@iitdh.ac.in", "Ojas Raundale");
							// } else if($hostel_no == 4){
							// 	$mail->addAddress("160010008@iitdh.ac.in", "Ashish Arora");
							// } else if($hostel_no == 6){
							// 	$mail->addAddress("160010027@iitdh.ac.in", "Varshha");
							// } else if($hostel_no == 8){
							// 	$mail->addAddress("160020004@iitdh.ac.in", "Sushant Patil");
							// } else if($hostel_no == 7){
							// 	$mail->addAddress("160030027@iitdh.ac.in", "Punyashlok Panda");
							// } else if($hostel_no == 15){
							// 	$mail->addAddress("harshalg98@gmail.com", "Harshal Gajjar");
							// }
							//$mail->addAddress("recepient1@example.com"); //Recipient name is optional

							//Address to which recipient will reply
							//$mail->addReplyTo("reply@yourdomain.com", "Reply");

							//CC and BCC
							//$mail->addCC("gsha@iitdh.ac.in"); //sending one copy to the general secretary (hostel affairs)
							//gsha@iitdh.ac.in
							//$mail->addCC("160020013@iitdh.ac.in"); //sending one copy to the hostel maintenance secretary
							//$mail->addCC("160010003@iitdh.ac.in"); //sending one copy to the hostel maintenance secretary
							//$mail->addBCC("bcc@example.com");

							//Send HTML or Plain Text email
							$mail->isHTML(true);

							$mail->Subject = "[Court] New complain";
							$mail->Body = "Hostel no: $hostel_no<br/>Floor no: $floor_no<br/>Room no: $room_no<br />Issue type: $issue_type<br/>Roll no: $roll_no<br />Phone no: $phone_no<br />Issue:$issue<br /><br />Court";
							$mail->AltBody = "Hostel no: $hostel_no<br/>Floor no: $floor_no<br/>Room no: $room_no<br />Issue type: $issue_type<br/>Roll no: $roll_no<br />Phone no: $phone_no<br />Issue:$issue<br /><br />Court";

							if(!$mail->send())
							{
								echo "Mailer Error: " . $mail->ErrorInfo;
							}
							else
							{
								echo "Message has been sent successfully";
							}

						//MAIL ENDS, note: mail error has not been attended
						//complain successfully handled

						unset($_SESSION['last_new_post_hostel_no']);
						unset($_SESSION['last_new_post_floor_no']);
						unset($_SESSION['last_new_post_room_no']); //resetting the variable to allow new complain posting
						unset($_SESSION['last_new_post_issue']); //resetting the variable to allow new complain posting
						unset($_SESSION['last_new_post_roll_no']);
						unset($_SESSION['last_new_post_phone_no']);	//resetting the variable to allow new complain posting
						unset($_SESSION['last_new_issue_type']); //resetting the variable to allow new complain posting

						//echo (date('Y')%100 +1)*pow(10,7);

						header('Location:../admin.php'); //redirect the user to previous page
					}else{
						echo "Failed! <p>Try refreshing the page and if that doesn't work, contact network administrator</p>"; //sql execution failed
						echo mysqli_error($conn); //print out the error on be shown
					}
				}

		}

	}

} else{ //if user is not logged in
	header('Location:../admin.php');
}

?>
