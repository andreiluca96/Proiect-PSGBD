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
            <li><a href="insert_into_flights.php">Update Flights</a></li>
            <li><a href="../show_airplanes/show_airplanes.php">See Airplanes</a></li>
            <li class="active"><a href="../update_view/show_view.php">Update View</a></li>
          </ul>
        </div>
    </nav>

  <ul class="nav nav-tabs nav-justified">
    <li><a class="crud-selection" href="insert_view.php">Insert</a></li>
    <li><a class="crud-selection" href="show_view.php">Show</a></li>
    <li><a class="crud-selection" href="update_view.php">Update</a></li>
    <li class="active"><a class="crud-selection" href="delete_from_flights.php">Delete</a></li>
  </ul>

    <form class="table-show-data" for="airplane-id">
    <label class="table-attribute-name">
      By field
    </label>
    <select name="field">
      <option>
        ID
      </option>
    <label>
      Value
    </label>
    <input type="text" name="Value">

    <input class="btn btn-primary" type="submit" name="submit" value="Delete">
  </form>

  <?php
    include '../DBConnect.php';

    function delete_flight() {
    $connection = connectToMyOracleDB();
    if ($_GET['field'] === 'ID') {
        $query = 'DELETE FROM iasi_customers WHERE id = :r';
        $statement = oci_parse($connection, $query);
        oci_bind_by_name($statement, ':r', $_GET['Value']);
      }
      if (!@oci_execute($statement)) {
        echo "<h3> An error occured! Probably you gave the wrong type for the values. </h3>";
      }
    }

    if (isset($_GET['Value']) && !empty($_GET['Value'])) {
      delete_flight();
    }
  ?>

  </body>
</html>