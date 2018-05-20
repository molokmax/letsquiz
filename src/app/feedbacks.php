<?php


    class FeedbackModel {
        public $id;
        public $text;
        public $author;
    }

    class FeedbackRepository {

        
        public function BuildModel($data) {
            $rec = new FeedbackModel();
            $rec->id = $data['id'];
            $rec->text = $data['text'];
            $rec->author = $data['author'];
            return $rec;
        }

        public function Create($record) {
            $config = include('config.php');
            $result = array();

            $con = mysql_connect($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysql_error());
            }

            mysql_set_charset($config['DB_CONFIG_CHARSET'], $con);
	        mysql_select_db($config['DB_CONFIG_DATABASENAME'], $con);
    
            //$id_param = mysql_escape_string($record->id);
            $text_param = mysql_escape_string($record->text);
            $author_param = mysql_escape_string($record->author);
            $query = "INSERT INTO `feedback` (`text`, `author`) VALUES ('{$text_param}', '{$author_param}')";
            //print($query);
	        $db_result = mysql_query($query);
            
            mysql_close($con);

            if ($db_result) {
                return true;
            } else {
                return false;
            }
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
            $text_param = mysql_escape_string($record->text);
            $author_param = mysql_escape_string($record->author);
            $query = "UPDATE `feedback` SET `text` = '{$text_param}', `author` = '{$author_param}' WHERE `id` = {$id_param}";
            //print($query);
	        $db_result = mysql_query($query);
            
            mysql_close($con);

            if ($db_result) {
                return true;
            } else {
                return false;
            }
        }

        public function Delete($record) {
            $config = include('config.php');
            $result = array();

            $con = mysql_connect($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysql_error());
            }

            mysql_set_charset($config['DB_CONFIG_CHARSET'], $con);
	        mysql_select_db($config['DB_CONFIG_DATABASENAME'], $con);
    
            $id_param = mysql_escape_string($record->id);
            $query = "DELETE FROM `feedback` WHERE `id` = {$id_param}";
//print($query);
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
	
	        $query = 'SELECT `id`, `text`, `author` FROM `feedback` ORDER BY `order`';
	        $db_result = mysql_query($query);
            if ($db_result) {
                while($row = mysql_fetch_array($db_result)) {
                    $rec = new FeedbackModel();
                    $rec->id = $row['id'];
                    $rec->text = $row['text'];
                    $rec->author = $row['author'];
                    array_push($result, $rec);
                }
            }

            mysql_close($con);

            return $result;
        }
    }

?>