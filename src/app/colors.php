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

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }

            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
	
	        $query = "SELECT `id`, `name`, `prefix` FROM `color`";

	        $db_result = mysqli_query($con, $query);
            if ($db_result) {
                while($row = mysqli_fetch_array($db_result)) {
                    $rec = new ColorModel();
                    $rec->id = $row['id'];
                    $rec->name = $row['name'];
                    $rec->prefix = $row['prefix'];
                    array_push($result, $rec);
                }
            }

            mysqli_close($con);

            return $result;
        }
    }

?>