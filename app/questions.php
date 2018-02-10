<?php


    class QuestionModel {
        public $id;
        public $question;
        public $answer;
    }

    class QuestionRepository {

        public function GetAll() {
            $config = include('config.php');
            $result = array();

            $con = mysql_connect($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysql_error());
            }

	        mysql_select_db($config['DB_CONFIG_DATABASENAME'], $con);
	
	        $query = 'SELECT `id`, `question`, `answer` FROM `question` ORDER BY `order`';
	        $db_result = mysql_query($query);
            if ($db_result) {
                while($row = mysql_fetch_array($db_result)) {
                    $rec = new QuestionModel();
                    $rec->id = $row['id'];
                    $rec->question = $row['question'];
                    $rec->answer = $row['answer'];
                    array_push($result, $rec);
                }
            }

            mysql_close($con);

            return $result;
        }
    }

?>