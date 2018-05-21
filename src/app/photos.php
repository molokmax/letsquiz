<?php

    class PhotoModel {
        public $id;
        public $url;
        public $order;
    }

    class PhotoRepository {

        private $photoDir = 'photo';

        private function GetPhotoServerPath() {
            list($scriptPath) = get_included_files();
            $rootPath = dirname($scriptPath);
            $result = $rootPath . '/' . $this->photoDir;
            return $result;
        }

        private function GetUploadFileName($file) {
            $uploadDir = $this->GetPhotoServerPath();
            $ext = pathinfo(basename($file['name']), PATHINFO_EXTENSION);
            $prefix = basename(tempnam($uploadDir, ''));
            $uploadFile = tempnam($uploadDir, $prefix) . '.' . $ext;
            return $uploadFile;
        }
        
        public function BuildModel($data) {
            $rec = new PhotoModel();
            $rec->id = $data['id'];
            $rec->order = $data['order'];
            if ($_FILES['url']) {
                $uploadfile = $this->GetUploadFileName($_FILES['url']);
                //print($uploadfile);
                if (move_uploaded_file($_FILES['url']['tmp_name'], $uploadfile)) {
                    $rec->url = $this->photoDir . '/' . basename($uploadfile);
                } else {
                    return null;
                }
            }
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
            $url_param = mysql_escape_string($record->url);
            $order_param = mysql_escape_string($record->order);
            
            $query = "INSERT INTO `photo` (`url`, `order`) VALUES ('{$url_param}', {$order_param})";
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
            $url_param = mysql_escape_string($record->url);
            $order_param = mysql_escape_string($record->order);
            
            $sql_with_url = "UPDATE `photo` SET `url` = '{$url_param}', `order` = '{$order_param}' WHERE `id` = {$id_param}";
            $sql_without_url = "UPDATE `photo` SET `order` = '{$order_param}' WHERE `id` = {$id_param}";
            $query = $url_param ? $sql_with_url : $sql_without_url;
            //print($query);
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
            $query = "DELETE FROM `photo` WHERE `id` = {$id_param}";
	        $db_result = mysql_query($query);
            if (!$db_result) {
                print($query . "\n");
                print(mysql_errno($con) . ": " . mysql_error($con) . "\n");
            }

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
	
	        $query = 'SELECT `id`, `url`, `order` FROM `photo` ORDER BY  `order`';
	        $db_result = mysql_query($query);
            if ($db_result) {
                while($row = mysql_fetch_array($db_result)) {
                    $rec = new PhotoModel();
                    $rec->id = $row['id'];
                    $rec->url = $row['url'];
                    $rec->order = $row['order'];
                    array_push($result, $rec);
                }
            }

            mysql_close($con);

            return $result;
        }

        public function GetAll() {
            $config = include('config.php');
            $result = array();

            $con = mysql_connect($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysql_error());
            }

            mysql_set_charset($config['DB_CONFIG_CHARSET'], $con);
	        mysql_select_db($config['DB_CONFIG_DATABASENAME'], $con);
	
	        $query = 'SELECT `id`, `url`, `order` FROM `photo` ORDER BY  `order`';
	        $db_result = mysql_query($query);
            if ($db_result) {
                while($row = mysql_fetch_array($db_result)) {
                    array_push($result, $row['url']);
                }
            }

            mysql_close($con);

            return $result;
        }
    }

?>