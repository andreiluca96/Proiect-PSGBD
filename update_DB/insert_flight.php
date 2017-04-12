<?php
	
function insert_flight() {
	$connection = connectToMyOracleDB();

	$query = 'INSERT INTO FLIGHTS VALUES (count_flights(), :airplaneid, :depid, :arrivid, TO_DATE(:arrivd, \'YYYY-MM-DD\'), TO_DATE(:depd, \'YYYY-MM-DD\'))';
	$statement = oci_parse($connection, $query);

	oci_bind_by_name($statement, ':airplaneid', $_GET['airplane-id']);
	oci_bind_by_name($statement, ':depid', $_GET['airport-departure-id']);
	oci_bind_by_name($statement, ':arrivid', $_GET['airport-arrival-id']);
	oci_bind_by_name($statement, ':depd', $_GET['airport-departure-time']);
	oci_bind_by_name($statement, ':arrivd', $_GET['airport-arrival-time']);

	oci_execute($statement);
}