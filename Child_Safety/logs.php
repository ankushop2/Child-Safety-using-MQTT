  <?php
  	session_start();
      $username = $_SESSION['loggedin'];
      $res = "";
  if($username){
    ini_set('display_errors', 1);
    $user = $_SESSION['loggedin'];
    $servername = "localhost";
    $username = 'root';
    $password = '';
    $db = 'studentdb';
    $conn = new mysqli($servername, $username, $password,$db);
   // echo $user;
    $query = "SELECT deviceser FROM devicedet WHERE loginID='$user';";
   // echo $query;
    $result = $conn->query($query);
    $rows = mysqli_num_rows($result);
     if ($rows == 1) { 
          $row = mysqli_fetch_array($result);
    } 
    $arg = $row[0];
       $query1 = "SELECT * FROM devicelog WHERE deviceser='$arg';";
     $res =  $conn->query($query1);
    }
    else{
      header("location:login.php");
    }
  
  ?>
  <!DOCTYPE html>
  <html lang="en">
  <head>
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
    		background: #808080;  /* fallback for old browsers */
        background: -webkit-linear-gradient(to right, #3fada8, #808080);  /* Chrome 10-25, Safari 5.1-6 */
        background: linear-gradient(to right, #3fada8, #808080); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

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
          <li><a href="#">Logs</a></li>
          <li><a href="#">Logout</a></li>
        </ul>
        <ul id="nav-mobile" class="sidenav">
          <li><a href="registerdevice.php">Register Device</a></li>
           <li><a href="#">Logs</a></li>
          <li><a href="#">Logout</a></li>
        </ul>
        <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
      </div>
    </nav>   
    <br><br>
    <div class="container">
      <table class="striped responsive-table centered">
        <thead class="highlight">
          <tr>
              <th>TimeStamp</th>
              <th>Body Temperature</th>
              <th>Pulse</th>
              <th>Ambient Temperature</th>
              <th>Humidity</th>
              <th>CO Concentration</th>
              <th>Smoke Concentration</th>
              <th>LPG Concentration</th>
              <th>Location - Lat</th>
              <th>Location - Lng</th>
          </tr>
        </thead>
        <tbody>
          <?php
            while($row = mysqli_fetch_array($res)) {
              echo "<tr>";
              echo "<td>".$row['timestamp']."</td>";
              echo "<td>".$row['bodytemp']."</td>";
              echo "<td>".$row['pulse']."</td>";
              echo "<td>".$row['ambienttemp']."</td>";
              echo "<td>".$row['ambienthumidity']."</td>";
              echo "<td>".$row['COconc']."</td>";
              echo "<td>".$row['Smokeconc']."</td>";
              echo "<td>".$row['LPGconc']."</td>";
              echo "<td>".$row['lat']."</td>";
              echo "<td>".$row['lng']."</td>";
              echo "</tr>";
            }
            ?>
          </tbody>
        </table>
    </div>
  </div>
    
    <!--  Scripts-->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="js/materialize.js"></script>
    <script src="js/init.js"></script>


    </body>
  </html>


