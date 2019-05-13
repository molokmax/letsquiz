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

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }

            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
    
            //$id_param = mysqli_escape_string($con, $record->id);
            $text_param = mysqli_escape_string($con, $record->text);
            $author_param = mysqli_escape_string($con, $record->author);
            $query = "INSERT INTO `feedback` (`text`, `author`) VALUES ('{$text_param}', '{$author_param}')";
            //print($query);
	        $db_result = mysqli_query($con, $query);
            
            mysqli_close($con);

            if ($db_result) {
                return true;
            } else {
                return false;
            }
        }

        public function Update($record) {
            $config = include('config.php');
            $result = array();

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }

            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
    
            $id_param = mysqli_escape_string($con, $record->id);
            $text_param = mysqli_escape_string($con, $record->text);
            $author_param = mysqli_escape_string($con, $record->author);
            $query = "UPDATE `feedback` SET `text` = '{$text_param}', `author` = '{$author_param}' WHERE `id` = {$id_param}";
            //print($query);
	        $db_result = mysqli_query($con, $query);
            
            mysqli_close($con);

            if ($db_result) {
                return true;
            } else {
                return false;
            }
        }

        public function Delete($record) {
            $config = include('config.php');
            $result = array();

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }

            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
    
            $id_param = mysqli_escape_string($con, $record->id);
            $query = "DELETE FROM `feedback` WHERE `id` = {$id_param}";
//print($query);
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

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }
            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
	
	        $query = 'SELECT `id`, `text`, `author` FROM `feedback` ORDER BY `order`';
	        $db_result = mysqli_query($con, $query);
            if ($db_result) {
                while($row = mysqli_fetch_array($db_result)) {
                    $rec = new FeedbackModel();
                    $rec->id = $row['id'];
                    $rec->text = $row['text'];
                    $rec->author = $row['author'];
                    array_push($result, $rec);
                }
            }

            mysqli_close($con);

            return $result;
        }
    }

?>