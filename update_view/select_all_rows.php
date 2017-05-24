<?php
include '../DBConnect.php';
function select_all_rows() {
	$connection = connectToMyOracleDB();
	$query = 'SELECT * FROM iasi_customers';


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
	echo '<th> ID </th>';
	echo '<th> Firstname </th>';
	echo '<th> Lastname </th>';
	echo '<th> Address </th>';
	echo '<th> Date of birth </th>';
	echo '</tr>';
	echo '</thead>';
	echo '<tbody>';
	while ($row = oci_fetch_array($statement)) {
		echo '<tr>';
		echo '<td>'; echo $row['ID']; echo '</td>';
		echo '<td>'; echo $row['FIRSTNAME']; echo '</td>';
		echo '<td>'; echo $row['LASTNAME']; echo '</td>';
		echo '<td>'; echo $row['ADRESS']; echo '</td>';
		echo '<td>'; echo $row['DATEOFBIRTH']; echo '</td>';
		echo '</tr>';
	}
	echo '</tbody>';
	echo '</table>';
	echo '</div>';
}
