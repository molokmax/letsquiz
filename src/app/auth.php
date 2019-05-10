<?php

    class AuthUtility {

        function IsValid($user, $pass) {
            $config = include('config.php');
            $result = array();

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }

            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);

            $user_param = mysqli_escape_string($user);
            $pass_param = mysqli_escape_string($pass);
            $query = "SELECT count(*) AS `cnt` FROM `user` WHERE `name` = '{$user_param}' AND `pass` = PASSWORD('{$pass_param}') AND `is_locked` = 0";
            
	        $db_result = mysqli_query($con, $query);
            $count = mysqli_fetch_object($db_result)->cnt;

            mysqli_close($con);

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