  <?php
  session_start();
  $username = $_SESSION['loggedin'];
  if($username){
  $result="";
  ini_set('display_errors', 1);
  if($_SERVER["REQUEST_METHOD"] == "POST") {
    $servername = "localhost";
    $username = 'root';
    $password = '';
    $db = 'studentdb';
    $conn = new mysqli($servername, $username, $password,$db);
    //Create Local Variables

    $wardname = $_POST['wardname'];
    $deviceID = $_POST['deviceID'];
    $schoolauth = $_POST['schoolauth'];
    $schoolauthemail = $_POST['schoolauthemail'];
    $schoolauthno = $_POST['schoolauthno'];
    $schoolLat = $_POST['schoolLat'];
    $schoolLng = $_POST['schoolLng'];

    $query1 =  "INSERT INTO `devicedet` (`loginID`, `deviceser`, `wardName`, `schoolAuth`, `schoolAuthNumber`, `schoolAuthEmail`, `schoolLat`, `schoolLng`) VALUES ('$username', '$deviceID', '$wardname', '$schoolauth', '$schoolauthno', '$schoolauthemail', '$schoolLat','$schoolLng');";

    $res1 = $conn->query($query1);
     if ( $res1 ) { 
          header("location: index.php");
    } 
    else {
          $result='<div><strong>Device already registered!</strong></div>';
    }
    $conn->close();
  }
}
else{
  header("locarion:login.php");
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
    	body,nav{
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

    <h2 class="center">Register Here!</h2> 
    <div class="container"> 
      <br>
      <h6 class="center"><?php echo $result; ?></h6>
      <form id="registerform" method="POST">
        <div class="col s12 m8 offset-m2 l6 offset-l3 xl4 offset-xl4">
          <div class="row">
            <div class="input-field col s12 m8 offset-m2 l6 offset-l3 xl4 offset-xl4">
                <input placeholder="Ward Name" name="wardname" type="text" class="validate">
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12 m8 offset-m2 l6 offset-l3 xl4 offset-xl4">
                <input placeholder="Device ID" name="deviceID" type="text" class="validate">
            </div>    
          </div>
          <div class="row">
            <div class="input-field col s12 m8 offset-m2 l6 offset-l3 xl4 offset-xl4">
                <input placeholder="School Authority Name" name="schoolauth" type="text" class="validate">
            </div>    
          </div>
          <div class="row">
            <div class="input-field col s12 m8 offset-m2 l6 offset-l3 xl4 offset-xl4">
                <input placeholder="School Authority Number" name="schoolauthno" type="text" class="validate">
            </div>    
          </div>
          <div class="row">
            <div class="input-field col s12 m8 offset-m2 l6 offset-l3 xl4 offset-xl4">
                <input placeholder="School Authority Email" name="schoolauthemail" type="text" class="validate">
            </div>    
          </div>
          <div class="row">
            <div class="input-field col s12 m8 offset-m2 l6 offset-l3 xl4 offset-xl4">
                <input placeholder="School Latitude" name="schoolLat" type="text" class="validate">
            </div>    
          </div>
          <div class="row">
            <div class="input-field col s12 m8 offset-m2 l6 offset-l3 xl4 offset-xl4">
                <input placeholder="School Longitude" name="schoolLng" type="text" class="validate">
            </div>    
          </div>
          <div class="row hide-on-med-and-up">
            <div class="col s12 m8 offset-m2 l6 offset-l3 xl4 offset-xl4">
                <div class="row">
                    <a class="col s12 btn waves-effect waves-light  grey darken-1" style="padding: 0;" onclick="document.getElementById('registerform').submit();">Submit</a>
                </div> 
            </div>
          </div>
          <div class="row hide-on-small-only">
            <div class="col s12 m8 offset-m2 l6 offset-l3 xl4 offset-xl4">
                <a class="col s12 btn waves-effect waves-light  grey darken-1" style="padding: 0;" onclick="document.getElementById('registerform').submit();">Submit</a>
            </div>
          </div>
         </form>                       
    </div>   
    <!--  Scripts-->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="js/materialize.js"></script>
    <script src="js/init.js"></script>
  </body>
  </html>



