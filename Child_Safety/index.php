  <?php
  	
  	//$pyscript = "E:\\Ongoing\\__FINALYEARPROJECT\\CODE\\TEST\\clientchat.py";
  	  $pyscript = 'E:\\Ongoing\\___FINALYEARPROJECT\\CODE\\TEST\\clientchat.py';
      $python = 'C:\\Users\\ankus\\AppData\\Local\\Programs\\Python\\Python37-32\\python.exe';

      $cmd = "$python $pyscript";
     // echo $cmd;

      exec("$cmd",$output);
      //print_r($output);
      $parameters = json_decode($output[0],true);
      //print($json_check["loc_lat"]);
      //echo "HELLO";
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
          <li><a href="#">Logs</a></li>
          <li><a href="#">Logout</a></li>
        </ul>
        <ul id="nav-mobile" class="sidenav">
           <li><a href="#">Logs</a></li>
          <li><a href="#">Logout</a></li>
        </ul>
        <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
      </div>
    </nav>   
    
    <div class="container">
      <div class="section">
      <h4>Body Parameters</h4>
        <!--   Icon Section   -->
        <div class="row">
          <div class="col s12 m4">
            <div class="card-panel ">
              <h5 class="white-text">Body Temperature</h5>
              <h5><?= $parameters["body_temp"] ?>°C</h5>  
            </div>
          </div>
          <div class="col s12 m4">
            <div class="card-panel ">
          <h5 class="white-text">Pulse</h5>
              <h5><?= $parameters["Pulse"] ?>bpm</h5>  
        </div>
          </div>
      </div>
      <h4>Ambient Parameters</h4>
        <div class="row">
          <div class="col s12 m4">
            <div class="card-panel ">
              <h5 class="white-text">Ambient Temperature</h5>
              <h5><?= $parameters["ambient_temp"] ?>°C</h5>  
            </div>
          </div>
          <div class="col s12 m4">
            <div class="card-panel ">
              <h5 class="white-text">Ambient Humidity</h5>
              <h5><?= $parameters["humidity"] ?>%</h5>  
            </div>
          </div>
          <div class="col s12 m4">
           <div class="card-panel ">
              <h5 class="white-text">CO Concentration</h5>
              <h5><?= number_format((float)$parameters["CO"], 4, '.', '');  ?>ppm</h5>  
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col s12 m4">
            <div class="card-panel ">
          <h5 class="white-text">LPG Concentration</h5>
              <h5><?= number_format((float)$parameters["LPG"], 4, '.', ''); ?>ppm</h5>  
        </div>
          </div>

          <div class="col s12 m4">
            <div class="card-panel ">
         <h5 class="white-text">Smoke Concentration</h5>
              <h5><?= number_format((float)$parameters["Smoke"], 4, '.', ''); ?>ppm</h5>  
        </div>
          </div>

          <div class="col s12 m4">
             <div class="card-panel ">
              <h5 class="white-text">Location</h5>
              <h5><?= $parameters["loc_lat"] ?>,<?= $parameters["loc_lng"] ?></h5>             
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

    var mymap = L.map('mapid').setView( [<?= $parameters["loc_lat"] ?> , <?= $parameters["loc_lng"] ?>], 14);
    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
      maxZoom: 18,
      attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
        '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
        'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
      id: 'mapbox.streets'
    }).addTo(mymap);
    
    L.marker([<?= $parameters["loc_lat"] ?> , <?= $parameters["loc_lng"] ?>]).addTo(mymap)
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


