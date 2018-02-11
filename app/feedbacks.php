<?php


    class FeedbackModel {
        public $id;
        public $text;
        public $author;
    }

    class FeedbackRepository {

        public function GetAll() {
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