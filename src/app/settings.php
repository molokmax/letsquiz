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

            $con = mysql_connect($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysql_error());
            }

            mysql_set_charset($config['DB_CONFIG_CHARSET'], $con);
	        mysql_select_db($config['DB_CONFIG_DATABASENAME'], $con);
    
            $id_param = mysql_escape_string($record->id);
            $value_param = mysql_escape_string($record->value);
            $query = "UPDATE `setting` SET `value` = '{$value_param}' WHERE `id` = {$id_param}";
	        $db_result = mysql_query($query);
            
            mysql_close($con);

            if ($db_result) {
                return true;
            } else {
                return false;
            }
        }

        public function Read() {
            $config = include('config.php');
            $result = array();

            $con = mysql_connect($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysql_error());
            }

            mysql_set_charset($config['DB_CONFIG_CHARSET'], $con);
	        mysql_select_db($config['DB_CONFIG_DATABASENAME'], $con);
	
	        $query = 'SELECT `id`, `name`, `prefix`, `type`, `value` FROM `setting`';
	        $db_result = mysql_query($query);
            if ($db_result) {
                while($row = mysql_fetch_array($db_result)) {
                    $rec = new SettingModel();
                    $rec->id = $row['id'];
                    $rec->name = $row['name'];
                    $rec->prefix = $row['prefix'];
                    $rec->type = $row['type'];
                    $rec->value = $row['value'];
                    array_push($result, $rec);
                }
            }
            
            mysql_close($con);

            return $result;
        }
    }

?>