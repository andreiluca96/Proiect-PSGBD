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
    <li class="active"><a class="crud-selection" href="insert_into_flights.php">Insert</a></li>
    <li><a class="crud-selection" href="show_flights.php">Show</a></li>
    <li><a class="crud-selection" href="update_flights.php">Update</a></li>
    <li><a class="crud-selection" href="delete_from_flights.php">Delete</a></li>
  </ul>

  <form class="table-insert-data" for="airplane-id" action="insert_into_flights.php" method="get">
    <label class="table-attribute-name">
      Airplane ID
    </label>
    <input type="number" name="airplane-id" id="airplane-id">

    <label class="table-attribute-name" for="airport-departure-id">
      Airport departure ID:
    </label>
    <input type="number" name="airport-departure-id" id="airport-departure-id">

    <label class="table-attribute-name" for="airport-departure-id">
      Airplane arrival ID:
    </label>
    <input type="number" name="airport-arrival-id" id="airport-arrival-id">

    <label class="table-attribute-name" for="airport-arrival-time">
      Airplane arrival time:
    </label>
    <input type="date" name="airport-arrival-time" id="airport-arrival-time">

    <label class="table-attribute-name" for="airport-departure-time">
      Airplane departure time:
    </label>
    <input type="date" name="airport-departure-time" id="airport-departure-time">

    <input class="btn btn-primary" type="submit" name="submit" value="Insert">

  </form>

  <?php
    include '../DBConnect.php';
    include 'insert_flight.php';

    if (isset($_GET['airplane-id']) && !empty($_GET['airplane-id']) && isset($_GET['airport-departure-id']) && !empty($_GET['airport-departure-id']) &&
      isset($_GET['airport-arrival-id']) && !empty($_GET['airport-arrival-id']) && isset($_GET['airport-arrival-time']) && !empty($_GET['airport-arrival-time']) && isset($_GET['airport-departure-time']) && !empty($_GET['airport-departure-time'])
      ) {
      insert_flight();
    }
  ?>
  </body>
</html>