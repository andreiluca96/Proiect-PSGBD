<?php
include 'DBConnect.php';

function select_current_flights() {
	$connection = connectToMyOracleDB();

	$query = 'SELECT * FROM flights where is_current_flight(id)=1';
	$statement = oci_parse($connection, $query);
	if (!oci_execute($statement)) {
		echo '<h3> Eroare! </h3>';
		return;
	}

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
	while ($row = @oci_fetch_array($statement)) {
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