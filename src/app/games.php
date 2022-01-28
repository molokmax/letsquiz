<?php

    class GameFormatter {

        public function getGameDate($date) {
            return $date->format('j') . ' ' . $this->getMonthName($date) . ' в ' . $date->format('H:i');
        }

        public function getDayName($date) {
            $day_of_week = $date->format('N');
            return $this->WEEK_DAY_NAMES[$day_of_week];
        }
        public function getDayShortName($date) {
            $day_of_week = $date->format('N');
            return $this->WEEK_DAY_SHORT_NAMES[$day_of_week];
        }

        public function getMonthName($date) {
            $month_number = $date->format('n');
            return $this->MONTH_NAMES[$month_number];
        }
        public function getMonthShortName($date) {
            $month_number = $date->format('n');
            return $this->MONTH_SHORT_NAMES[$month_number];
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
        private $WEEK_DAY_SHORT_NAMES = array(
            1 => 'пн',
            2 => 'вт',
            3 => 'ср',
            4 => 'чт',
            5 => 'пт',
            6 => 'сб',
            7 => 'вс'
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
        private $MONTH_SHORT_NAMES = array(
            1 => 'янв.',
            2 => 'фев.',
            3 => 'мар.',
            4 => 'апр.',
            5 => 'мая',
            6 => 'июн.',
            7 => 'июл.',
            8 => 'авг.',
            9 => 'сен.',
            10 => 'окт.',
            11 => 'ноя.',
            12 => 'дек.'
        );

    }

    class GameModel {
        public $id;
        public $date;
        public $game_name;
        public $place_id;
        public $place;
        public $city_id;
        public $city;
        public $is_closed;
        public $is_online;
        public $color_id;
        public $color_name;
        public $color;
        public $price;
    }
    
    class GameViewModel {

        public $id;
        public $full_date;
        public $date;
        public $date_short;
        public $day_name;
        public $day_short_name;
        public $time;
        public $game_name;
        public $place_id;
        public $place;
        public $city_id;
        public $city;
        public $is_closed;
        public $is_online;
        public $color;
        public $price;

        function __construct($db_game, $formatter, $colors) {
            $this->id = $db_game->id;
            $this->full_date = $db_game->date->format('Y-m-d H:i:s');
            $this->date = $db_game->date->format('j') . ' ' . $formatter->getMonthName($db_game->date);
            $this->date_short = $db_game->date->format('j') . ' ' . $formatter->getMonthShortName($db_game->date);
            $this->day_name = $formatter->getDayName($db_game->date);
            $this->day_short_name = $formatter->getDayShortName($db_game->date);
            $this->time = $db_game->date->format('H:i');
            $this->place_id = $db_game->place_id;
            $this->place = $db_game->place;
            $this->city_id = $db_game->city_id;
            $this->city = $db_game->city;
            $this->game_name = $db_game->game_name;
            $this->is_closed = $db_game->is_closed;
            $this->is_online = $db_game->is_online;
            $this->price = $db_game->price;
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
            $rec->place_id = $data['place_id'];
            $rec->is_closed = $data['is_closed'];
            $rec->color_id = $data['color_id'];
            $rec->price = $data['price'];
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
    
            //$id_param = mysqli_escape_string($con, $game->id);
            $date_param = mysqli_escape_string($con, $game->date);
            $name_param = mysqli_escape_string($con, $game->game_name);
            $place_param = mysqli_escape_string($con, $game->place_id);
            $isclosed_param = mysqli_escape_string($con, $game->is_closed);
            $color_param = mysqli_escape_string($con, $game->color_id);
            $price_param = mysqli_escape_string($con, $game->price);

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

            $query = "INSERT INTO `game` (`date`, `name`, `place_id`, `is_closed`, `color_id`, `price`) VALUES ('{$date_param}', '{$name_param}', {$place_param}, {$isclosed_param}, {$color_param}, '{$price_param}')";

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

        public function Update($game) {
            $config = include('config.php');
            $result = array();

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }

            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
    
            $id_param = mysqli_escape_string($con, $game->id);
            $date_param = mysqli_escape_string($con, $game->date);
            $name_param = mysqli_escape_string($con, $game->game_name);
            $place_param = mysqli_escape_string($con, $game->place_id);
            $isclosed_param = mysqli_escape_string($con, $game->is_closed);
            $color_param = mysqli_escape_string($con, $game->color_id);
            $price_param = mysqli_escape_string($con, $game->price);

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

            $query = "UPDATE `game` SET `date` = '{$date_param}', `name` = '{$name_param}', `place_id` = {$place_param}, `is_closed` = {$isclosed_param}, `color_id` = {$color_param}, `price` = '{$price_param}' WHERE `id` = {$id_param}";
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
    
            $id_param = mysqli_escape_string($con, $game->id);
            $query = "DELETE FROM `game` WHERE `id` = {$id_param}";
// print($query);
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
	
	        $query = "SELECT g.`id` AS `id`, g.`date` AS  `date`, g.`name` AS `game_name`, g.`place_id` AS `place_id`, p.`description` AS  `place`, p.`city_id` AS `city_id`, c.`name` AS  `city`, g.`is_closed` AS `is_closed`, g.`color_id` AS `color_id`, clr.`name` AS `color_name`, clr.`prefix` AS `color_prefix`, g.`price` AS `price` FROM  `game` AS g LEFT JOIN `place` AS p ON (g.`place_id` = p.`id`) LEFT JOIN `city` AS c ON (p.`city_id` = c.`id`) LEFT JOIN `color` as clr ON (g.`color_id` = clr.`id`) ORDER BY g.`date`";

	        $db_result = mysqli_query($con, $query);
            if ($db_result) {
                while($row = mysqli_fetch_array($db_result)) {
                    $rec = new GameModel();
                    $rec->id = $row['id'];
                    $date = DateTime::createFromFormat('Y-m-d H:i:s', $row['date'], $timezone);
                    $rec->date = $date->format('Y-m-d H:i');
                    $rec->game_name = $row['game_name'];
                    $rec->place_id = $row['place_id'];
                    $rec->place = $row['place'];
                    $rec->city_id = $row['city_id'];
                    $rec->city = $row['city'];
                    $rec->is_closed = $row['is_closed'];
                    $rec->color_id = $row['color_id'];
                    $rec->color_name = $row['color_name'];
                    $rec->color = $row['color_prefix'];
                    $rec->price = $row['price'];
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
	
            $query = "SELECT g.`id` AS `id`, g.`date` AS  `date`, g.`name` AS `game_name`, g.`place_id` AS `place_id`, p.`description` AS `place`, p.`city_id` AS `city_id`, c.`name` AS  `city`, g.`is_closed` AS `is_closed`, c.`is_online` AS `is_online`, g.`color_id` AS `color_id`, clr.`name` AS `color_name`, clr.`prefix` AS `color_prefix`, g.`price` AS `price` FROM  `game` AS g LEFT JOIN `place` AS p ON (g.`place_id` = p.`id`) LEFT JOIN `city` AS c ON (p.`city_id` = c.`id`) LEFT JOIN `color` as clr ON (g.`color_id` = clr.`id`) WHERE g.`date` > '{$date->format('Y-m-d H:i:s')}' ORDER BY g.`date` LIMIT 0, $limit";

	        $db_result = mysqli_query($con, $query);
            if ($db_result) {
                while($row = mysqli_fetch_array($db_result)) {
                    $rec = new GameModel();
                    $rec->id = $row['id'];
                    $rec->date = DateTime::createFromFormat('Y-m-d H:i:s', $row['date'], $timezone);
                    $rec->game_name = $row['game_name'];
                    $rec->place_id = $row['place_id'];
                    $rec->place = $row['place'];
                    $rec->city_id = $row['city_id'];
                    $rec->city = $row['city'];
                    $rec->is_closed = $row['is_closed'];
                    $rec->is_online = $row['is_online'];
                    $rec->color_id = $row['color_id'];
                    $rec->color_name = $row['color_name'];
                    $rec->color = $row['color_prefix'];
                    $rec->price = $row['price'];
                    array_push($result, $rec);
                }
            }

            mysqli_close($con);

            return $result;
        }
    }

?>