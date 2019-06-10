  <?php
  	session_start();
      $username = $_SESSION['loggedin'];
      $high = "HIGH";
      $low = "LOW";
      $normal = "NORMAL";
  if($username){
    ini_set('display_errors', 1);
    date_default_timezone_set('Asia/Kolkata');
    $date =  date('d-m-Y H:i');
    $user = $_SESSION['loggedin'];
    $servername = "localhost";
    $username = 'root';
    $password = '';
    $db = 'studentdb';
    $conn = new mysqli($servername, $username, $password,$db);
    $query = "SELECT deviceser FROM devicedet WHERE loginID='$user';";
    $result = $conn->query($query);
    $rows = mysqli_num_rows($result);
     if ($rows == 1) { 
          $row = mysqli_fetch_array($result);
    } 
    $arg = $row;
    /*secho $arg[0];
    echo $user;
  	  $pyscript = 'E:\\Ongoing\\___FINALYEARPROJECT\\CODE\\TEST\\clientchat.py';
     $python = 'C:\\Users\\ankus\\AppData\\Local\\Programs\\Python\\Python37-32\\python.exe';

     $cmd = "$python $pyscript $arg[0]";//Execution of Python Script

      exec("$cmd",$output);
      print_r($output);
      $parameters = json_decode($output[0],true);
       $query1 = "INSERT INTO `devicelog` (`deviceser`, `timestamp`, `bodytemp`, `pulse`, `ambienttemp`, `ambienthumidity`, `COconc`, `Smokeconc`, `LPGconc`, `lat`, `lng`) VALUES ('".$arg[0]. "', '".$date."', '".$parameters["body_temp"]."', '".$parameters["Pulse"]."', '".$parameters["ambient_temp"]."','".$parameters["humidity"]."', '".$parameters["CO"]."','".$parameters["Smoke"]."', '".$parameters["LPG"]."', '".$parameters["loc_lat"]."', '".$parameters["loc_lng"]."');";

      $conn->query($query1);*/
    $sql1 = "SELECT * FROM devicelog WHERE deviceser ='$arg[0]' ORDER BY `timestamp` DESC LIMIT 1;";
    $result1 = $conn->query($sql1);
    $rows1 = mysqli_num_rows($result1);
     if ($rows1 == 1) { 
          $parameters = mysqli_fetch_array($result1);
    }
    $sql2 = "SELECT schoolLat,schoolLng FROM devicedet WHERE deviceser = '$arg[0]';";
    $result2 = $conn->query($sql2);
    $rows2 = mysqli_num_rows($result2);
    if ($rows2 == 1) { 
          $schoolLoc = mysqli_fetch_array($result2);
    }
    $smsmessage = "";
    if($parameters[2]<35.5){$bodytempstatus = $low;$smsmessage = "BODYTEMP = LOW"; }
    else if($parameters[2]>38.3){ $bodytempstatus = $high;$smsmessage = "BODYTEMP = HIGH";}
    else {$bodytempstatus = $normal; }
    if($parameters[3]<60){$pulsestatus = $low; $smsmessage = $smsmessage." PULSE = LOW";}
    else if($parameters[3]>100){ $pulsestatus = $high;$smsmessage = $smsmessage." PULSE = HIGH";}
    else {$pulsestatus = $normal; }  
    if((float)$parameters[6]>10.0){$costatus = $high;$smsmessage = $smsmessage." CO_LEVEL HIGH"; }
    else { $costatus = $normal;}
    if($parameters[7]>50.0){$smokestatus = $high;$smsmessage = $smsmessage." SMOKE_LEVEL HIGH"; }
    else { $smokestatus = $normal;}
    if($parameters[8]>3100){$lpgstatus = $high;$smsmessage = $smsmessage." LPG_LEVEL HIGH"; }
    else { $lpgstatus = $normal;}
    if($parameters[9]>($schoolLoc[0]-0.000250)&&$parameters[9]<($schoolLoc[0]+0.000250)&&$parameters[10]>($schoolLoc[1]-0.000250)&&$parameters[10]<($schoolLoc[1]+0.000250)){ $locationstatus = "INSIDE";}
    else {$locationstatus = "OUTSIDE"; $smsmessage = $smsmessage." LOCATION = OUTSIDE";}

    if($smsmessage!=""){
      $query3 = "SELECT phonenumber,alternatenumber FROM userdet WHERE loginID=='$username';";
    $result3 = $conn->query($query3);
    $rows3 = mysqli_num_rows($result3);
     if ($rows3 == 1) { 
          $rows3 = mysqli_fetch_array($result3);
    } 
    $arg3 = $row3;
      $fields = array(
    "sender_id" => "FSTSMS",
    "message" => $smsmessage,
    "language" => "english",
    "route" => "p",
    "numbers" => "9731600052",
    );

      $curl = curl_init();

      curl_setopt_array($curl, array(
        CURLOPT_URL => "https://www.fast2sms.com/dev/bulk",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 30,
        CURLOPT_SSL_VERIFYHOST => 0,
        CURLOPT_SSL_VERIFYPEER => 0,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "POST",
        CURLOPT_POSTFIELDS => json_encode($fields),
        CURLOPT_HTTPHEADER => array(
          "authorization: BFiN3ZYVf7LOyzhcl1evXWAMwrmox8sRjba0HkS2JPGp96uECdz0fawTLA7soB4FGRlSg8r9EveIOJ3c",
          "accept: */*",
          "cache-control: no-cache",
          "content-type: application/json"
        ),
      ));

      $response = curl_exec($curl);
      $err = curl_error($curl);

      curl_close($curl);

     /* if ($err) {
        echo "cURL Error #:" . $err;
      } else {
        echo $response;
      }*/
   }

    }
    
    else{
      header("location:login.php");
    }
  ?>
  <!DOCTYPE html>
  <html lang="en">
  <head>
  	<meta http-equiv="refresh" content="20" >
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
    <title>Child Safety</title>

    <!-- CSS  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.4.0/dist/leaflet.css" integrity="sha512-puBpdR0798OZvTTbP4A8Ix/l+A4dHDD0DGqYW6RQ+9jxkRFclaxxQb/SJAWZfWAkuyeQUytO7+7N4QKrDh+drA==" crossorigin=""/>
      <script src="https://unpkg.com/leaflet@1.4.0/dist/leaflet.js" integrity="sha512-QVftwZFqvtRNi0ZyCtsznlKSWOStnDORoefr1enyq5mVL4tmKB3S/EnC3rRJcxCPavG10IcrVGSmPh6Qw5lwrg==" crossorigin=""></script>
    
    <style>
    	nav{
    		background: #ee0979;  /* fallback for old browsers */
  		  background: -webkit-linear-gradient(to right, #ff6a00, #ee0979);  /* Chrome 10-25, Safari 5.1-6 */
  		  background: linear-gradient(to right, #ff6a00, #ee0979); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
    	}
    	.card-panel{
    		background: #74ebd5;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #ACB6E5, #74ebd5);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #ACB6E5, #74ebd5); 

    	}
      .container{
        width: 80%;
      }
    </style>     
  </head>
  <body>
    <nav class="light-blue lighten-1" role="navigation">
      <div class="nav-wrapper container"><a id="logo-container" href="#" class="brand-logo">Child Safety</a>
        <ul class="right hide-on-med-and-down">
          <li><a href="registerdevice.php">Register Device</a></li>
          <li><a href="logs.php">Logs</a></li>
          <li><a href="#">Logout</a></li>
        </ul>
        <ul id="nav-mobile" class="sidenav">
          <li><a href="registerdevice.php">Register Device</a></li>
           <li><a href="logs.php">Logs</a></li>
          <li><a href="#">Logout</a></li>
        </ul>
        <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
      </div>
    </nav>   
   <div class="container">
    <div class="section">
      <div class="row">
        <div class="col s12 m4 right">
        <div class="card-panel">
              <h5 class="black-text">Notifications</h5>
              <h5>Body Temp. = <?= $bodytempstatus ?></h5>
              <h5>Pulse = <?= $pulsestatus ?></h5>
              <h5>CO = <?= $costatus ?></h5>
              <h5>Smoke = <?= $smokestatus ?></h5>
              <h5>LPG = <?= $lpgstatus ?></h5>
              <h5>Location = <?= $locationstatus ?></h5>  
            </div>
          </div>
          </div>
        </div>
      </div>
    <div class="container">
      <div class="section">
      <h4>Body Parameters</h4>
        <!--   Icon Section   -->
        <div class="row">
          <div class="col s12 m4">
            <div class="card-panel ">
              <h5 class="black-text">Body Temperature:</h5>
              <h5><?= $parameters[2] ?>°C</h5>  
            </div>
          </div>
          <div class="col s12 m4">
            <div class="card-panel ">
          <h5 class="black-text">Pulse:</h5>
              <h5><?= $parameters[3] ?>bpm</h5>  
        </div>
          </div>
      </div>
      <h4>Ambient Parameters:</h4>
        <div class="row">
          <div class="col s12 m4">
            <div class="card-panel ">
              <h5 class="black-text">Ambient Temperature:</h5>
              <h5><?= $parameters[4] ?>°C</h5>  
            </div>
          </div>
          <div class="col s12 m4">
            <div class="card-panel ">
              <h5 class="black-text">Ambient Humidity:</h5>
              <h5><?= $parameters[5] ?>%</h5>  
            </div>
          </div>
          <div class="col s12 m4">
           <div class="card-panel ">
              <h5 class="black-text">CO Concentration:</h5>
              <h5><?= number_format((float)$parameters[6], 4, '.', '');  ?>ppm</h5>  
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col s12 m4">
            <div class="card-panel ">
          <h5 class="black-text">LPG Concentration:</h5>
              <h5><?= number_format((float)$parameters[8], 4, '.', ''); ?>ppm</h5>  
        </div>
          </div>

          <div class="col s12 m4">
            <div class="card-panel ">
         <h5 class="black-text">Smoke Concentration:</h5>
              <h5><?= number_format((float)$parameters[7], 4, '.', ''); ?>ppm</h5>  
        </div>
          </div>

          <div class="col s12 m4">
             <div class="card-panel ">
              <h5 class="black-text">Location:</h5>
              <h5><?= $parameters[9] ?>,<?= $parameters[10] ?></h5>             
            </div>
          </div>
        </div>
        <h4>Location</h4>
        <div class="row">
          <div id="mapid" style="width: 100%; height: 400px;"></div>
          
        </div>

      </div>
      <br><br>
    </div>
  </div>
    
    <!--  Scripts-->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="js/materialize.js"></script>
    <script src="js/init.js"></script>
  <script>

    var mymap = L.map('mapid').setView( [<?= $parameters[9] ?> , <?= $parameters[10] ?>], 14);
    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
      maxZoom: 18,
      attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
        '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
        'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
      id: 'mapbox.streets'
    }).addTo(mymap);
    
    L.marker([<?= $parameters[9] ?> , <?= $parameters[10] ?>]).addTo(mymap)
      .bindPopup("Position of child").openPopup();

    function onMapClick(e) {
      popup
        .setLatLng(e.latlng)
        .setContent("You clicked the map at " + e.latlng.toString())
        .openOn(mymap);
    }
      mymap.on('popupopen', function(e) {
      var px = map.project(e.popup._latlng); // find the pixel location on the map where the popup anchor is
      px.y -= e.popup._container.clientHeight/2 // find the height of the popup container, divide by 2, subtract from the Y axis of marker location
      map.panTo(map.unproject(px),{animate: true}); // pan to new center
  });

    mymap.on('click', onMapClick);


  </script>

    </body>
  </html>


