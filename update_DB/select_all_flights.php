<?php
include '../DBConnect.php';
function select_all_flights() {
	$connection = connectToMyOracleDB();
	if (isset($_GET['experienced-crew'])) {
		$query = 'SELECT * FROM flights where experienced_crew(id) = 1';
	} else {
		$query = 'SELECT * FROM flights';	
	}

	$statement = oci_parse($connection, $query);
	ob_start();
	try{
		oci_execute($statement);
	} catch (Exception $e) {
		echo 'Sorry an error occured';
	}
	ob_end_flush();

	echo '<div class="container">';
	echo '<table class="table">';
	echo '<thead>';
	echo '<tr>';
	echo '<th> Flight_ID </th>';
	echo '<th> Airplane_ID </th>';
	echo '<th> Airport_departure_ID </th>';
	echo '<th> Airport_arrival_ID </th>';
	echo '<th> Departure_date </th>';
	echo '<th> Arrival_date </th>';
	echo '</tr>';
	echo '</thead>';
	echo '<tbody>';
	while ($row = oci_fetch_array($statement)) {
		echo '<tr>';
		echo '<td>'; echo $row['ID']; echo '</td>';
		echo '<td>'; echo $row['AIRPLANEID']; echo '</td>';
		echo '<td>'; echo $row['AIRPORTDEPARTUREID']; echo '</td>';
		echo '<td>'; echo $row['AIRPORTARRIVALID']; echo '</td>';
		echo '<td>'; echo $row['DEPARTUREDATE']; echo '</td>';
		echo '<td>'; echo $row['ARRIVALDATE']; echo '</td>';
		echo '</tr>';
	}
	echo '</tbody>';
	echo '</table>';
	echo '</div>';
}
