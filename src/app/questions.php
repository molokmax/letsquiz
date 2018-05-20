<?php


    class QuestionModel {
        public $id;
        public $question;
        public $answer;
        public $order;
    }

    class QuestionRepository {

        
        public function BuildModel($data) {
            $rec = new QuestionModel();
            $rec->id = $data['id'];
            $rec->question = $data['question'];
            $rec->answer = $data['answer'];
            $rec->order = $data['order'];
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
            $question_param = mysql_escape_string($record->question);
            $answer_param = mysql_escape_string($record->answer);
            $order_param = mysql_escape_string($record->order);
            $query = "INSERT INTO `question` (`question`, `answer`, `order`) VALUES ('{$question_param}', '{$answer_param}', {$order_param})";
            $db_result = mysql_query($query);
            // if (!$db_result) {
            //     print($query . "\n");
            //     print(mysql_errno($con) . ": " . mysql_error($con) . "\n");
            // }
            
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
            $question_param = mysql_escape_string($record->question);
            $answer_param = mysql_escape_string($record->answer);
            $order_param = mysql_escape_string($record->order);
            $query = "UPDATE `question` SET `question` = '{$question_param}', `answer` = '{$answer_param}', `order` = '{$order_param}' WHERE `id` = {$id_param}";
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
            $query = "DELETE FROM `question` WHERE `id` = {$id_param}";
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
	
	        $query = 'SELECT `id`, `question`, `answer`, `order` FROM `question` ORDER BY `order`';
	        $db_result = mysql_query($query);
            if ($db_result) {
                while($row = mysql_fetch_array($db_result)) {
                    $rec = new QuestionModel();
                    $rec->id = $row['id'];
                    $rec->question = $row['question'];
                    $rec->answer = $row['answer'];
                    $rec->order = $row['order'];
                    array_push($result, $rec);
                }
            }

            mysql_close($con);

            return $result;
        }
    }

?>