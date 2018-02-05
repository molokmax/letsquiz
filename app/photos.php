<?php

    class PhotoRepository {

        public function GetAll() {
            $config = include('config.php');
            $result = array();

            $con = mysql_connect($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysql_error());
            }

	        mysql_select_db($config['DB_CONFIG_DATABASENAME'], $con);
	
	        $query = 'select `id`, `url`, `order` from `photo` ORDER BY  `order`';
	        $db_result = mysql_query($query);
            if ($db_result) {
                while($row = mysql_fetch_array($db_result)) {
                    array_push($result, $row['url']);
                }
            }

            return $result;
        }
    }

?>