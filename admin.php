<?php
// (c) Harshal Gajjar (gotoharshal@gmail.com)
// This code is available under GNU General Public Licence v3

session_start(); //starting session
error_reporting(0);
date_default_timezone_set('Asia/Kolkata'); //changing default time zone
include_once "connections/connect.php"; //connecting to database
$ncomplains_campus=0;
$ncomplains_hostel=0;
?>
<!DOCTYPE html>
<html lang="en-US">
<head>
<title>Home - Court</title>
    <meta type="robots" content="nofollow">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="This is an example of a meta description. This will often show up in search results.">
	<!--<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>-->
	<link rel="stylesheet" href="bootstrap.min.css">
	<script src="jquery.min.js"></script>
	<script src="bootstrap.min.js"></script>
	<script src="jquery.table2excel.js"></script>
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="style_admin.css">
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript" scr="gchart.js"></script>
</head>
<body>

<?php
	if(isset($_SESSION['login']) AND $_SESSION['login'] == "success"){ //if user logged in
?>

	<!-- CONTENT INSIDE -->
	<header>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mainbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand logo" href="#">Court</a>
			</div>

			<div class="collapse navbar-collapse" id="mainbar">
				<ul class="nav navbar-nav navbar-right">
          <li><a href="leave.php">Leave Request<?php if($_SESSION['level']=="warden" || $_SESSION['level']=="secy" || $_SESSION['level']=="gsha") echo "s";?></a></li>
					<?php if($_SESSION['level']=="gsha"){?><li><a href="team.php">Team</a></li> <?php } ?>
          <?php if($_SESSION['level']=="gsha" || $_SESSION['level']=="warden" || $_SESSION['level']=="secy"){?><li><a href="mail.php">Mail</a></li> <?php } ?>
					<li><a href="logout.php">Log out</a></li>
				</ul>
			</div>
		</div>
	</nav>
	</header>

	<div class="container">
		<div class="row">

			<div class="col-sm-4 bottom-gap">
				<div class="box bottom-gap" id="new-complain">
					<h3>New complain</h3><br />
					<form method="post" action="actions/new.php" onsubmit="return new_complain();">

						<?php /*

							logic flow:
							=> 	$_SESSION['last_new_post']
								it is set whenever an attempt to launch a complaint is unsuccessful
								it contains the error message, like "Invalid room number"

							=> 	$_SESSION['last_new_post_room_no'], $row['issue_type_option_name'], $_SESSION['last_new_issue_type'], $_SESSION['last_new_post_issue'], $_SESSION['last_new_post_phone_no']
								all contain the user entered form data of the previous unsuccessful complaint launch trial

							=>	all the above variables are unset on successful launch of the complaint
								i.e. after user rectifies all errors in the data entered and clicks "Submit"

						*/?>
            <span style="width:47%;float:left;"><span class="logo">Hostel Number</span><span class="required">*</span><br /><input type="text" placeholder="0,1,2,.." name="hostel_no" value="<?php if (isset($_SESSION['last_new_post'])) {echo $_SESSION['last_new_post_hostel_no']; } //filling room number of failed post attempt ?>"/></span>
            <span style="width:47%;float:right;"><span class="logo">Floor Number</span><br /><input type="text" placeholder="0,1,2,.." name="floor_no" value="<?php if (isset($_SESSION['last_new_post'])) {echo $_SESSION['last_new_post_floor_no']; } //filling room number of failed post attempt ?>"/></span><br />

						<span class="logo">Room Number</span><br /><input type="text" name="room_no" value="<?php if (isset($_SESSION['last_new_post'])) {echo $_SESSION['last_new_post_room_no']; } //filling room number of failed post attempt ?>"/><br />
						<span class="logo">Type<span class="required">*</span></span><br />
							<?php
								$sql="SELECT * FROM issue_type_table"; //preparing SQL command to get all issue types for the form
								$request=mysqli_query($conn,$sql);

								while($row=mysqli_fetch_array($request)){ //echoing all issue types
							?>
								<input type="radio" name="issue_type" value="<?php echo $row['issue_type_option_name'];?>" <?php if(isset($_SESSION['last_new_post']) AND $_SESSION['last_new_issue_type']!="" AND $_SESSION['last_new_issue_type'] == $row['issue_type_option_name']) {echo "checked='checked'";} ?> /> <?php echo $row['issue_type_option_name'];?><br />

							<?php
								}
							?>
						<span class="logo">Issue<span class="required">*</span></span><br /><textarea type="text" name="issue" maxlength=255><?php if (isset($_SESSION['last_new_post'])) {echo $_SESSION['last_new_post_issue']; } //filling issue of failed post attempt ?></textarea><br />
            <span style="width:47%;float:left;"><span class="logo">Roll Number<span class="required">*</span></span><br /><input type="text" name="roll_no" value="<?php if (isset($_SESSION['last_new_post'])) {echo $_SESSION['last_new_post_roll_no']; } //filling phone number of failed post attempt ?>"/></span>
            <span style="width:47%;float:right;"><span class="logo">Phone Number<span class="required">*</span></span><br /><input type="text" name="phone_no" value="<?php if (isset($_SESSION['last_new_post'])) {echo $_SESSION['last_new_post_phone_no']; } //filling phone number of failed post attempt ?>"/></span><br /><br /><br />

						<input id="new_complain_submit" type="submit" name="new_submit"/>

						<div><span class="message logo"><?php if (isset($_SESSION['last_new_post'])) {echo $_SESSION['last_new_post']; unset($_SESSION['last_new_post']); } //showing the error of last post message ?></span></div>

					</form>
				</div>
			</div>

      <script>
      function new_complain(){
        document.getElementById('new_complain_submit').value="Submitting";
        return true;
      }
      </script>

      <div class="col-sm-4 bottom-gap">

        <?php
        //$_SESSION['level']=="admin" || $_SESSION['level']=="warden" ||
        if($_SESSION['level']=="secy"){
        ?>
          <div class="box-large bottom-gap">
            <span id="greeting">Hello <?php echo $_SESSION['name']; ?>,</span><br />
            It's <?php echo date("l, d M Y"); ?> today.
          </div>
          <div class="box-large bottom-gap">
            <h4>Escalate</h4>
            <?php
              $sql_2="SELECT name, email FROM `users` WHERE hostel = '" . $_SESSION['hostel'] . "' and level = 'warden'";
              $request_2=mysqli_query($conn,$sql_2);
              $ntypes=mysqli_num_rows($request_2);

            ?>

            Hostel warden<?php if($ntypes>1) echo "s"; ?>:<br />
              <?php
              while($row = mysqli_fetch_array($request_2)){
                echo "- <a href='mailto:" . $row['email'] .  "?subject=[Court]%20Hostel%20" . $_SESSION['hostel'] . "'>" . $row['name'] . "</a><br />";
              }
              if($ntypes==0){
                echo "<i>No warden assigned<br />";
              }
              ?>

            <?php
              $sql_2="SELECT name, email FROM `users` WHERE level = 'gsha'";
              $request_2=mysqli_query($conn,$sql_2);
              $ntypes=mysqli_num_rows($request_2);
            ?>
            General <?php if($ntypes>1) echo "Secretaries"; else echo "Secretary" ; ?> (Hostel Affairs):<br />
              <?php
              while($row = mysqli_fetch_array($request_2)){
                echo "- <a href='mailto:" . $row['email'] .  "?subject=[Court] Hostel " . $_SESSION['hostel'] . "'>" . $row['name'] . "</a><br />";
              }
              if($ntypes==0){
                echo "<i>No General Secretary (Hostel Affairs) present<br />";
              }
              ?>

            <?php
              $sql_2="SELECT name, email FROM `users` WHERE level = 'dean.sw'";
              $request_2=mysqli_query($conn,$sql_2);
              $ntypes=mysqli_num_rows($request_2);
            ?>
            Dean <?php if($ntypes>1) echo "s"; ?> (Student Welfare):<br />
              <?php
              while($row = mysqli_fetch_array($request_2)){
                echo "- <a href='mailto:" . $row['email'] .  "?subject=[Court] Hostel " . $_SESSION['hostel'] . "'>" . $row['name'] . "</a><br />";
              }
              if($ntypes==0){
                echo "<i>No Dean Student Welfare present<br />";
              }
              ?>
          </div>
        <?php
        } else if($_SESSION['level']=="warden"){
        ?>
        <div class="box-large bottom-gap">
          <span id="greeting">Hello <?php echo $_SESSION['name']; ?> (Warden, Hostel <?php echo $_SESSION['hostel'];?>),</span><br />
          It's <?php echo date("l, d M Y"); ?> today.
        </div>
        <div class="box-large bottom-gap">
          <h4>Contact</h4>
          <?php
            $sql_2="SELECT name, email FROM `users` WHERE hostel = '" . $_SESSION['hostel'] . "' and level = 'secy'";
            $request_2=mysqli_query($conn,$sql_2);
            $ntypes=mysqli_num_rows($request_2);

          ?>
          Hostel <?php if($ntypes>1) echo "Secretaries"; else echo "Secretary"; ?>:<br />
            <?php
            while($row = mysqli_fetch_array($request_2)){
              echo "- <a href='mailto:" . $row['email'] .  "?subject=[Court]%20Regarding%20Hostel%20" . $_SESSION['hostel'] . "'>" . $row['name'] . "</a><br />";
            }
            if($ntypes==0){
              echo "<i>No Secretary present<br />";
            }
            ?>

          <?php
            $sql_2="SELECT name, email FROM `users` WHERE level = 'gsha'";
            $request_2=mysqli_query($conn,$sql_2);
            $ntypes=mysqli_num_rows($request_2);
          ?>
          General <?php if($ntypes>1) echo "Secretaries"; else echo "Secretary" ; ?> (Hostel Affairs):<br />
            <?php
            while($row = mysqli_fetch_array($request_2)){
              echo "- <a href='mailto:" . $row['email'] .  "?subject=[Court] Hostel " . $_SESSION['hostel'] . "'>" . $row['name'] . "</a><br />";
            }
            if($ntypes==0){
              echo "<i>No General Secretary (Hostel Affairs) present<br />";
            }
            ?>

          <?php
            $sql_2="SELECT name, email FROM `users` WHERE level = 'dean.sw'";
            $request_2=mysqli_query($conn,$sql_2);
            $ntypes=mysqli_num_rows($request_2);
          ?>
          Dean <?php if($ntypes>1) echo "s"; ?> (Student Welfare):<br />
            <?php
            while($row = mysqli_fetch_array($request_2)){
              echo "- <a href='mailto:" . $row['email'] .  "?subject=[Court] Hostel " . $_SESSION['hostel'] . "'>" . $row['name'] . "</a><br />";
            }
            if($ntypes==0){
              echo "<i>No Dean Student Welfare present<br />";
            }
            ?>
        </div>
        <?php
        } else if($_SESSION['level']=="gsha"){
        ?>
        <div class="box-large bottom-gap">
          <span id="greeting">Hello <?php echo $_SESSION['name']; ?>,</span><br />
          It's <?php echo date("l, d M Y"); ?> today.
        </div>
        <div class="box-large bottom-gap">
          <h4>Escalate</h4>
          <?php
            $sql_2="SELECT hostel, name, email FROM `users` WHERE level = 'warden' order by hostel asc";
            $request_2=mysqli_query($conn,$sql_2);
            $ntypes=mysqli_num_rows($request_2);
          ?>

          Hostel warden<?php if($ntypes>1) echo "s"; ?>:<br />
            <?php
            while($row = mysqli_fetch_array($request_2)){
              echo "- <a href='mailto:" . $row['email'] .  "?subject=[Court]%20General%20Secretary%20(Hostel%20Affairs)%20Message'>" . $row['name'] . "</a> (Hostel " . $row['hostel'] . ")<br />";
            }
            if($ntypes==0){
              echo "<i>No warden assigned<br />";
            }
            ?>

          <?php
            $sql_2="SELECT name, email FROM `users` WHERE level = 'dean.sw'";
            $request_2=mysqli_query($conn,$sql_2);
            $ntypes=mysqli_num_rows($request_2);
          ?>
          Dean <?php if($ntypes>1) echo "s"; ?> (Student Welfare):<br />
            <?php
            while($row = mysqli_fetch_array($request_2)){
              echo "- <a href='mailto:" . $row['email'] .  "?subject=[Court]%20General%20Secretary%20(Hostel%20Affairs)%20Message'>" . $row['name'] . "</a><br />";
            }
            if($ntypes==0){
              echo "<i>No Dean Student Welfare present<br />";
            }
            ?>
        </div>

        <?php
        }
        ?>

        <?php
				if($_SESSION['level']=="gsha" || $_SESSION['level']=="admin"){
          //ONLY FOR GSHA/ADMINS
				?>
						<div class="box-large bottom-gap" id="stats" style="width:100%;">
              <h4>Quantity History</h4>
              <script type="text/javascript">
              google.charts.load('current', {'packages':['corechart']});
              google.charts.setOnLoadCallback(drawChart);


              function drawChart() {
                var data = google.visualization.arrayToDataTable([
                  ['Date', <?php
                    $hostels = array();
                    $sql_2="SELECT distinct hostel_no FROM complains order by hostel_no asc"; //preparing SQL command to get all issue types
                    $request_2=mysqli_query($conn,$sql_2);
                    $ntypes=mysqli_num_rows($request_2);
                    while($row = mysqli_fetch_array($request_2)){
                      echo "'" . $row['hostel_no'] ."'";
                      if($ntypes>1) echo ",";
                      $ntypes--;
                      array_push($hostels,$row['hostel_no']);
                    }

                  ?>],
                  <?php
                    for($i=29; $i>-2; $i--){
                      echo "['";
                      $sql_2="SELECT distinct hostel_no FROM complains order by hostel_no asc";
                      $request_2=mysqli_query($conn,$sql_2);
                      $dateMade=0;
                      while($row = mysqli_fetch_array($request_2)){
                        // echo "(i=" . $i . ", hostel=" . $row['hostel_no'] . "), ";
                        $sql_3 = "select DATE_SUB(CURRENT_DATE, INTERVAL " . $i . " DAY) as date, count(complain_id) as count, hostel_no as hostel from complains where DATE_SUB(CURRENT_DATE, INTERVAL " . $i .  " DAY)>DATE(complains.time) and hostel_no='" . $row['hostel_no'] . "'";
                        // echo "(sql: " . $sql_3 . "), ";
                        $request_3=mysqli_query($conn,$sql_3);
                        $row_3 = mysqli_fetch_array($request_3);
                        if($dateMade==0) {
                          echo $row_3[date] . "'," . $row_3[count];
                          $dateMade++;
                        }else{
                          echo "," . $row_3[count];
                        }
                    }
                    if($i!=-1) echo "],"; else echo "]";
                  }
                  ?>

                ]);

                var options = {
                  title: '',
                  curveType: 'function',
                  legend: { position: 'bottom' }
                };

                var chart = new google.visualization.LineChart(document.getElementById('hostel_history'));

                chart.draw(data, options);
              }
              </script>

              <div class="gchart" id="hostel_history"></div>
						</div>

				<?php
        //ONLY FOR ADMIN BLOCK ends
      } else if($_SESSION['level']=="warden" || $_SESSION['level']=="secy"){
        //ONLY FOR SECY/WARDENs
				?>

        <div class="box-large bottom-gap" id="stats" style="width:100%;">
          <h4>Campus Overview</h4>
          <script type="text/javascript">
          google.charts.load('current', {'packages':['corechart']});
          google.charts.setOnLoadCallback(drawChart);
          function drawChart() {
            var data = google.visualization.arrayToDataTable([
            ['Type', 'Number'],
            <?php

            $sql_2="select complains.issue_type, count(complain_id) as count from complains, issue_type_table where issue_type_table.issue_type_option_name = complains.issue_type group by complains.issue_type";

            $request_2=mysqli_query($conn,$sql_2);
            $ntypes=mysqli_num_rows($request_2);
            $mtypes=$ntypes;

            while($row = mysqli_fetch_array($request_2)){

              echo "[" . "'" . $row['issue_type'] ."', " . $row['count'] . "]";
              if($ntypes>1) echo ",";
              $ntypes--;
            }
            ?>

            ]);

            var options = {
            title: '',
            //colors: ['#ddd','#bbb','#999','#777','#555','#333','#111']
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);
          }
          </script>

          <div id="piechart" style="max-width: 100%; height: auto;"></div>

          <?php
          $sql="SELECT * FROM complains";
          $request=mysqli_query($conn,$sql);
          $ncomplains_campus=mysqli_num_rows($request); //total number of complains
          ?>
          <div class="complainsSum"><?php echo "Σ = ". $ncomplains_campus. "<br />";?></div>

          <?php
          $sql="SELECT * FROM complains where hostel_no=" . $_SESSION['hostel'];
          $request=mysqli_query($conn,$sql);
          $ncomplains_hostel=mysqli_num_rows($request); //total number of complains
          ?>

          About <span style="color: rgb(<?php echo 75+(180)*(round($ncomplains_hostel/$ncomplains_campus)); ?>,25,25);"><?php echo round($ncomplains_hostel/$ncomplains_campus * 100); ?>%</span> complaints come from hostel <?php echo $_SESSION['hostel'] ?>.

        </div>

      <?php
      }
      ?>
      </div>

      <div class="col-sm-4 bottom-gap">
        <?php
        if($_SESSION['level']=='warden' || $_SESSION['level']=='secy'){
        ?>
          <div class="box-large bottom-gap" id="stats" style="width:100%;">
            <h4>Hostel <?php echo $_SESSION['hostel'];?></h4><h6>Overview</h6>
            <script type="text/javascript">
            google.charts.load('current', {'packages':['corechart']});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
              var data = google.visualization.arrayToDataTable([
              ['Type', 'Number'],
              <?php

              $sql_2="select complains.issue_type, count(complain_id) as count from complains, issue_type_table where issue_type_table.issue_type_option_name = complains.issue_type and hostel_no='" . $_SESSION['hostel'] . "' group by complains.issue_type";

              $request_2=mysqli_query($conn,$sql_2);
              $ntypes=mysqli_num_rows($request_2);

              while($row = mysqli_fetch_array($request_2)){
                echo "[" . "'" . $row['issue_type'] ."', " . $row['count'] . "]";
                if($ntypes>1) echo ",";
                $ntypes--;
              }
              ?>

              ]);

              var options = {
              title: ''
              };

              var chart = new google.visualization.PieChart(document.getElementById('piechart_hostel'));

              chart.draw(data, options);
            }
            </script>

            <div class="gchart" id="piechart_hostel"></div>

            <h6>Floorwise</h6>
            <script type="text/javascript">
            google.charts.load('current', {'packages':['corechart']});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
              var data = google.visualization.arrayToDataTable([
              <?php
              $sql_2="SELECT * FROM issue_type_table order by issue_type_option_name"; //preparing SQL command to get all issue types
              $request_2=mysqli_query($conn,$sql_2);
              $ntypes=mysqli_num_rows($request_2);

              $sql_4="SELECT distinct floor_no FROM `complains` where hostel_no='". $_SESSION['hostel'] . "' ORDER BY `floor_no` DESC";
              $request_4=mysqli_query($conn,$sql_4);
              $ntypes_4=mysqli_num_rows($request_4);

              if($ntypes_4>0){
              echo "['type',";
              while($row = mysqli_fetch_array($request_2)){
                echo "'" . $row['issue_type_option_name'] ."'";
                if($ntypes>1) echo ",";
                $ntypes--;
              }
              echo "],";
              }


              while($row_4 = mysqli_fetch_array($request_4)){

                echo "['" . $row_4['floor_no'] . "',";

                $sql_2="SELECT * FROM issue_type_table order by issue_type_option_name"; //preparing SQL command to get all issue types
                $request_2=mysqli_query($conn,$sql_2);
                $ntypes_2=mysqli_num_rows($request_2);

                while($row_2 = mysqli_fetch_array($request_2)){
                  $sql_5="SELECT * FROM complains where hostel_no='" . $_SESSION['hostel'] . "' and issue_type = '" . $row_2['issue_type_option_name'] . "' and floor_no='" . $row_4['floor_no'] . "'";
                  //echo $sql_5;
                  $request_5=mysqli_query($conn,$sql_5);
                  $ntypes_5=mysqli_num_rows($request_5);
                  echo $ntypes_5;

                  if($ntypes_2>1) echo ",";
                  $ntypes_2--;
                }

                echo "]";
                if($ntypes_4>1) echo ",";
                $ntypes_4--;

              }

              ?>

              ]);

              var options = {
                legend: { position: 'top', maxLines: 10 },
                bar: { groupWidth: '75%' },
                isStacked: true
              };

              var chart = new google.visualization.BarChart(document.getElementById('barchart_floorwise'));

              chart.draw(data, options);
            }
            </script>

            <div class="gchart" id="barchart_floorwise"></div>

            <?php
            $sql="SELECT * FROM complains where hostel_no=" . $_SESSION['hostel'];
            $request=mysqli_query($conn,$sql);
            $ncomplains_hostel=mysqli_num_rows($request); //total number of complains
            ?>
            <div class='complainsSum'><?php echo "Σ = ". $ncomplains_hostel. "<br />";?></div>

          </div>

          <?php
          } else if($_SESSION['level']=="gsha"){
          ?>
            <div class="box-large bottom-gap">

              <h4>Campus Overview</h4>
							<script type="text/javascript">
							google.charts.load('current', {'packages':['corechart']});
							google.charts.setOnLoadCallback(drawChart);
							function drawChart() {
							  var data = google.visualization.arrayToDataTable([
								['Type', 'Number'],
								<?php

                $sql_2="select complains.issue_type, count(complain_id) as count from complains, issue_type_table where issue_type_table.issue_type_option_name = complains.issue_type group by complains.issue_type";

                $request_2=mysqli_query($conn,$sql_2);
								$ntypes=mysqli_num_rows($request_2);

								while($row = mysqli_fetch_array($request_2)){

									echo "[" . "'" . $row['issue_type'] ."', " . $row['count'] . "]";
									if($ntypes>1) echo ",";
									$ntypes--;
								}
								?>

							  ]);

							  var options = {
								title: ''
							  };

							  var chart = new google.visualization.PieChart(document.getElementById('piechart'));

							  chart.draw(data, options);
							}
							</script>

							<div id="piechart" style="max-width: 100%; height: auto;"></div>

							<?php
							$sql="SELECT * FROM complains";
							$request=mysqli_query($conn,$sql);
							$ncomplains=mysqli_num_rows($request); //total number of complains
							?>
							<div class="complainsSum"><?php echo "Σ = ". $ncomplains."<br />";?></div>

              <h6>Hostelwise</h6>
              <script type="text/javascript">
              google.charts.load('current', {'packages':['corechart']});
              google.charts.setOnLoadCallback(drawChart);
              function drawChart() {
                var data = google.visualization.arrayToDataTable([
                <?php
                $sql_2="SELECT * FROM issue_type_table order by issue_type_option_name"; //preparing SQL command to get all issue types
                $request_2=mysqli_query($conn,$sql_2);
                $ntypes=mysqli_num_rows($request_2);
                echo "['type',";
                while($row = mysqli_fetch_array($request_2)){
                  echo "'" . $row['issue_type_option_name'] ."'";
                  if($ntypes>1) echo ",";
                  $ntypes--;
                }
                echo "],";

                $sql_4="SELECT distinct hostel_no FROM `complains` ORDER BY `hostel_no` DESC";
                $request_4=mysqli_query($conn,$sql_4);
                $ntypes_4=mysqli_num_rows($request_4);

                while($row_4 = mysqli_fetch_array($request_4)){

                  echo "['" . $row_4['hostel_no'] . "',";

                  $sql_2="SELECT * FROM issue_type_table order by issue_type_option_name"; //preparing SQL command to get all issue types
                  $request_2=mysqli_query($conn,$sql_2);
                  $ntypes_2=mysqli_num_rows($request_2);

                  while($row_2 = mysqli_fetch_array($request_2)){
                    $sql_5="SELECT * FROM complains where hostel_no='" . $row_4['hostel_no'] . "' and issue_type = '" . $row_2['issue_type_option_name'] . "'";
                    //echo $sql_5;
                    $request_5=mysqli_query($conn,$sql_5);
                    $ntypes_5=mysqli_num_rows($request_5);
                    echo $ntypes_5;

                    if($ntypes_2>1) echo ",";
                    $ntypes_2--;
                  }

                  echo "]";
                  if($ntypes_4>1) echo ",";
                  $ntypes_4--;

                }

                ?>

                ]);

                var options = {
                  legend: { position: 'top', maxLines: 10 },
                  bar: { groupWidth: '75%' },
                  isStacked: true
                };

                var chart = new google.visualization.BarChart(document.getElementById('barchart_floorwise'));

                chart.draw(data, options);
              }
              </script>

              <div class="gchart" id="barchart_floorwise"></div>

            </div>
          <?php
          }
          ?>
      </div>
    </div>
    </div>


  <div class="container">
    <div class="row">
			<div class="col-sm-12 bottom-gap">

				<?php
				if($_SESSION['level']=="gsha" || $_SESSION['level']=="warden" || $_SESSION['level']=="secy"){
					//ONLY FOR ADMINS BLOCK
						//this BLOCK lists out all the complaints
				?>

					<div class="box-large" id="old-complains-div" style="width:100%;">
            <h3 class="logo">Log<?php if($_SESSION['level']=="warden" || $_SESSION['level']=="secy") echo " (Hostel " . $_SESSION['hostel'] . ")" ?></h3>

							<?php

                if($_SESSION['level']=="gsha")
								$sql="SELECT * FROM complains "; //basic sql structure
                else if($_SESSION['level']=="warden" || $_SESSION['level']=="secy")
                $sql="SELECT * FROM complains where hostel_no='" . $_SESSION['hostel'] . "' "; //basic sql structure

								$conditions=0; //conditions counter for proper placements of ',' in sql

								if(isset($_POST['sort_submit'])){ //if conditions were set

									if(!empty($_POST['type_specific'])){
										//type of complaints was specified
                    if($_SESSION['level']=="gsha")
										$sql.="WHERE issue_type LIKE '$_POST[type_specific]' ";
                    else if($_SESSION['level']=="warden" || $_SESSION['level']=="secy")
                    $sql.="and issue_type LIKE '$_POST[type_specific]' ";

                    if($_POST['hostel_specific']!=""){
                      $sql.="and hostel_no='$_POST[hostel_specific]' ";
                    }

									}else if($_POST['hostel_specific']!=""){
                    if($_SESSION['level']=="gsha")
                    $sql.="WHERE hostel_no='$_POST[hostel_specific]' ";
                    else if($_SESSION['level']=="warden" || $_SESSION['level']=="secy")
                    $sql.="and hostel_no='$_POST[hostel_specific]' ";
                  }

									if(!empty($_POST['hostel_sort']) OR !empty($_POST['floor_sort']) OR !empty($_POST['id_sort']) OR !empty($_POST['room_sort']) OR !empty($_POST['time_sort']) OR !empty($_POST['type_sort']))
									$sql.="ORDER BY ";

									if(!empty($_POST['id_sort'])){
										//id given most preference
										$sql.="complain_id $_POST[id_sort] ";
										$conditions++;
									}

									if(!empty($_POST['type_sort'])){
										//type given second priority
										if ($conditions>0) $sql.=",";
										$sql.="issue_type $_POST[type_sort] ";
										$conditions++;
									}

									if(!empty($_POST['hostel_sort'])){
										//room number given third priority
										if ($conditions>0) $sql.=",";
										$sql.="hostel_no $_POST[hostel_sort] ";
										$conditions++;
									}

									if(!empty($_POST['floor_sort'])){
										//room number given third priority
										if ($conditions>0) $sql.=",";
										$sql.="floor_no $_POST[floor_sort] ";
										$conditions++;
									}

									if(!empty($_POST['room_sort'])){
										//room number given third priority
										if ($conditions>0) $sql.=",";
										$sql.="room_no $_POST[room_sort] ";
										$conditions++;
									}

									if(!empty($_POST['time_sort'])){
										//time given last priority
										if ($conditions>0) $sql.=",";
										$sql.="time $_POST[time_sort] ";
										$conditions++;
									}

									if($conditions==0){
										//default ORDER BY request
										$sql.="ORDER BY complain_id DESC";
									}

								} else{
									//conditions were not set
									//default ORDER BY request
									$sql.="ORDER BY complain_id DESC ";
								}

								//echo $conditions. " " .$sql; //for debugging

								$request = mysqli_query($conn,$sql); //fetching sql data for line number 264

							?>

							<table style="width:100%" id="old-complains-table" class="table2excel">
							<tr id="log-header" class="noExl">
								<form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post">
								<td>Id<br />
                  <select name="id_sort">
                    <option value="" <?php if (isset($_POST['id_sort']) && ($_POST['id_sort']=="")) echo "selected='selected'"; ?> >-</option>
                    <option value="ASC" <?php if (isset($_POST['id_sort']) && ($_POST['id_sort']=="ASC")) echo "selected='selected'"; ?> >ascend</option>
                    <option value="DESC" <?php if (isset($_POST['id_sort']) && ($_POST['id_sort']=="DESC")) echo "selected='selected'"; ?> >descen</option>
                  </select>
                </td>

                <td>Hostel<br />
                  <select name="hostel_sort">
                    <option value="" <?php if (isset($_POST['hostel_sort']) && ($_POST['hostel_sort']=="")) echo "selected='selected'"; ?> >-</option>
                    <option value="ASC" <?php if (isset($_POST['hostel_sort']) && ($_POST['hostel_sort']=="ASC")) echo "selected='selected'"; ?> >ascend</option>
                    <option value="DESC" <?php if (isset($_POST['hostel_sort']) && ($_POST['hostel_sort']=="DESC")) echo "selected='selected'"; ?> >descen</option>
                  </select>

                    <?php
                     if($_SESSION['level']=="gsha" || $_SESSION['level']=="admin"){
                    ?>
										<br /><select name="hostel_specific">
													<option value="">show all</option>
    												<?php
    													$sql_2="SELECT DISTINCT hostel_no FROM complains"; //preparing SQL command to get all issue types for the form
    													$request_2=mysqli_query($conn,$sql_2);
    													while($row_2=mysqli_fetch_array($request_2)){ //echoing all issue types
    												?>
    													<option value="<?php echo $row_2['hostel_no'];?>" <?php if (isset($_POST['hostel_specific']) && ($_POST['hostel_specific']==$row_2['hostel_no'])) echo "selected='selected'"; ?> ><?php echo $row_2['hostel_no'];?></option>
    												<?php
    													}
    												?>
											  </select></td>
                    <?php
                    }
                    ?>
                </td>

                <td>Floor<br />
                  <select name="floor_sort">
                    <option value="" <?php if (isset($_POST['floor_sort']) && ($_POST['floor_sort']=="")) echo "selected='selected'"; ?> >-</option>
                    <option value="ASC" <?php if (isset($_POST['floor_sort']) && ($_POST['floor_sort']=="ASC")) echo "selected='selected'"; ?> >ascend</option>
                    <option value="DESC" <?php if (isset($_POST['floor_sort']) && ($_POST['floor_sort']=="DESC")) echo "selected='selected'"; ?> >descen</option>
                  </select>
                </td>

								<td>Room<br />
                  <select name="room_sort">
                    <option value="" <?php if (isset($_POST['room_sort']) && ($_POST['room_sort']=="")) echo "selected='selected'"; ?> >-</option>
                    <option value="ASC" <?php if (isset($_POST['room_sort']) && ($_POST['room_sort']=="ASC")) echo "selected='selected'"; ?> >ascend</option>
                    <option value="DESC" <?php if (isset($_POST['room_sort']) && ($_POST['room_sort']=="DESC")) echo "selected='selected'"; ?> >descen</option>
                  </select>
                </td>

								<td>Issue</td>

								<td>Type<br />
                  <select name="type_sort">
                    <option value="" <?php if (isset($_POST['type_sort']) && ($_POST['type_sort']=="")) echo "selected='selected'"; ?> >-</option>
                    <option value="ASC" <?php if (isset($_POST['type_sort']) && ($_POST['type_sort']=="ASC")) echo "selected='selected'"; ?> >ascend</option>
                    <option value="DESC" <?php if (isset($_POST['type_sort']) && ($_POST['type_sort']=="DESC")) echo "selected='selected'"; ?> >descen</option>
                  </select>

										<br /><select name="type_specific">
													<option value="">show all</option>
    												<?php
    													$sql_2="SELECT * FROM issue_type_table"; //preparing SQL command to get all issue types for the form
    													$request_2=mysqli_query($conn,$sql_2);
    													while($row_2=mysqli_fetch_array($request_2)){ //echoing all issue types
    												?>
    													<option value="<?php echo $row_2['issue_type_option_name'];?>" <?php if (isset($_POST['type_specific']) && ($_POST['type_specific']==$row_2['issue_type_option_name'])) echo "selected='selected'"; ?> ><?php echo $row_2['issue_type_option_name'];?></option>
    												<?php
    													}
    												?>
											  </select></td>

                <td>Roll<br />Number</td>

                <td>Phone</td>

								<td>Time<br />
                  <select name="time_sort">
                    <option value="" <?php if (isset($_POST['time_sort']) && ($_POST['time_sort']=="")) echo "selected='selected'"; ?> >-</option>
                    <option value="ASC" <?php if (isset($_POST['time_sort']) && ($_POST['time_sort']=="ASC")) echo "selected='selected'"; ?> >ascend</option>
                    <option value="DESC" <?php if (isset($_POST['time_sort']) && ($_POST['time_sort']=="DESC")) echo "selected='selected'"; ?> >descen</option>
                  </select>
                </td>

								<td><input type="submit" name="sort_submit" value="GO"/></td>

								</form>
							</tr>

							<?php

							//barfing requested data (list of complaints complying conditions set by user)

							if(mysqli_num_rows($request)==0){

								//no complaints present
								echo "<tr><td colspan=7><span class='logo'>All issues have been resolved.</span></td></tr>";

							}else{
									$n=50; //IMP: change to set the number of complains visible on admin page,
												//keep it positive to show any complaints

									while($row=mysqli_fetch_array($request) AND $n>0){
										//for each complaint

										$complain_id=$row['complain_id'];
                    $hostel_no=$row['hostel_no'];
                    $floor_no=$row['floor_no'];
										$room_no=$row['room_no'];
										$issue=$row['issue'];
										$issue_type=$row['issue_type'];
                    $roll_no=$row['roll_no'];
										$phone_no=$row['phone_no'];
										$time=$row['time'];
										//$n--; //IMP: uncomment this line to set an upper limit on the number of posts visible on admin page (line 248)

										$content_for_deletion=array("del_submit"=>"submit", "complain_id" =>"$complain_id"); //delete what array
										$del_link=str_replace('admin.php','actions/delete.php',$_SERVER['PHP_SELF'])."?".http_build_query($content_for_deletion); //deletion link
							?>

										<tr id="complaint-<?php echo $complain_id; ?>" <?php if($issue_type == "sensitive") echo "class='old-complains-table-row sensitive-complain'"; else echo "class='old-complains-table-row'";?> >
											<td><?php echo $complain_id;?></td>
											<td><?php echo $hostel_no;?></td>
											<td><?php echo $floor_no;?></td>
											<td><?php echo $room_no;?></td>
											<td><?php echo $issue;?></td>
											<td><?php echo $issue_type;?></td>
											<td><?php echo $roll_no;?></td>
											<td><?php echo $phone_no;?></td>
											<td><?php echo $time;?></td>
											<!-- <td class="del_button del_td noExl"><span><a href="<?php echo $del_link;?>" onclick="return confirm('Are you sure?')">x</a></span></td> -->
                      <td class="del_td noExl"><span class="del_button" onclick="deleteID(<?php echo $complain_id; ?>)">x</span></td>
										</tr>

							<?php
									}
								}

							?>
						</table><br />
						<button id="excel-download">Download</button>
					</div>

          <script>
          function deleteID(complaint_id){
            console.log("delete-"+complaint_id+" requested");
            var elementID="#complaint-"+complaint_id;
            console.log(elementID);
            //$(elementID).remove();

            var xhr = new XMLHttpRequest();
            xhr.open("POST", './actions/delete.php', true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function() {//Call a function when the state changes.
              if(this.readyState == XMLHttpRequest.DONE && this.status == 200) {
                console.log(xhr.responseText);
                  if(xhr.responseText=="success"){
                    $(elementID).remove();
                  }else{
                    window.alert("Failed - Error:\n"+xhr.responseText);
                  }
              }
            }

            xhr.send("del_submit=submit&complain_id="+complaint_id);

          }
          </script>

				<?php
				} //ONLY FOR ADMINS BLOCK ends
				?>
			</div>


		</div>
	</div>
	<script>
	$("#excel-download").click(function(){
		$(".table2excel").table2excel({
	    	exclude: ".noExl",
	    	name: "Complains" ,
	    	filename: "Complains",
			fileext: ".xls",
		});
	});

	//On click (download button)
	document.getElementById('excel-download').onclick = function(){
		document.getElementById('excel-download').style.backgroundColor='#5FBF5F';
		document.getElementById('excel-download').style.border='1px solid #5FBF5F';
		if(document.getElementById('excel-download').innerHTML.indexOf("✔")==-1)
			document.getElementById('excel-download').innerHTML="✔";
		document.getElementById('excel-download').style.color='#fff';
	}

	//On mouser over (download button)
	document.getElementById('excel-download').onmouseover = function(){
		if(document.getElementById('excel-download').innerHTML.indexOf("✔")==-1){
		document.getElementById('excel-download').style.backgroundColor='#A1E2A1';
		document.getElementById('excel-download').style.border='1px solid #A1E2A1';
		document.getElementById('excel-download').style.color='#fff';
		}
	}

	//On mouser out (download button)
	document.getElementById('excel-download').onmouseout = function(){
		if(document.getElementById('excel-download').innerHTML.indexOf("✔")==-1){
		document.getElementById('excel-download').style.backgroundColor='#fff';
		document.getElementById('excel-download').style.border='1px solid #ddd';
		document.getElementById('excel-download').style.color='#000';
		}
	}

	</script>
	<!-- /CONTENT INSIDE -->
<?php
} else{
	//user not logged in
		header('Location:login.php');
?>

Authentication failed

<?php
}
?>

<div id="stats">
  <script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-87834345-3', 'auto');
    ga('send', 'pageview');

  </script>
</div>

</body>
</html>
