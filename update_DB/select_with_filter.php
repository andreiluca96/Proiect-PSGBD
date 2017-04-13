<?php

function select_with_filter() {
	$connection = connectToMyOracleDB();
	if ($_GET['field'] === 'Flight_ID') {
		$query = 'SELECT * FROM flights WHERE FLIGHTID = :r';
		if (isset($_GET['experienced-crew'])) {
			$query = $query . ' AND experienced_crew(FLIGHTID) = 1';
		}
		$statement = oci_parse($connection, $query);
		oci_bind_by_name($statement, ':r', $_GET['value']);
	}

	if ($_GET['field'] === 'Airplane_ID') {
		$query = 'SELECT * FROM flights WHERE AIRPLANEID = :r';
		if (isset($_GET['experienced-crew'])) {
			$query = $query . ' AND experienced_crew(FLIGHTID) = 1';
		}
		$statement = oci_parse($connection, $query);
		oci_bind_by_name($statement, ':r', $_GET['value']);
	}

	if ($_GET['field'] === 'Airplane_Departure_ID') {
		$query = 'SELECT * FROM flights WHERE AIRPORTDEPARTUREID = :r';
		if (isset($_GET['experienced-crew'])) {
			$query = $query . ' AND experienced_crew(FLIGHTID) = 1';
		}
		$statement = oci_parse($connection, $query);
		oci_bind_by_name($statement, ':r', $_GET['value']);
	}

	if ($_GET['field'] === 'Airplane_Arrival_ID') {
		$query = 'SELECT * FROM flights WHERE AIRPORTARRIVALID = :r';
		if (isset($_GET['experienced-crew'])) {
			$query = $query . ' AND experienced_crew(FLIGHTID) = 1';
		}
		$statement = oci_parse($connection, $query);
		oci_bind_by_name($statement, ':r', $_GET['value']);
	}

	if ($_GET['field'] === 'Departure_Date') {
		$query = 'SELECT * FROM flights WHERE DEPARTUREDATE = :r';
		if (isset($_GET['experienced-crew'])) {
			$query = $query . ' AND experienced_crew(FLIGHTID) = 1';
		}
		$statement = oci_parse($connection, $query);
		oci_bind_by_name($statement, ':r', $_GET['value']);
	}

	if ($_GET['field'] === 'Arrival_Date') {
		$query = 'SELECT * FROM flights WHERE ARRIVALDATE = :r';
		if (isset($_GET['experienced-crew'])) {
			$query = $query . ' AND experienced_crew(FLIGHTID) = 1';
		}
		$statement = oci_parse($connection, $query);
		oci_bind_by_name($statement, ':r', $_GET['value']);
	}

	oci_execute($statement);

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
		echo '<td>'; echo $row['FLIGHTID']; echo '</td>';
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