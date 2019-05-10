<?php

    class GameFormatter {

        public function getGameDate($date) {
            return $date->format('j') . ' ' . $this->getMonthName($date) . ' в ' . $date->format('H:i');
        }

        public function getDayName($date) {
            $day_of_week = $date->format('N');
            return $this->WEEK_DAY_NAMES[$day_of_week];
        }

        public function getMonthName($date) {
            $month_number = $date->format('n');
            return $this->MONTH_NAMES[$month_number];
        }
        
        private $WEEK_DAY_NAMES = array(
            1 => 'Понедельник',
            2 => 'Вторник',
            3 => 'Среда',
            4 => 'Четверг',
            5 => 'Пятница',
            6 => 'Суббота',
            7 => 'Воскресенье'
        );

        private $MONTH_NAMES = array(
            1 => 'января',
            2 => 'февраля',
            3 => 'марта',
            4 => 'апреля',
            5 => 'мая',
            6 => 'июня',
            7 => 'июля',
            8 => 'августа',
            9 => 'сентября',
            10 => 'октября',
            11 => 'ноября',
            12 => 'декабря'
        );
    }

    class GameModel {
        public $id;
        public $date;
        public $game_name;
        public $city_id;
        public $city;
        public $is_closed;
        public $color_id;
        public $color_name;
        public $color;
    }
    
    class GameViewModel {

        public $id;
        public $full_date;
        public $date;
        public $day_name;
        public $time;
        public $game_name;
        public $city;
        public $is_closed;
        public $color;

        function __construct($db_game, $formatter, $colors) {
            $this->id = $db_game->id;
            $this->full_date = $db_game->date->format('Y-m-d H:i:s');
            $this->date = $db_game->date->format('j') . ' ' . $formatter->getMonthName($db_game->date);
            $this->day_name = $formatter->getDayName($db_game->date);
            $this->time = $db_game->date->format('H:i');
            $this->city = $db_game->city;
            $this->game_name = $db_game->game_name;
            $this->is_closed = $db_game->is_closed;
            if ($db_game->color) {
                $this->color = $db_game->color;
            } else {
                $rnd_index = rand(0, count($colors)-1);
                $clr = $colors[$rnd_index];
                $this->color = $clr->prefix;
            }
        }
    }

    class GameRepository {

        public function BuildModel($data) {
            $rec = new GameModel();
            $rec->id = $data['id'];
            $rec->date = $data['date'];
            $rec->game_name = $data['name'];
            $rec->city_id = $data['city_id'];
            $rec->city = $data['city'];
            $rec->is_closed = $data['is_closed'];
            $rec->color_id = $data['color_id'];
            return $rec;
        }

        public function Create($game) {
            $config = include('config.php');
            $result = array();

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }

            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
    
            //$id_param = mysqli_escape_string($game->id);
            $date_param = mysqli_escape_string($game->date);
            $name_param = mysqli_escape_string($game->game_name);
            $city_param = mysqli_escape_string($game->city_id);
            $isclosed_param = mysqli_escape_string($game->is_closed);
            $color_param = mysqli_escape_string($game->color_id);
            // print("COLOR: {$color_param}");

            // if color is not selected, take random
            if (!$color_param) {
                $random_color_query = "SELECT `id` FROM `color` ORDER BY RAND() LIMIT 1";
                $db_color_result = mysqli_query($con, $random_color_query);
                if ($db_color_result) {
                    if($color_row = mysqli_fetch_array($db_color_result)) {
                        $color_param = $color_row['id'];
                    }
                }
            }
            if (!$color_param) {
                $color_param = 'NULL';
            }

            $query = "INSERT INTO `game` (`date`, `name`, `city_id`, `is_closed`, `color_id`) VALUES ('{$date_param}', '{$name_param}', {$city_param}, {$isclosed_param}, {$color_param})";
            //print($query);
	        $db_result = mysqli_query($con, $query);
            
            mysqli_close($con);

            if ($db_result) {
                return true;
            } else {
                return false;
            }
        }

        public function Update($game) {
            $config = include('config.php');
            $result = array();

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }

            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
    
            $id_param = mysqli_escape_string($game->id);
            $date_param = mysqli_escape_string($game->date);
            $name_param = mysqli_escape_string($game->game_name);
            $city_param = mysqli_escape_string($game->city_id);
            $isclosed_param = mysqli_escape_string($game->is_closed);
            $color_param = mysqli_escape_string($game->color_id);

            // if color is not selected, take random
            if (!$color_param) {
                $random_color_query = "SELECT `id` FROM `color` ORDER BY RAND() LIMIT 1";
                $db_color_result = mysqli_query($con, $random_color_query);
                if ($db_color_result) {
                    if($color_row = mysqli_fetch_array($db_color_result)) {
                        $color_param = $color_row['id'];
                    }
                }
            }
            if (!$color_param) {
                $color_param = 'NULL';
            }

            $query = "UPDATE `game` SET `date` = '{$date_param}', `name` = '{$name_param}', `city_id` = {$city_param}, `is_closed` = {$isclosed_param}, `color_id` = {$color_param} WHERE `id` = {$id_param}";
            //print($query);
	        $db_result = mysqli_query($con, $query);
            
            mysqli_close($con);

            if ($db_result) {
                return true;
            } else {
                return false;
            }
        }

        public function Delete($game) {
            $config = include('config.php');
            $result = array();

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }

            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
    
            $id_param = mysqli_escape_string($game->id);
            $query = "DELETE FROM `game` WHERE `id` = {$id_param}";
//print($query);
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
	
	        $query = "SELECT g.`id` AS `id`, g.`date` AS  `date`, g.`name` AS `game_name`, g.`city_id` AS `city_id`, c.`name` AS  `city`, g.`is_closed` AS `is_closed`, g.`color_id` AS `color_id`, clr.`name` AS `color_name`, clr.`prefix` AS `color_prefix` FROM  `game` AS g JOIN  `city` AS c ON ( g.`city_id` = c.`id` ) LEFT JOIN `color` as clr ON (g.`color_id` = clr.`id`) ORDER BY g.`date`";

	        $db_result = mysqli_query($con, $query);
            if ($db_result) {
                while($row = mysqli_fetch_array($db_result)) {
                    $rec = new GameModel();
                    $rec->id = $row['id'];
                    $date = DateTime::createFromFormat('Y-m-d H:i:s', $row['date'], $timezone);
                    $rec->date = $date->format('Y-m-d H:i');
                    $rec->game_name = $row['game_name'];
                    $rec->city_id = $row['city_id'];
                    $rec->city = $row['city'];
                    $rec->is_closed = $row['is_closed'];
                    $rec->color_id = $row['color_id'];
                    $rec->color_name = $row['color_name'];
                    $rec->color = $row['color_prefix'];
                    array_push($result, $rec);
                }
            }

            mysqli_close($con);

            return $result;
        }

        public function GetAfterDate($date, $limit, $timezone) {
            $config = include('config.php');
            $result = array();

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }

            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
	
	        $query = "SELECT g.`id` AS `id`, g.`date` AS  `date`, g.`name` AS `game_name`, c.`name` AS  `city`, g.`is_closed` AS `is_closed`, g.`color_id` AS `color_id`, clr.`name` AS `color_name`, clr.`prefix` AS `color_prefix` FROM  `game` AS g JOIN  `city` AS c ON ( g.`city_id` = c.`id` ) LEFT JOIN `color` as clr ON (g.`color_id` = clr.`id`) WHERE g.`date` > '{$date->format('Y-m-d H:i:s')}' ORDER BY g.`date` LIMIT 0, $limit";

	        $db_result = mysqli_query($con, $query);
            if ($db_result) {
                while($row = mysqli_fetch_array($db_result)) {
                    $rec = new GameModel();
                    $rec->id = $row['id'];
                    $rec->date = DateTime::createFromFormat('Y-m-d H:i:s', $row['date'], $timezone);
                    $rec->game_name = $row['game_name'];
                    $rec->city = $row['city'];
                    $rec->is_closed = $row['is_closed'];
                    $rec->color_id = $row['color_id'];
                    $rec->color_name = $row['color_name'];
                    $rec->color = $row['color_prefix'];
                    array_push($result, $rec);
                }
            }

            mysqli_close($con);

            return $result;
        }
    }

?>