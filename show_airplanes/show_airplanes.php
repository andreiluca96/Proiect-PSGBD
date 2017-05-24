<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Global Flight Management System</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="../styles.css" rel="stylesheet">
  </head>
  <body>
   <nav class="navbar navbar-inverse">
        <div class="container-fluid">
          <div class="navbar-header">
            <a class="navbar-brand" href="../index.php">
              <img src="https://img.clipartfest.com/d130a2ef13e2f9aeab0ebbeddb356ffc_airplane-clip-art-at-clker-com-vector-plane-clipart_600-483.png" height="30px" width="30px" alt="icon">
            </a>
            <h5>
              Global Flight Management System
            <h5>
          </div>
          <ul class="nav navbar-nav">
            <li><a href="../index.php">Home</a></li>
            <li><a href="../currentFlights.php">Current Flights</a></li>
            <li><a href="../update_DB/insert_into_flights.php">Update Flights</a></li>
            <li class="active"><a href="./show_airplanes.php">See Airplanes</a></li>
            <li><a href="../update_view/show_view.php">Update View</a></li>
          </ul>
        </div>
    </nav>

  <form align="center" class="table-show-data" for="airplane-id" action="show_airplanes.php" method="get">
    <label class="table-attribute-name">
      Field
    </label>
    <select name="field">
      <option>
        Airplane_ID
      </option>
      <option>
        Company_ID
      </option>
      <option>
        Name
      </option>
      <option>
        Model
      </option>
      <option>
        Capacity
      </option>

      <option>
        Manufacture Date
      </option>

      <option>
        Last check date
      </option>
    </select>
    <label>
      Value
    </label>
    <input type="text" name="value">
    
    <input class="btn btn-primary" type="submit" name="submit" value="Show">
  </form>

  <?php
    include 'show_all_airplanes.php';

    if (isset($_GET['submit'])) {
      if (empty($_GET['value'])) {
        select_all_airplanes();
      } else {
        select_with_filter_airplanes();
      }
    }
  ?>

  </body>
</html>