<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Global Flight Management System</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="./table_style.css" rel="stylesheet">
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
            <li class="active"><a href="insert_into_flights.php">Update Flights</a></li>
          </ul>
        </div>
    </nav>

  <ul class="nav nav-tabs nav-justified">
    <li><a class="crud-selection" href="insert_into_flights.php">Insert</a></li>
    <li class="active"><a class="crud-selection" href="show_flights.php">Show</a></li>
    <li><a class="crud-selection" href="update_flights.php">Update</a></li>
    <li><a class="crud-selection" href="delete_from_flights.php">Delete</a></li>
  </ul>

  <form align="center" class="table-show-data" for="airplane-id" action="show_flights.php" method="get">
    <label class="table-attribute-name">
      Field
    </label>
    <select name="field">
      <option>
        Flight_ID
      </option>
      <option>
        Airplane_ID
      </option>
      <option>
        Airplane_Departure_ID
      </option>
      <option>
        Airplane_Arrival_ID
      </option>
      <option>
        Departure_Date
      </option>

      <option>
        Arrival_Date
      </option>
    </select>
    <label>
      Value
    </label>
    <input type="text" name="value">
    <label>
      Experienced crew
      <input type="checkbox" name="experienced-crew" value="Experienced crew">
    </label>
    
    <input class="btn btn-primary" type="submit" name="submit" value="Show">
  </form>
  <?php
    include 'select_all_flights.php';
    include 'select_with_filter.php';

    if (isset($_GET['value'])) {
      if (empty($_GET['value'])) {
        select_all_flights();
      } else {
        select_with_filter();
      }

    }
    
  ?>
  </body>
</html>