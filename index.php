<?php
	include('config.php');
	//echo($DB_CONFIG_HOSTNAME);
	$con = mysql_connect($DB_CONFIG_HOSTNAME, $DB_CONFIG_USERNAME, $DB_CONFIG_PASSWORD);
	mysql_select_db($DB_CONFIG_DATABASENAME, $con);
	
	$query = 'select `id`, `name`, `prefix`, `value` from `setting`';
	$result = mysql_query($query);
	if ($result) {
		while($row = mysql_fetch_array($result)) {
			$id = $row['id'];
			$name = $row['name'];
			$prefix = $row['prefix'];
			$value = $row['value'];
			$line = "id = $id, name = $name, prefix = $prefix, value = $value <br />";
			echo($line);
		}
	}
	
	echo('OK');
?>
