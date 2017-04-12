<?php

function connectToMyOracleDB() {
	$username = 'PROIECT_PSGBD';
	$password = 'PROIECT_PSGBD';
	$connection_string = 'localhost/XE';

	$connection = oci_connect($username, $password, $connection_string);

	return $connection;
}