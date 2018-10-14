<?php
// (c) Harshal Gajjar (gotoharshal@gmail.com)
// This code is available under GNU General Public Licence v3

session_start(); //starting session
error_reporting(1);
date_default_timezone_set('Asia/Kolkata'); //changing default time zone
if (isset($_SESSION['login']) AND $_SESSION['login']=="success"){ //checking for login status
  include_once "connections/connect.php"; //connecting to database

  ?>
  <!DOCTYPE html>
  <html lang="en-US">
  <head>
    <title>Leave - Court</title>
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
    <link rel="stylesheet" href="style_leave.css">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" scr="gchart.js"></script>

    <script type="text/javascript" src="./resources/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
    <link href="./resources/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

    <script src="./resources/js/vis.js"></script>
    <link href="./resources/css/vis-timeline-graph2d.min.css" rel="stylesheet" type="text/css" />

    <script type='text/javascript'>
    var map;
    function loadMap() {
      if (!map) {
        var mapScriptUrl = 'https://www.bing.com/api/maps/mapcontrol?callback=GetMap&key=Agv5CiYHO_n_syXFBBRh0Pr5A31Dm6pvUQTAQ-w3vRWKwOx9AF0HzfgzSeG2mqCt';
        var script = document.createElement("script");
        script.setAttribute('defer', '');
        script.setAttribute('async', '');
        script.setAttribute("type", "text/javascript");
        script.setAttribute("src", mapScriptUrl);
        document.body.appendChild(script);
      }
    }

    function GetMap()
    {
      map = new Microsoft.Maps.Map('#BingMap', {});

      map.setView({
        //mapTypeId: Microsoft.Maps.MapTypeId.aerial,
        center: new Microsoft.Maps.Location(22.322314, 78.970009),
        zoom: 4
      });

      Microsoft.Maps.Events.addHandler(map, 'click', function (e) {

        if(submitted) return;

        for (var i = map.entities.getLength() - 1; i >= 0; i--) {
          var pushpin = map.entities.get(i);
          if (pushpin instanceof Microsoft.Maps.Pushpin) {
            map.entities.removeAt(i);
          }
        }

        currentPushpin = new Microsoft.Maps.Pushpin(e.location,{
          color: 'black'
        });

        map.entities.push(currentPushpin);
        document.getElementById("dest-Coordinates").value=currentPushpin.getLocation().latitude+","+currentPushpin.getLocation().longitude;

      });

      <?php if($_SESSION['level']=="warden"){?>
      map2 = new Microsoft.Maps.Map('#BingMapIndividual', {});
      map2.setView({
        //mapTypeId: Microsoft.Maps.MapTypeId.aerial,
        center: new Microsoft.Maps.Location(22.322314, 78.970009),
        zoom: 4
      });

      for (var item in items._data) {
          var coordinatesInfo = items._data[item].destination.replace("%2C",",").split(",");
          var location = new Microsoft.Maps.Location(coordinatesInfo[0], coordinatesInfo[1]);
          newPushpin = new Microsoft.Maps.Pushpin(location,{
            color: 'rgba(100,100,100)'
          });
          map2.entities.push(newPushpin);
      }

      <?php } ?>

    }


    </script>


  </head>
  <body onload="loadMap()">

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
              <li><a href="admin.php">Complain<?php if($_SESSION['level']=="warden" || $_SESSION['level']=="secy" || $_SESSION['warden']) echo "ts";?></a></li>
              <li><a href="logout.php">Log out</a></li>
            </ul>
          </div>
        </div>
      </nav>
    </header>

    <div class="container-fluid" id="lr_container_fluid">
      <div class="container" id="lr">

        <h3>New Leave Request</h3>
        <div class="row">

          <form name="leave_request" action="actions/edit_lr.php" method="POST" onsubmit="return lr_submit()">

            <div class="col-sm-6">

              <div class="row">
                <div class="col-sm-6">
                  Name<span class="required">*</span> <input name="name" type="text">
                </div>

                <div class="col-sm-6">
                  Roll Number<span class="required">*</span> <input name="roll_no" type="text">
                </div>
              </div><br />
              <div class="row">
                <div class="col-sm-4">
                  Hostel Number<span class="required">*</span> <input name="hostel_no" placeholder="0,1,2,..." type="text">
                </div>

                <div class="col-sm-4">
                  Floor Number<span class="required">*</span> <input name="floor_no" placeholder="0,1,2,..." type="text">
                </div>

                <div class="col-sm-4">
                  Room Number<span class="required">*</span> <input name="room_no" type="text">
                </div>
              </div><br />
              <div class="row">

                <div class="col-sm-6">
                  Personal Contact Number<span class="required">*</span>
                  <div class="input-group">
                    <span class="input-group-addon">+91</span>
                    <input type="text" class="form-control" name="pContact">
                  </div>
                </div>

                <div class="col-sm-6">
                  Destination Contact Number<span class="required">*</span>
                  <div class="input-group">
                    <span class="input-group-addon">+91</span>
                    <input type="text" class="form-control" name="dContact">
                  </div>
                </div>
              </div><br />
              <div class="row">

              </div>

              <h4>DEPARTURE (from Campus)</h4>

              Date and Time<span class="required">*</span>
              <div class="input-group date form_datetime" data-date="1979-09-16T05:25:07Z" data-date-format="dd MM yyyy HH:ii p" data-link-field="dtp_input1">
                <input name="dTime" class="form-control" type="text" value="" readonly>
                <!-- <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> -->
                <!-- <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span> -->
                <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
              </div>

              <h4>ARRIVAL (into Campus)</h4>

              Date and Time<span class="required">*</span>
              <div class="input-group date form_datetime" data-date="1979-09-16T05:25:07Z" data-date-format="dd MM yyyy HH:ii p" data-link-field="dtp_input1">
                <input name="aTime" class="form-control" size="16" type="text" value="" readonly>
                <!-- <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> -->
                <!-- <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span> -->
                <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
              </div>

              Cause of the journey<span class="required">*</span>
              <textarea name="cause" class="text-area-custom"></textarea>

            </div>

            <div class="col-sm-6">

              Destination<span class="required">*</span>
              <input name="destination" id="dest-Coordinates" type="text" placeholder="Mark on map" style="cursor: not-allowed; height:2em;" readonly />
              <div id="BingMap" style="position:relative;width:100%;height:500px;"></div>

            </div>

        </div>
        <input id="lr_submit_button" type="submit" name="add" value="Submit" /><br /><br />
        </form>
        <!-- <button onclick="lr_submit()" />hello</button> -->
      </div>
    </div>


    <?php
    if($_SESSION['level']=="warden"){
    ?>
    <div class="container-fluid" style="min-height:100vh;">
      <div class="container">
        <?php
          $sql = "select * from leave_requests where hostel_no=" . $_SESSION['hostel'] . " and status='Approval Pending'";
          $request = mysqli_query($conn, $sql);
        ?>
        <h3 style="display:inline-block;">Requests</h3> (<?php echo mysqli_num_rows($request); ?> Pending)

        <br />
        Actions:
        <ul style="list-style-type: circle;">
          <li>Double Click: Approve</li>
          <li>Single Click: View on Map (and show Decline button)</li>
          <li>Right Click: Reset decision</li>
        </ul>
        Every action will send an email to the student.<br /><br />

        <div id="visualization" class="vis-week1"></div>

        <div id="BingMapIndividual" style="position:relative;width:100%;height:500px;"></div>

      </div>
    </div>

    <script>
    var items = new vis.DataSet([
      <?php
      $i=1;
      $sql = "select * from leave_requests where hostel_no=" . $_SESSION['hostel'];// . " and status='Approval Pending'";
      $request = mysqli_query($conn, $sql);
      while($row = mysqli_fetch_array($request)){
        $dDate = date_parse($row['departure']);
        $dMonth = intval($dDate['month'])-1 ;
        $dDate = "'" . $dDate['year'] . "', '" . $dMonth . "', '" . $dDate['day'] . "', '" . $dDate['hour'] . "', '" . $dDate['minute'] . "', '" . $dDate['second'] . "'";

        $aDate = date_parse($row['arrival']);
        $aMonth = intval($aDate['month'])-1 ;
        $aDate = "'" . $aDate['year'] . "', '" . $aMonth . "', '" . $aDate['day'] . "', '" . $aDate['hour'] . "', '" . $aDate['minute'] . "', '" . $aDate['second'] . "'";

        //Date('2018', '10', '13', '23', '25', '0')
        //Date('2011', '04' - 1, '11', '11', '51', '00')

        //{id: 40, content: "Harshal Gajjar", start: Tue Nov 13 2018 23:25:00 GMT+0530 (IST), end: Thu Nov 15 2018 07:30:00 GMT+0530 (IST), group: 6}
        //{id: 2, group: 1, start: Sun Oct 14 2018 02:54:37 GMT+0530 (IST), end: Sun Oct 14 2018 06:54:37 GMT+0530 (IST), type: "background", …}

        $entry = "{id: " . $row['id'] . ", content: '" . $row['name'] . " <sup><a href=\'mailto:" . $row['roll_no'] . "@iitdh.ac.in?subject=[Court]%20Regarding%20your%20Leave%20Request\'>" . $row['roll_no'] . "</a></sup>" . "', start: new Date(" . $dDate . "),end: new Date(" . $aDate . "), group: " . $row['room_no'] . ", destination: '" . $row["destination"] . "', roll_no:'" . $row["roll_no"] . "', name: '" . $row["name"] . "' , style: '";
          if($row['status']=="Approved") $entry = $entry . "background-color: rgba(100,200,100,0.6); border: rgb(0,255,0);";
          else if($row['status']=="Declined") $entry = $entry . "background-color: rgba(200,100,100,0.5); border: rgb(255,0,0);";
          else $entry = $entry . "background-color: rgba(0,0,0,0.2); border: #000;";
          $entry = $entry . "', editable: {updateTime: false, remove: true}}";

        echo $entry;

        if($i!=mysqli_num_rows($request)){ echo ","; }
        $i++;
      }
      ?>
    ]);



    // var items_bak = new vis.DataSet([
    //   <?php
    //   $i=1;
    //   $sql = "select * from leave_requests where hostel_no=" . $_SESSION['hostel'] . " and status='Approval Pending'";
    //   $request = mysqli_query($conn, $sql);
    //   while($row = mysqli_fetch_array($request)){
    //     $dDate = date_parse($row['departure']);
    //     $dMonth = intval($dDate['month'])-1 ;
    //     $dDate = "'" . $dDate['year'] . "', '" . $dMonth . "', '" . $dDate['day'] . "', '" . $dDate['hour'] . "', '" . $dDate['minute'] . "', '" . $dDate['second'] . "'";
    //
    //     $aDate = date_parse($row['arrival']);
    //     $aMonth = intval($aDate['month'])-1 ;
    //     $aDate = "'" . $aDate['year'] . "', '" . $aMonth . "', '" . $aDate['day'] . "', '" . $aDate['hour'] . "', '" . $aDate['minute'] . "', '" . $aDate['second'] . "'";
    //
    //     //Date('2018', '10', '13', '23', '25', '0')
    //     //Date('2011', '04' - 1, '11', '11', '51', '00')
    //
    //     //{id: 40, content: "Harshal Gajjar", start: Tue Nov 13 2018 23:25:00 GMT+0530 (IST), end: Thu Nov 15 2018 07:30:00 GMT+0530 (IST), group: 6}
    //     //{id: 2, group: 1, start: Sun Oct 14 2018 02:54:37 GMT+0530 (IST), end: Sun Oct 14 2018 06:54:37 GMT+0530 (IST), type: "background", …}
    //
    //     echo "{id: " . $row['id'] . ", content: '" . $row['name'] . "', start: new Date(" . $dDate . "),end: new Date(" . $aDate . "), group: " . $row['room_no'] . ", style: 'background-color: rgba(0,0,0,0.2); border: #000;', editable: {updateTime: false, remove: true}}";
    //     if($i!=mysqli_num_rows($request)){ echo ","; }
    //     $i++;
    //   }
    //   ?>
    // ]);

    // console.log(items._data["40"].style="background-color:red;");

    var groups = new vis.DataSet([
      <?php
      $i=1;
      $sql = "SELECT distinct room_no FROM `leave_requests` where hostel_no=" . $_SESSION['hostel'];// . " and status='Approval Pending'";
      $request=mysqli_query($conn, $sql);
      while($row = mysqli_fetch_array($request)){
        echo "{id: " . $row['room_no'] . ", content: 'Room " . $row['room_no'] . "'}";
        if($i!=mysqli_num_rows($request)){ echo ","; }
        $i++;
      }
      ?>
    ]);

    var container = document.getElementById('visualization');
    var d = new Date();
    d.setDate(d.getDate() - 2);

    var options = {
      start: d,
      editable: false,
      onRemove: removing,
      margin: {
        item: 10
      },
      zoomMin: 1000 * 60 * 60 * 24,
      zoomMax: 1000 * 60 * 60 * 24 * 31 * 6
      // onRemove: function (item, callback) {
      //   if(confirm("Confirm Delete?"))
      //   {
      //     if (ok) {
      //       callback(item); // confirm deletion
      //     }
      //     else {
      //       callback(null); // cancel deletion
      //     }
      //   });
      // }
    };

    var timeline = new vis.Timeline(container, items, groups, options);

    // console.log(items._data["40"].style="background-color: red;");
    // timeline.setItems(items);

    function removing(item, callback){
      console.log(item);

      if(!confirm("Do you want to decline "+item.name+"'s leave request?")){
        return;
      }

      // // callback(item);
      //

      // items._data[item.id].style="background-color:red;";

      // items._data["40"].style="background-color:red;"
      // item.style="background-color:red;";

      var parameters={
        action: "decline",
        id: item.id
      }
      var xhr = new XMLHttpRequest();
      xhr.open("POST", './actions/edit_lr.php', true);
      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

      xhr.onreadystatechange = function() { //Call a function when the state changes.
        if(this.readyState == XMLHttpRequest.DONE && this.status == 200) {
          console.log(xhr.responseText);
          if(xhr.responseText=="success"){
            console.log(items._data[item.id].style="background-color: rgba(200,100,100,0.5); border: rgb(255,0,0);");
            timeline.setItems(items);
            console.log("decline success");
          }else{
            window.alert("Decline failed");
            console.log(xhr.responseText);
          }
        }
      }

      xhr.send(encodeURI(jQuery.param(parameters)));

    }

    timeline.on('click',function(properties){
      if(!properties.item) return;
      console.log(properties.item+" clicked once");

      for (var i = map2.entities.getLength() - 1; i >= 0; i--) {
        var pushpin = map2.entities.get(i);
        if (pushpin instanceof Microsoft.Maps.Pushpin) {
          map2.entities.removeAt(i);
        }
      }

      console.log(items._data);

      var coordinatesInfo = items._data[properties.item].destination.replace("%2C",",").split(",");
      var location = new Microsoft.Maps.Location(coordinatesInfo[0], coordinatesInfo[1]);
      currentPushpin = new Microsoft.Maps.Pushpin(location,{
        color: 'rgb(255,0,0)'
      });

      map2.entities.push(currentPushpin);

      for (var item in items._data) {
          var coordinatesInfo = items._data[item].destination.replace("%2C",",").split(",");
          var location = new Microsoft.Maps.Location(coordinatesInfo[0], coordinatesInfo[1]);
          newPushpin = new Microsoft.Maps.Pushpin(location,{
            color: 'rgba(100,100,100)'
          });
          map2.entities.push(newPushpin);
      }

    });

    timeline.on('doubleClick', function (properties) {
      if(!properties.item) return;
      console.log('selected items: ' + properties.item);

      var parameters={
        action: "approve",
        id: properties.item
      }
      var xhr = new XMLHttpRequest();
      xhr.open("POST", './actions/edit_lr.php', true);
      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

      xhr.onreadystatechange = function() { //Call a function when the state changes.
        if(this.readyState == XMLHttpRequest.DONE && this.status == 200) {
          console.log(xhr.responseText);
          if(xhr.responseText=="success"){
            console.log(items._data[properties.item].style="background-color: rgba(100,200,100,0.6); border: rgb(0,255,0);");
            timeline.setItems(items);
            console.log("approve success");
          }else{
            window.alert("Approval failed");
            console.log(xhr.responseText);
          }
        }
      }

      xhr.send(encodeURI(jQuery.param(parameters)));

    });

    timeline.on('contextmenu', function (properties) {
      if(!properties.item) return;
      console.log('selected items: ' + properties.item);

      var parameters={
        action: "reset",
        id: properties.item
      }
      var xhr = new XMLHttpRequest();
      xhr.open("POST", './actions/edit_lr.php', true);
      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

      xhr.onreadystatechange = function() { //Call a function when the state changes.
        if(this.readyState == XMLHttpRequest.DONE && this.status == 200) {
          console.log(xhr.responseText);
          if(xhr.responseText=="success"){
            console.log(items._data[properties.item].style="background-color: rgba(0,0,0,0.2); border: rgb(0,0,0);");
            timeline.setItems(items);
            console.log("reset success");
          }else{
            window.alert("Reset failed");
            console.log(xhr.responseText);
          }
        }
      }

      xhr.send(encodeURI(jQuery.param(parameters)));
    });

    </script>

    <?php
    }
    ?>


    <script>

    var submitted=false;

    function isNumber(num){
      return !isNaN(parseFloat(num)) && isFinite(num);
    }

    function lr_submit(){
      var sname = document.forms["leave_request"]["name"].value;
      var roll_no = document.forms["leave_request"]["roll_no"].value;
      var pContact = document.forms["leave_request"]["pContact"].value;
      var dContact = document.forms["leave_request"]["dContact"].value;
      var dTime = document.forms["leave_request"]["dTime"].value;
      var aTime = document.forms["leave_request"]["aTime"].value;
      var destination = document.forms["leave_request"]["destination"].value;
      var cause = document.forms["leave_request"]["cause"].value.replace(/\n/g, "<br />");
      var hostel_no = document.forms["leave_request"]["hostel_no"].value;
      var floor_no = document.forms["leave_request"]["floor_no"].value;
      var room_no = document.forms["leave_request"]["room_no"].value;

      // window.alert(cause);

      var date = new Date();

      if(sname.trim()=="" || roll_no.trim()=="" || pContact.trim()=="" || dContact.trim()=="" || dTime.trim()=="" || aTime.trim()=="" || destination.trim()=="" || cause.trim()=="" || hostel_no.trim()=="" || floor_no.trim()=="" || room_no.trim()==""){
        window.alert("Insufficient information provided");
        return false;
      }

      if(!isNumber(roll_no) || !isNumber(pContact) || !isNumber(dContact) || !isNumber(hostel_no) || !isNumber(floor_no)){
        window.alert("Invalid Entries");
        return false;
      }

      if(((Math.floor(parseInt(roll_no)/10000000) > (date.getYear()+1900)%100) || (parseInt(roll_no)<160000000)) ){
        window.alert("Invalid Roll Number");
        return false;
      }

      if((Math.floor(parseInt(pContact)/1000000000) == 0)){
        window.alert("Invalid Personal Contact Number");
        return false;
      }

      if((Math.floor(parseInt(dContact)/1000000000) == 0)){
        window.alert("Invalid Destination Contact Number");
        return false;
      }

      if((Date.parse(aTime)-Date.parse(dTime))<21600000){
        window.alert("A minimum of 6 hours is required to be spent outside the campus");
        return false;
      }

      if((parseInt(hostel_no)<0 || parseInt(hostel_no)>15)){
        window.alert("Invalid Hostel Number");
        return false;
      }

      if((parseInt(floor_no)<0 || parseInt(floor_no)>3)){
        window.alert("Invalid Floor Number");
        return false;
      }

      var parameters = {
        action: "add",
        name: sname,
        roll_no: roll_no,
        pContact: pContact,
        dContact: dContact,
        dTime: dTime,
        aTime: aTime,
        destination: destination,
        cause: cause,
        hostel_no: hostel_no,
        floor_no: floor_no,
        room_no: room_no
      };
      //
      // //window.alert(encodeURI(jQuery.param(parameters)));

      if (!confirm("Confirm Submit?")) {
          return false;
      }

      var xhr = new XMLHttpRequest();
      xhr.open("POST", './actions/edit_lr.php', true);
      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

      xhr.onreadystatechange = function() { //Call a function when the state changes.
        if(this.readyState == XMLHttpRequest.DONE && this.status == 200) {
          console.log(xhr.responseText);
          if(xhr.responseText=="success"){

            document.forms["leave_request"]["name"].disabled=true;
            document.forms["leave_request"]["name"].disabled=true;
            document.forms["leave_request"]["roll_no"].disabled=true;
            document.forms["leave_request"]["pContact"].disabled=true;
            document.forms["leave_request"]["dContact"].disabled=true;
            document.forms["leave_request"]["dTime"].disabled=true;
            document.forms["leave_request"]["aTime"].disabled=true;
            document.forms["leave_request"]["destination"].disabled=true;
            document.forms["leave_request"]["cause"].disabled=true;
            document.forms["leave_request"]["hostel_no"].disabled=true;
            document.forms["leave_request"]["floor_no"].disabled=true;
            document.forms["leave_request"]["room_no"].disabled=true;

            submitted=true;

            document.getElementById('lr_submit_button').style.backgroundColor='#5FBF5F';
            document.getElementById('lr_submit_button').style.color='#fff';
            document.getElementById('lr_submit_button').value='✔';
            document.getElementById('lr_submit_button').disabled='true';
            console.log("success");
          }else{
            console.log(xhr.responseText);
          }
        }
      }

      xhr.send(encodeURI(jQuery.param(parameters)));

      return false;
    }
    </script>
    <script type="text/javascript">
    $('.form_datetime').datetimepicker({
      //language:  'fr',
      startDate: new Date(),
      weekStart: 1,
      todayBtn:  1,
      autoclose: 1,
      todayHighlight: 1,
      startView: 2,
      forceParse: 0,
      showMeridian: 1
    });
    $('.form_date').datetimepicker({
      //language:  'fr',
      weekStart: 1,
      todayBtn:  1,
      autoclose: 1,
      todayHighlight: 1,
      startView: 2,
      minView: 2,
      forceParse: 0
    });
    $('.form_time').datetimepicker({
      //language:  'fr',
      weekStart: 1,
      todayBtn:  1,
      autoclose: 1,
      todayHighlight: 1,
      startView: 1,
      minView: 0,
      maxView: 1,
      forceParse: 0
    });
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
