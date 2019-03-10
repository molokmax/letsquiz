<?php

    class ColorModel {
        public $id;
        public $name;
        public $prefix;
    }

    class ColorRepository {

        public function Read() {
            $config = include('config.php');
            $result = array();

            $con = mysql_connect($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysql_error());
            }

            mysql_set_charset($config['DB_CONFIG_CHARSET'], $con);
	        mysql_select_db($config['DB_CONFIG_DATABASENAME'], $con);
	
	        $query = "SELECT `id`, `name`, `prefix` FROM `color`";

	        $db_result = mysql_query($query);
            if ($db_result) {
                while($row = mysql_fetch_array($db_result)) {
                    $rec = new ColorModel();
                    $rec->id = $row['id'];
                    $rec->name = $row['name'];
                    $rec->prefix = $row['prefix'];
                    array_push($result, $rec);
                }
            }

            mysql_close($con);

            return $result;
        }
    }

?>