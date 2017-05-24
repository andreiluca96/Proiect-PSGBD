<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Global Flight Management System</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
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
            <li><a href="../show_airplanes/show_airplanes.php">See Airplanes</a></li>
            <li><a href="../update_view/show_view.php">Update View</a></li>
          </ul>
        </div>
    </nav>

  <ul class="nav nav-tabs nav-justified">
    <li><a class="crud-selection" href="insert_view.php">Insert</a></li>
    <li><a class="crud-selection" href="show_view.php">Show</a></li>
    <li class="active"><a class="crud-selection" href="update_view.php">Update</a></li>
    <li><a class="crud-selection" href="delete_from_view.php">Delete</a></li>
  </ul>

  <form class="table-insert-data" for="airplane-id">

    <label class="table-attribute-name">
      ID
    </label>
    <input type="number" name="id" id="id">

    <label class="table-attribute-name">
      Firstname
    </label>
    <input type="text" name="firstname" id="firstname">

    <label class="table-attribute-name" for="airport-departure-id">
      Lastname
    </label>
    <input type="text" name="lastname" id="lastname">

    <label class="table-attribute-name" for="airport-departure-id">
      Address
    </label>
    <input type="text" name="address" id="address">

    <label class="table-attribute-name" for="airport-arrival-time">
      Date of birth
    </label>
    <input type="date" name="date-of-birth" id="date-of-birth">

    <input class="btn btn-primary" type="submit" name="submit" value="Update">
  </form>
  <?php
    include '../DBConnect.php';

    function update_view() {
      $connection = connectToMyOracleDB();

      $query = 'UPDATE iasi_customers SET
      id=:id,
      firstname=:firstname,
      lastname=:lastname,
      adress=:address,
      dateofbirth=TO_DATE(:dateofbirth, \'YYYY-MM-DD\')
      WHERE ID=:id';
      
      $statement = oci_parse($connection, $query);
      oci_bind_by_name($statement, ':id', $_GET['id']);
      oci_bind_by_name($statement, ':firstname', $_GET['firstname']);
      oci_bind_by_name($statement, ':lastname', $_GET['lastname']);
      oci_bind_by_name($statement, ':address', $_GET['address']);
      oci_bind_by_name($statement, ':dateofbirth', $_GET['date-of-birth']);
      // var_dump($query);
      oci_execute($statement);
    }
    
    if (isset($_GET['submit'])) {
      if (isset($_GET['id']) && !empty($_GET['id']) && isset($_GET['firstname']) && !empty($_GET['firstname']) &&
        isset($_GET['lastname']) && !empty($_GET['lastname']) && isset($_GET['address']) && !empty($_GET['address']) && isset($_GET['date-of-birth']) && !empty($_GET['date-of-birth'])) {
        update_view();
      } else {
        echo '<h2> You have to complete all the fields! </h2>';
      }
    }
    
  ?>
  </body>
</html>