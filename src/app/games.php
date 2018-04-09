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
        public $city;
        public $is_closed;
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

        function __construct($db_game, $formatter) {
            $this->id = $db_game->id;
            $this->full_date = $db_game->date->format('Y-m-d H:i:s');
            $this->date = $db_game->date->format('j') . ' ' . $formatter->getMonthName($db_game->date);
            $this->day_name = $formatter->getDayName($db_game->date);
            $this->time = $db_game->date->format('H:i');
            $this->city = $db_game->city;
            $this->game_name = $db_game->game_name;
            $this->is_closed = $db_game->is_closed;
        }
    }

    class GameRepository {

        public function GetAfterDate($date, $limit, $timezone) {
            $config = include('config.php');
            $result = array();

            $con = mysql_connect($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysql_error());
            }

            mysql_set_charset($config['DB_CONFIG_CHARSET'], $con);
	        mysql_select_db($config['DB_CONFIG_DATABASENAME'], $con);
	
	        $query = "SELECT g.`id` AS `id`, g.`date` AS  `date`, g.`name` AS `game_name`, c.`name` AS  `city`, g.`is_closed` AS `is_closed` FROM  `game` AS g JOIN  `city` AS c ON ( g.`city_id` = c.`id` ) WHERE g.`date` > '{$date->format('Y-m-d H:i:s')}' ORDER BY g.`date` LIMIT 0, $limit";

	        $db_result = mysql_query($query);
            if ($db_result) {
                while($row = mysql_fetch_array($db_result)) {
                    $rec = new GameModel();
                    $rec->id = $row['id'];
                    $rec->date = DateTime::createFromFormat('Y-m-d H:i:s', $row['date'], $timezone);
                    $rec->game_name = $row['game_name'];
                    $rec->city = $row['city'];
                    $rec->is_closed = $row['is_closed'];
                    array_push($result, $rec);
                }
            }

            mysql_close($con);

            return $result;
        }
    }

?>