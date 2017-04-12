<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>
      Global Flight Management System
    </title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="styles.css" rel="stylesheet">

  </head>
  <body>
   <nav class="navbar navbar-inverse">
        <div class="container-fluid">
          <div class="navbar-header">
            <a class="navbar-brand" href="index.php">
              <img src="https://img.clipartfest.com/d130a2ef13e2f9aeab0ebbeddb356ffc_airplane-clip-art-at-clker-com-vector-plane-clipart_600-483.png" height="30px" width="30px" alt="icon">
            </a>
            <h5>
              Global Flight Management System
            <h5>
          </div>
          <ul class="nav navbar-nav">
            <li class="active"><a href="index.php">Home</a></li>
            <li><a href="currentFlights.php">Current Flights</a></li>
            <li><a href="./update_DB/insert_into_flights.php">Update Flights</a></li>
            <li><a href="./show_airplanes/show_airplanes.php">See Airplanes</a></li>
          </ul>
        </div>
      </nav>

    <form class="departure-date-container">
      <label for="departure-date" class="white-label">
        Last departure date:
      </label>
      <input type="datetime-local" id="departure-date" name="endDate">

      <label class="white-label" for="departure-airport">
        Departure airport ID:
      </label>
      <input type="number" id="departure-ariport" name="departure-ariport" value="0" min="0" max="100000">

      <label class="white-label" for="arrival-airport">
        Arrival airport ID:
      </label>
      <input type="number" id="arrival-ariport" name="arrival-ariport" value="0" min="0" max="100000">

      <button type="submit" class="btn btn-primary">
        Submit
      </button>
    </form>
    <h3>
      Upcoming Flights:
    </h3>
    <?php
      include 'select_upcoming_flights.php';
      select_upcoming_flights();
    ?>
  </body>
</html>