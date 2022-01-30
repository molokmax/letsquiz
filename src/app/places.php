<?php

    class PlaceModel {
        public $id;
        public $description;
        public $city_id;
        public $city_name;
    }

    class PlaceRepository {

        public function GetAll() {
            $config = include('config.php');
            $result = array();

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }

            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
	
	        $query = 'SELECT a.`id` as `id`, a.`description` as `description`, a.`city_id` as `city_id`, c.`name` as `city_name` FROM `place` as a JOIN `city` as c on (a.city_id = c.id)';
	        $db_result = mysqli_query($con, $query);
            if ($db_result) {
                while($row = mysqli_fetch_array($db_result)) {
                    $rec = new PlaceModel();
                    $rec->id = $row['id'];
                    $rec->description = $row['description'];
                    $rec->city_id = $row['city_id'];
                    $rec->city_name = $row['city_name'];
                    array_push($result, $rec);
                }
            }

            mysqli_close($con);

            return $result;
        }
    }

?>