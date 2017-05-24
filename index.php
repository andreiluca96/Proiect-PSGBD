<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>
      Global Flight Management System
    </title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
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
            <li><a href="./update_DB/update_view.php">Update View</a></li>
          </ul>
        </div>
      </nav>

    <form class="departure-date-container">
      <label for="departure-date" class="white-label">
        Last departure date:
      </label>
      <input type="date" id="departure-date" name="endDate">

      <label class="white-label" for="departure-airport">
        Departure airport ID:
      </label>
      <input type="text" id="departure-ariport" name="departure-airport" value="0">

      <label class="white-label" for="arrival-airport">
        Arrival airport ID:
      </label>
      <input type="text" id="arrival-ariport" name="arrival-airport" value="0">

      <button type="submit" class="btn btn-primary">
        Submit
      </button>
    </form>
    <h3>
      Upcoming Flights:
    </h3>
    <?php
      include 'select_upcoming_flights.php';
      if (!empty($_GET['endDate']) && !empty($_GET['departure-airport']) && !empty($_GET['arrival-airport'])) {
        select_upcoming_flights_with_filter();
      } else {
        select_upcoming_flights();
      }
    ?>
  </body>
</html>