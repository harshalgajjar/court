<?php
// (c) Harshal Gajjar (gotoharshal@gmail.com)
// This code is available under GNU General Public Licence v3

session_start(); //starting session
error_reporting(0);
date_default_timezone_set('Asia/Kolkata'); //changing default time zone
if (isset($_SESSION['login']) AND $_SESSION['login']=="success" AND ($_SESSION['level']=='gsha' || $_SESSION['level']=='warden' || $_SESSION['level']=='secy')){ //checking for login status
  include_once "connections/connect.php"; //connecting to database
  $formcounter=0;
  ?>
  <!DOCTYPE html>
  <html lang="en-US">
  <head>
    <title>Mail - Court</title>
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
    <link rel="stylesheet" href="style_mail.css">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" scr="gchart.js"></script>
  </head>
  <body>

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
              <li><a href="admin.php">Complaints</a></li>
              <li><a href="logout.php">Log out</a></li>
            </ul>
          </div>
        </div>
      </nav>
    </header>

    <div class="container-fluid bottom-gap" id="team_container_fluid">
      <div class="container" id="team">
        <h3>Mail</h3>
        <div class="row">
          <div class="col-sm-6 bottom-gap">
            <h4>Announce</h4>

            <form name="announce" action="mail.php" method="POST" onsubmit="return announce_submit()">
              To:<br />
              <?php
              if($_SESSION['level']=="gsha"){
                $sql = "SELECT distinct hostel_no FROM complains";
                $request = mysqli_query($conn, $sql);
                $nrows = mysqli_num_rows($request);
                while($row = mysqli_fetch_array($request)){
                  ?>
                  <input type="checkbox" name="hostel" value="<?php echo $row['hostel_no']; ?>" checked="checked"> Hostel <?php echo $row['hostel_no']; ?>
                  <?php
                }
              }else if($_SESSION['level']=="warden" || $_SESSION['level']=="secy"){
                ?>
                  <input type="checkbox" name="hostel" value="<?php echo $_SESSION['hostel']; ?>" checked="checked"> Hostel <?php echo $_SESSION['hostel']; ?>
                <?php
              }
              ?>
              <i>students</i>
              <br />
              With:<br />
              <?php
              $sql = "SELECT distinct `issue_type_option_name` FROM `issue_type_table`";
              $request = mysqli_query($conn, $sql);
              $nrows = mysqli_num_rows($request);
              while($row = mysqli_fetch_array($request)){
                ?>
                <input type="checkbox" name="issue" value="<?php echo $row['issue_type_option_name']; ?>" checked="checked"> <?php echo $row['issue_type_option_name']; ?>
                <?php
              }
              ?>
              <i>issues</i>
              <br /><br />
              Subject:<br />
              <input type="text" name="subject" /><br />
              Message:
              <textarea name="message" class="text-area-custom"></textarea>
              <input id="announce_submit_button" type="submit" nam="announce" value="Send" /><br /><br />
              <input type="submit" onclick="location.reload()" style="visibility:hidden;" id="another_announce" value="Send another announcement" />
            </form>

          </div>
        </div>
      </div>
    </div>
    <script>
    var hostels = [];
    var issues = [];

    function announce_submit(){
      var message = document.forms["announce"]["message"].value;
      var subject = document.forms["announce"]["subject"].value;

      if(subject.trim()==""){
        window.alert("Please add a subject");
        return false;
      }else if(message.trim()==""){
        window.alert("Please add a message");
        return false;
      }

      var hostels = [];
      var issues = [];
      var checkboxes = document.querySelectorAll('input[type=checkbox]:checked')

      for (var i = 0; i < checkboxes.length; i++) {
        if(checkboxes[i].name=="hostel")
          hostels.push(checkboxes[i].value);
        else if(checkboxes[i].name=="issue"){
          issues.push(checkboxes[i].value);
        }
      }

      hostels_json = JSON.stringify(hostels);
      issues_json = JSON.stringify(issues);

      var xhr = new XMLHttpRequest();
      xhr.open("POST", './actions/mailer.php', true);
      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

      xhr.onreadystatechange = function() {//Call a function when the state changes.
        if(this.readyState == XMLHttpRequest.DONE && this.status == 200) {
          console.log(xhr.responseText);
            if(xhr.responseText=="success"){
              document.getElementById('announce_submit_button').style.backgroundColor='#5FBF5F';
              document.getElementById('announce_submit_button').style.color='#fff';
              document.getElementById('announce_submit_button').value='✔';
              document.getElementById('another_announce').style.visibility='visible';
              document.forms["announce"]["subject"].disabled=true;
              document.forms["announce"]["message"].disabled=true;
              document.getElementById('announce_submit_button').disabled=true;
            }else{
              console.log(xhr.responseText);
              document.getElementById('announce_submit_button').style.backgroundColor='rgb(222,106,106)';
              document.getElementById('announce_submit_button').style.color='#fff';
              document.getElementById('announce_submit_button').value='X (Click to retry)';
            }
        }
      }

      xhr.send("type=announce&hostels="+hostels.join(",")+"&issues="+issues.join(",")+"&sender=<?php echo $_SESSION['level']; ?>&senderHostel=<?php echo $_SESSION['hostel'];?>&message="+message+"&subject="+subject);

      return false;
    }
    </script>


    <?php
  } else{
    //user not logged in
    header('Location:admin.php');
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
