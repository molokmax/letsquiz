<?php


    class SettingModel {
        public $id;
        public $name;
        public $prefix;
        public $type;
        public $value;
    }

    class SettingRepository {

        
        public function BuildModel($data) {
            $rec = new SettingModel();
            $rec->id = $data['id'];
            $rec->name = $data['name'];
            $rec->prefix = $data['prefix'];
            $rec->type = $data['type'];
            $rec->value = $data['value'];
            return $rec;
        }

        public function Update($record) {
            $config = include('config.php');
            $result = array();

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);
            // $con = mysqli_connect($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }

            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
    
            $id_param = mysqli_escape_string($record->id);
            $value_param = mysqli_escape_string($record->value);
            $query = "UPDATE `setting` SET `value` = '{$value_param}' WHERE `id` = {$id_param}";
	        $db_result = mysqli_query($con, $query);
            
            mysqli_close($con);

            if ($db_result) {
                return true;
            } else {
                return false;
            }
        }

        public function Read() {
            $config = include('config.php');
            $result = array();

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);
            // $con = connect($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }

            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
	
	        $query = 'SELECT `id`, `name`, `prefix`, `type`, `value` FROM `setting`';
	        $db_result = mysqli_query($con, $query);
            if ($db_result) {
                while($row = mysqli_fetch_array($db_result)) {
                    $rec = new SettingModel();
                    $rec->id = $row['id'];
                    $rec->name = $row['name'];
                    $rec->prefix = $row['prefix'];
                    $rec->type = $row['type'];
                    $rec->value = $row['value'];
                    array_push($result, $rec);
                }
            }
            
            mysqli_close($con);

            return $result;
        }
    }

?>