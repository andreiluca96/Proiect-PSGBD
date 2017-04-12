<?php
include '../DBConnect.php';

function select_all_airplanes() {
	$connection = connectToMyOracleDB();

	$query = 'SELECT count(*) as "COUNT" FROM airplanes';
	$statement = oci_parse($connection, $query);
	oci_execute($statement);
	$row = oci_fetch_array($statement);
	$count = $row['COUNT'];


	if (isset($_GET['page'])) {
		$query = 'SELECT * FROM (SELECT airplanes.*, rownum as "R" FROM AIRPLANES) WHERE R <= ' . $_GET['page'] * 5 . ' AND R >= '. ($_GET['page'] - 1) * 5;
	} else {
		$query = 'SELECT * FROM airplanes WHERE ROWNUM <= 5';
	}


	$statement = oci_parse($connection, $query);
	oci_execute($statement);
	echo '<div class="container">';
	echo '<table class=" table">';
	echo '<thead>';
	echo '<tr>';
	echo '<th> Airplane_ID </th>';
	echo '<th> Company_ID </th>';
	echo '<th> Name </th>';
	echo '<th> Model </th>';
	echo '<th> Capacity </th>';
	echo '<th> Manufacture_date </th>';
	echo '<th> Last_check_date </th>';
	echo '</tr>';
	echo '</thead>';
	echo '<tbody>';
	while ($row = oci_fetch_array($statement)) {
		echo '<tr>';
		echo '<td>'; echo $row['AIRPLANEID']; echo '</td>';
		echo '<td>'; echo $row['COMPANYID']; echo '</td>';
		echo '<td>'; echo $row['NAME']; echo '</td>';
		echo '<td>'; echo $row['MODEL']; echo '</td>';
		echo '<td>'; echo $row['CAPACITY']; echo '</td>';
		echo '<td>'; echo $row['MANUFACTUREDATE']; echo '</td>';
		echo '<td>'; echo $row['LASTCHECKDATE']; echo '</td>';
		echo '</tr>';
	}
	echo '</tbody>';
	echo '</table>';
	echo '</div>';
	$nr_pages = ceil($count / 10);
	?>
	<form class="page-form" action="show_airplanes.php" method="get">
		<input type="number" name="page" value="1" min="1" max=<?php echo "\"$nr_pages\""; ?>>	
		<input class="btn btn-primary" type="submit" name="submit" value="show page">	
	</form>
	<?php
}

function select_with_filter_airplanes() {
	$connection = connectToMyOracleDB();

	if ($_GET['field'] === 'Airplane_ID') {
		$query = 'SELECT count(*) as "COUNT" FROM airplanes WHERE AIRPLANEID = :r';
		$statement = oci_parse($connection, $query);
		oci_bind_by_name($statement, ':r', $_GET['value']);
		oci_execute($statement);
		$row = oci_fetch_array($statement);
		$count = $row['COUNT'];

		if (isset($_GET['page'])) {
			$query = 'SELECT * FROM (SELECT airplanes.*, rownum as "R" FROM AIRPLANES WHERE AIRPLANEID = :v) WHERE R <= ' . $_GET['page'] * 5 . ' AND R >= '. ($_GET['page'] - 1) * 5;
			$statement = oci_parse($connection, $query);
			oci_bind_by_name($statement, ':v', $_GET['value']); 
		} else {
			$query = 'SELECT * FROM airplanes WHERE ROWNUM <= 5 AND AIRPLANEID = :v';
			$statement = oci_parse($connection, $query);
			oci_bind_by_name($statement, ':v', $_GET['value']);
		}
	}

	if ($_GET['field'] === 'Company_ID') {
		$query = 'SELECT count(*) as "COUNT" FROM airplanes WHERE COMPANYID = :r';
		$statement = oci_parse($connection, $query);
		oci_bind_by_name($statement, ':r', $_GET['value']);
		oci_execute($statement);
		$row = oci_fetch_array($statement);
		$count = $row['COUNT'];
		if (isset($_GET['page'])) {
			$query = 'SELECT * FROM (SELECT airplanes.*, rownum as "R" FROM AIRPLANES WHERE COMPANYID = :v) WHERE R <= ' . $_GET['page'] * 5 . ' AND R >= '. ($_GET['page'] - 1) * 5;
			$statement = oci_parse($connection, $query);
			oci_bind_by_name($statement, ':v', $_GET['value']); 
		} else {
			$query = 'SELECT * FROM airplanes WHERE ROWNUM <= 5 AND COMPANYID = :v';
			$statement = oci_parse($connection, $query);
			oci_bind_by_name($statement, ':v', $_GET['value']);
		}
	}

	if ($_GET['field'] === 'Name') {
		$query = 'SELECT count(*) as "COUNT" FROM airplanes WHERE NAME = :r';
		$statement = oci_parse($connection, $query);
		oci_bind_by_name($statement, ':r', $_GET['value']);
		oci_execute($statement);
		$row = oci_fetch_array($statement);
		$count = $row['COUNT'];
		if (isset($_GET['page'])) {
			$query = 'SELECT * FROM (SELECT airplanes.*, rownum as "R" FROM AIRPLANES WHERE NAME = :v) WHERE R <= ' . $_GET['page'] * 5 . ' AND R >= '. ($_GET['page'] - 1) * 5;
			$statement = oci_parse($connection, $query);
			oci_bind_by_name($statement, ':v', $_GET['value']); 
		} else {
			$query = 'SELECT * FROM airplanes WHERE ROWNUM <= 5 AND NAME = :v';
			$statement = oci_parse($connection, $query);
			oci_bind_by_name($statement, ':v', $_GET['value']);
		}
	}

	if ($_GET['field'] === 'Model') {
		$query = 'SELECT count(*) as "COUNT" FROM airplanes WHERE MODEL = :r';
		$statement = oci_parse($connection, $query);
		oci_bind_by_name($statement, ':r', $_GET['value']);
		oci_execute($statement);
		$row = oci_fetch_array($statement);
		$count = $row['COUNT'];
		if (isset($_GET['page'])) {
			$query = 'SELECT * FROM (SELECT airplanes.*, rownum as "R" FROM AIRPLANES WHERE MODEL = :v) WHERE R <= ' . $_GET['page'] * 5 . ' AND R >= '. ($_GET['page'] - 1) * 5;
			$statement = oci_parse($connection, $query);
			oci_bind_by_name($statement, ':v', $_GET['value']); 
		} else {
			$query = 'SELECT * FROM airplanes WHERE ROWNUM <= 5 AND MODEL = :v';
			$statement = oci_parse($connection, $query);
			oci_bind_by_name($statement, ':v', $_GET['value']);
		}
	}


	if ($_GET['field'] === 'Capacity') {
		$query = 'SELECT count(*) as "COUNT" FROM airplanes WHERE CAPACITY = :r';
		$statement = oci_parse($connection, $query);
		oci_bind_by_name($statement, ':r', $_GET['value']);
		oci_execute($statement);
		$row = oci_fetch_array($statement);
		$count = $row['COUNT'];
		if (isset($_GET['page'])) {
			$query = 'SELECT * FROM (SELECT airplanes.*, rownum as "R" FROM AIRPLANES WHERE CAPACITY = :v) WHERE R <= ' . $_GET['page'] * 5 . ' AND R >= '. ($_GET['page'] - 1) * 5;
			$statement = oci_parse($connection, $query);
			oci_bind_by_name($statement, ':v', $_GET['value']); 
		} else {
			$query = 'SELECT * FROM airplanes WHERE ROWNUM <= 5 AND CAPACITY = :v';
			$statement = oci_parse($connection, $query);
			oci_bind_by_name($statement, ':v', $_GET['value']);
		}
	}

	if ($_GET['field'] === 'Manufacture Date') {
		$query = 'SELECT count(*) as "COUNT" FROM airplanes WHERE MANUFACTUREDATE = TO_DATE(:r, \'dd-mm-yyyy\')';
		$statement = oci_parse($connection, $query);
		oci_bind_by_name($statement, ':r', $_GET['value']);
		oci_execute($statement);
		$row = oci_fetch_array($statement);
		$count = $row['COUNT'];
		if (isset($_GET['page'])) {
			$query = 'SELECT * FROM (SELECT airplanes.*, rownum as "R" FROM AIRPLANES WHERE  MANUFACTUREDATE = TO_DATE(:v, \'dd-mm-yyyy\')) WHERE R <= ' . $_GET['page'] * 5 . ' AND R >= '. ($_GET['page'] - 1) * 5;
			$statement = oci_parse($connection, $query);
			oci_bind_by_name($statement, ':v', $_GET['value']); 
		} else {
			$query = 'SELECT * FROM airplanes WHERE ROWNUM <= 5 AND  MANUFACTUREDATE = TO_DATE(:v, \'dd-mm-yyyy\')';
			$statement = oci_parse($connection, $query);
			oci_bind_by_name($statement, ':v', $_GET['value']);
		}
	}

	if ($_GET['field'] === 'Last check date') {
		$query = 'SELECT count(*) as "COUNT" FROM airplanes WHERE LASTCHECKDATE = TO_DATE(:r, \'dd-mm-yyyy\')';
		$statement = oci_parse($connection, $query);
		oci_bind_by_name($statement, ':r', $_GET['value']);
		oci_execute($statement);
		$row = oci_fetch_array($statement);
		$count = $row['COUNT'];
		if (isset($_GET['page'])) {
			$query = 'SELECT * FROM (SELECT airplanes.*, rownum as "R" FROM AIRPLANES WHERE  LASTCHECKDATE = TO_DATE(:v, \'dd-mm-yyyy\')) WHERE R <= ' . $_GET['page'] * 5 . ' AND R >= '. ($_GET['page'] - 1) * 5;
			$statement = oci_parse($connection, $query);
			oci_bind_by_name($statement, ':v', $_GET['value']); 
		} else {
			$query = 'SELECT * FROM airplanes WHERE ROWNUM <= 5 AND  LASTCHECKDATE = TO_DATE(:v, \'dd-mm-yyyy\')';
			$statement = oci_parse($connection, $query);
			oci_bind_by_name($statement, ':v', $_GET['value']);
		}
	}



	
	oci_execute($statement);
	echo '<div class="container">';
	echo '<table class=" table">';
	echo '<thead>';
	echo '<tr>';
	echo '<th> Airplane_ID </th>';
	echo '<th> Company_ID </th>';
	echo '<th> Name </th>';
	echo '<th> Model </th>';
	echo '<th> Capacity </th>';
	echo '<th> Manufacture_date </th>';
	echo '<th> Last_check_date </th>';
	echo '</tr>';
	echo '</thead>';
	echo '<tbody>';
	while ($row = oci_fetch_array($statement)) {
		echo '<tr>';
		echo '<td>'; echo $row['AIRPLANEID']; echo '</td>';
		echo '<td>'; echo $row['COMPANYID']; echo '</td>';
		echo '<td>'; echo $row['NAME']; echo '</td>';
		echo '<td>'; echo $row['MODEL']; echo '</td>';
		echo '<td>'; echo $row['CAPACITY']; echo '</td>';
		echo '<td>'; echo $row['MANUFACTUREDATE']; echo '</td>';
		echo '<td>'; echo $row['LASTCHECKDATE']; echo '</td>';
		echo '</tr>';
	}
	echo '</tbody>';
	echo '</table>';
	echo '</div>';
	$nr_pages = ceil($count / 10);
	?>
	<form class="page-form" action="show_airplanes.php" method="get">
		<input type="number" name="page" value="1" min="1" max=<?php echo "\"$nr_pages\""; ?>>	
		<input class="btn btn-primary" type="submit" name="submit" value="show page">	
	</form>
	<?php
}
