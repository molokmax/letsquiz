<?php

    class AddressModel {
        public $id;
        public $description;
        public $city_id;
        public $city_name;
    }

    class AddressRepository {

        public function GetAll() {
            $config = include('config.php');
            $result = array();

            $con = mysql_connect($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysql_error());
            }

            mysql_set_charset($config['DB_CONFIG_CHARSET'], $con);
	        mysql_select_db($config['DB_CONFIG_DATABASENAME'], $con);
	
	        $query = 'SELECT a.`id` as `id`, a.`description` as `description`, a.`city_id` as `city_id`, c.`name` as `city_name` FROM `address` as a JOIN `city` as c on (a.city_id = c.id)';
	        $db_result = mysql_query($query);
            if ($db_result) {
                while($row = mysql_fetch_array($db_result)) {
                    $rec = new AddressModel();
                    $rec->id = $row['id'];
                    $rec->description = $row['description'];
                    $rec->city_id = $row['city_id'];
                    $rec->city_name = $row['city_name'];
                    array_push($result, $rec);
                }
            }

            mysql_close($con);

            return $result;
        }
    }

?>