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

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }

            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
    
            //$id_param = mysqli_escape_string($record->id);
            $question_param = mysqli_escape_string($record->question);
            $answer_param = mysqli_escape_string($record->answer);
            $order_param = mysqli_escape_string($record->order);
            $query = "INSERT INTO `question` (`question`, `answer`, `order`) VALUES ('{$question_param}', '{$answer_param}', {$order_param})";
            $db_result = mysqli_query($con, $query);
            // if (!$db_result) {
            //     print($query . "\n");
            //     print(mysqli_errno($con) . ": " . mysqli_error($con) . "\n");
            // }
            
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
    
            $id_param = mysqli_escape_string($record->id);
            $question_param = mysqli_escape_string($record->question);
            $answer_param = mysqli_escape_string($record->answer);
            $order_param = mysqli_escape_string($record->order);
            $query = "UPDATE `question` SET `question` = '{$question_param}', `answer` = '{$answer_param}', `order` = '{$order_param}' WHERE `id` = {$id_param}";
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
    
            $id_param = mysqli_escape_string($record->id);
            $query = "DELETE FROM `question` WHERE `id` = {$id_param}";
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
	
	        $query = 'SELECT `id`, `question`, `answer`, `order` FROM `question` ORDER BY `order`';
	        $db_result = mysqli_query($con, $query);
            if ($db_result) {
                while($row = mysqli_fetch_array($db_result)) {
                    $rec = new QuestionModel();
                    $rec->id = $row['id'];
                    $rec->question = $row['question'];
                    $rec->answer = $row['answer'];
                    $rec->order = $row['order'];
                    array_push($result, $rec);
                }
            }

            mysqli_close($con);

            return $result;
        }
    }

?>