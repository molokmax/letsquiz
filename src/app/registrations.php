<?php

        
    class RegistrationReportParamsModel {
        public $game_id;
        public $timezone;

        function fromRequest($request) {
            $this->game_id = $request['game_id'];
            $this->timezone = new DateTimeZone('Europe/Moscow');
        }
    }

    class RegistrationModel {
        public $id;
        public $game_id;
        public $date;
        public $team_name;
        public $team_count;
        public $leader_name;
        public $phone;
        public $email;

        function fromDb($db_rec, $timezone) {
            $this->id = $db_rec['id'];
            $this->game_id = $db_rec['game_id'];
            $date = DateTime::createFromFormat('Y-m-d H:i:s', $db_rec['date'], $timezone);
            $this->date = $date->format('Y-m-d H:i:s');
            $this->team_name = $db_rec['team_name'];
            $this->team_count = $db_rec['team_count'];
            $this->leader_name = $db_rec['leader_name'];
            $this->phone = $db_rec['phone'];
            $this->email = $db_rec['email'];
        }
    }

    class RegistrationRepository {

        public function BuildModel($data) {
            $rec = new RegistrationModel();
            $rec->id = $data['id'];
            $rec->game_id = $data['game_id'];
            $rec->date = $data['date'];
            $rec->team_name = $data['team_name'];
            $rec->team_count = $data['team_count'];
            $rec->leader_name = $data['leader_name'];
            $rec->phone = $data['phone'];
            $rec->email = $data['email'];
            return $rec;
        }
        public function GetCSVReportName($rec, $timezone) {
            $date = new DateTime('NOW', $timezone);
            $timestamp = $date->format('Ymd_Hi');
            return "Game{$rec->game_id}_{$timestamp}.csv";
        }
        public function BuildReportParamsModel($data) {
            $rec = new RegistrationReportParamsModel();
            $rec->fromRequest($data);
            return $rec;
        }

        public function Create($registration) {
            $config = include('config.php');
            $result = array();

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }

            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
    
            $gameid_param = mysqli_escape_string($con, $registration->game_id);
            $date_param = mysqli_escape_string($con, $registration->date);
            $teamname_param = mysqli_escape_string($con, $registration->team_name);
            $teamcount_param = mysqli_escape_string($con, $registration->team_count);
            $leadername_param = mysqli_escape_string($con, $registration->leader_name);
            $phone_param = mysqli_escape_string($con, $registration->phone);
            $email_param = mysqli_escape_string($con, $registration->email);

            $query = "INSERT INTO `registration` (`game_id`, `date`, `team_name`, `team_count`, `leader_name`, `phone`, `email`) VALUES ({$gameid_param}, '{$date_param}', '{$teamname_param}', {$teamcount_param}, '{$leadername_param}', '{$phone_param}', '{$email_param}')";

            $db_result = mysqli_query($con, $query);
            
            if (!$db_result) {
                // TODO: log message
                $err = mysqli_error($con);
            }

            mysqli_close($con);

            if ($db_result) {
                return true;
            } else {
                return false;
            }
        }

        public function Update($registration) {
            $config = include('config.php');
            $result = array();

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }

            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
    
            $id_param = mysqli_escape_string($con, $registration->id);
            $gameid_param = mysqli_escape_string($con, $registration->game_id);
            $date_param = mysqli_escape_string($con, $registration->date);
            $teamname_param = mysqli_escape_string($con, $registration->team_name);
            $teamcount_param = mysqli_escape_string($con, $registration->team_count);
            $leadername_param = mysqli_escape_string($con, $registration->leader_name);
            $phone_param = mysqli_escape_string($con, $registration->phone);
            $email_param = mysqli_escape_string($con, $registration->email);

            $query = "UPDATE `registration` SET `game_id` = {$gameid_param}, `date` = '{$date_param}', `team_name` = '{$teamname_param}', `team_count` = {$teamcount_param}, `leader_name` = '{$leader_name}', `phone` = '{$phone_param}', `email` = '{$email_param}' WHERE `id` = {$id_param}";

	        $db_result = mysqli_query($con, $query);
            
            mysqli_close($con);

            if ($db_result) {
                return true;
            } else {
                return false;
            }
        }

        public function Delete($registration) {
            $config = include('config.php');
            $result = array();

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }

            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
    
            $id_param = mysqli_escape_string($con, $registration->id);
            $query = "DELETE FROM `registration` WHERE `id` = {$id_param}";

	        $db_result = mysqli_query($con, $query);
            
            mysqli_close($con);

            if ($db_result) {
                return true;
            } else {
                return false;
            }
        }

        public function Read($timezone) {
            $config = include('config.php');
            $result = array();

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }

            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
            mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
            
	        $query = "SELECT r.`id` AS `id`, r.`game_id` AS `game_id`, r.`date` AS `date`, r.`team_name` AS `team_name`, r.`team_count` AS `team_count`, r.`leader_name` AS `leader_name`, r.`phone` AS `phone`, r.`email` AS `email` FROM `registration` AS r ORDER BY r.`date`";

	        $db_result = mysqli_query($con, $query);
            if ($db_result) {
                while($row = mysqli_fetch_array($db_result)) {
                    $rec = new RegistrationModel();
                    $rec->fromDb($row, $timezone);
                    array_push($result, $rec);
                }
            }

            mysqli_close($con);

            return $result;
        }

        public function ReadReport($params) {
            $config = include('config.php');
            $result = array();

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }

            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
            mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
            
            $gameid_param = mysqli_escape_string($con, $params->game_id);
    
            $query = "SELECT r.`id` AS `id`, r.`game_id` AS `game_id`, r.`date` AS `date`, r.`team_name` AS `team_name`, r.`team_count` AS `team_count`, r.`leader_name` AS `leader_name`, r.`phone` AS `phone`, r.`email` AS `email` FROM `registration` AS r WHERE r.`game_id` = {$gameid_param} ORDER BY r.`date`";

	        $db_result = mysqli_query($con, $query);
            if ($db_result) {
                while($row = mysqli_fetch_array($db_result)) {
                    $rec = new RegistrationModel();
                    $rec->fromDb($row, $params->timezone);
                    array_push($result, $rec);
                }
            }

            mysqli_close($con);

            return $result;
        }

        public function BuildReport($params) {

			$data = $this->ReadReport($params);

			$headers = $this->GetCSVReportHeader();
			$lines = array();
			foreach ($data as $rec) {
				$line = $this->GetCSVReportLine($rec);
				array_push($lines, $line);
			}
            $result = $this->BuildCSV($headers, $lines);
            return $result;
        }


            
        private function GetCSVReportHeader() {
            return array('Дата регистрации', 'Команда', 'Количество человек', 'Капитан', 'Телефон', 'Email');
            // return array('Registration date', 'Team name', 'Gamer count', 'Leader', 'Phone', 'Email');
        }
        private function GetCSVReportLine($rec) {
            return array($rec->date, $rec->team_name, $rec->team_count, $rec->leader_name, $rec->phone, $rec->email);
        }
        private function BuildCSV($headers, $records) {
            // we use a threshold of 1 MB (1024 * 1024), it's just an example
            $fd = fopen('php://temp/maxmemory:1048576', 'w');
            if($fd === FALSE) {
                die('Failed to open temporary file');
            }

            fputs($fd, "Sep=;\r\n");
            fputcsv($fd, $headers, ";");
            foreach($records as $record) {
                fputcsv($fd, $record, ";");
            }

            rewind($fd);
            $csv = stream_get_contents($fd);
            $config = include('config.php');
            $target_encoding = $config['REPORT_CHARSET'];
            $csv = iconv("UTF-8", $target_encoding, $csv);
            fclose($fd); // releases the memory (or tempfile)
            return $csv;
        }
    }

?>