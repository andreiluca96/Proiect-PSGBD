<?php

function delete_flight() {
	$connection = connectToMyOracleDB();
	if ($_GET['field'] === 'Flight_ID') {
		$query = 'DELETE FROM flights WHERE FLIGHTID = :r';
		$statement = oci_parse($connection, $query);
		oci_bind_by_name($statement, ':r', $_GET['Value']);
	}

	if ($_GET['field'] === 'Airplane_ID') {
		$query = 'DELETE FROM flights WHERE AIRPLANEID = :r';
		$statement = oci_parse($connection, $query);
		oci_bind_by_name($statement, ':r', $_GET['Value']);
	}

	if ($_GET['field'] === 'Airplane_Departure_ID') {
		$query = 'DELETE FROM flights WHERE AIRPORTDEPARTUREID = :r';
		$statement = oci_parse($connection, $query);
		oci_bind_by_name($statement, ':r', $_GET['Value']);
	}

	if ($_GET['field'] === 'Airplane_Arrival_ID') {
		$query = 'DELETE FROM flights WHERE AIRPORTARRIVALID = :r';
		$statement = oci_parse($connection, $query);
		oci_bind_by_name($statement, ':r', $_GET['Value']);
	}

	if ($_GET['field'] === 'Departure_Date') {
		$query = 'DELETE FROM flights WHERE DEPARTUREDATE = :r';
		$statement = oci_parse($connection, $query);
		oci_bind_by_name($statement, ':r', $_GET['Value']);
	}

	if ($_GET['field'] === 'Arrival_Date') {
		$query = 'DELETE FROM flights WHERE ARRIVALDATE = :r';
		$statement = oci_parse($connection, $query);
		oci_bind_by_name($statement, ':r', $_GET['Value']);
	}

	oci_execute($statement);
}