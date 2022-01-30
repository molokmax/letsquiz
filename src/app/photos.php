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

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }

            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
    
            //$id_param = mysqli_escape_string($con, $record->id);
            $url_param = mysqli_escape_string($con, $record->url);
            $order_param = mysqli_escape_string($con, $record->order);
            
            $query = "INSERT INTO `photo` (`url`, `order`) VALUES ('{$url_param}', {$order_param})";
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
    
            $id_param = mysqli_escape_string($con, $record->id);
            $url_param = mysqli_escape_string($con, $record->url);
            $order_param = mysqli_escape_string($con, $record->order);
            
            $sql_with_url = "UPDATE `photo` SET `url` = '{$url_param}', `order` = '{$order_param}' WHERE `id` = {$id_param}";
            $sql_without_url = "UPDATE `photo` SET `order` = '{$order_param}' WHERE `id` = {$id_param}";
            $query = $url_param ? $sql_with_url : $sql_without_url;
            //print($query);
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
    
            $id_param = mysqli_escape_string($con, $record->id);
            $query = "DELETE FROM `photo` WHERE `id` = {$id_param}";
	        $db_result = mysqli_query($con, $query);
            if (!$db_result) {
                print($query . "\n");
                print(mysqli_errno($con) . ": " . mysqli_error($con) . "\n");
            }

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
	
	        $query = 'SELECT `id`, `url`, `order` FROM `photo` ORDER BY  `order`';
	        $db_result = mysqli_query($con, $query);
            if ($db_result) {
                while($row = mysqli_fetch_array($db_result)) {
                    $rec = new PhotoModel();
                    $rec->id = $row['id'];
                    $rec->url = $row['url'];
                    $rec->order = $row['order'];
                    array_push($result, $rec);
                }
            }

            mysqli_close($con);

            return $result;
        }

        public function GetAll($limit) {
            $config = include('config.php');
            $result = array();

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }

            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
	
            $query = "SELECT `id`, `url`, `order` FROM `photo` ORDER BY  `order`";
            if ($limit > 0) {
                $query .= " LIMIT 0, $limit";
            }
	        $db_result = mysqli_query($con, $query);
            if ($db_result) {
                while($row = mysqli_fetch_array($db_result)) {
                    // print($row['url']);
                    array_push($result, $row['url']);
                }
            }

            mysqli_close($con);

            return $result;
        }
    }

?>