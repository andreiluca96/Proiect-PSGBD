<?php

function update_flight() {
	$connection = connectToMyOracleDB();

	$query = 'UPDATE FLIGHTS SET
	FLIGHTID=:fid,
	AIRPLANEID=:airplaneid,
	AIRPORTDEPARTUREID=:depid,
	AIRPORTARRIVALID=:arrivid,
	DEPARTUREDATE=TO_DATE(:depd, \'YYYY-MM-DD\'),
	ARRIVALDATE=TO_DATE(:arrivd, \'YYYY-MM-DD\')
	WHERE FLIGHTID=:fid';
	
	$statement = oci_parse($connection, $query);
	oci_bind_by_name($statement, ':fid', $_GET['flight-id']);
	oci_bind_by_name($statement, ':airplaneid', $_GET['airplane-id']);
	oci_bind_by_name($statement, ':depid', $_GET['airport-departure-id']);
	oci_bind_by_name($statement, ':arrivid', $_GET['airport-arrival-id']);
	oci_bind_by_name($statement, ':depd', $_GET['airport-departure-time']);
	oci_bind_by_name($statement, ':arrivd', $_GET['airport-arrival-time']);

	oci_execute($statement);
}