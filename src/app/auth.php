<?php

    class AuthUtility {

        function IsValid($user, $pass) {
            $config = include('config.php');
            $result = array();

            $con = mysql_connect($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysql_error());
            }

            mysql_set_charset($config['DB_CONFIG_CHARSET'], $con);
	        mysql_select_db($config['DB_CONFIG_DATABASENAME'], $con);

            $user_param = mysql_escape_string($user);
            $pass_param = mysql_escape_string($pass);
            $query = "SELECT count(*) AS `cnt` FROM `user` WHERE `name` = '{$user_param}' AND `pass` = PASSWORD('{$pass_param}') AND `is_locked` = 0";
            
	        $db_result = mysql_query($query);
            $count = mysql_fetch_object($db_result)->cnt;

            mysql_close($con);

            return $count > 0;
        }

        function Auth() {
            header('Cache-Control: no-cache, must-revalidate, max-age=0');
            $user = $_SERVER['PHP_AUTH_USER'];
            $pass = $_SERVER['PHP_AUTH_PW'];
            $hasCredentials = !empty($user) && !empty($pass);
            if ($hasCredentials) {
                $isValid = $this->IsValid($user, $pass);
            } else {
                $isValid = false;
            }
            if (!$isValid) {
                header('HTTP/1.1 401 Authorization Required');
                header('WWW-Authenticate: Basic realm="Access denied"');
                echo('Доступ в интерфейс администратора запрещен');
                exit;
            }
        }
    }

?>