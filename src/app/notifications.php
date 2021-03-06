<?php

    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;

    require_once('libs/PHPMailer/Exception.php');
    require_once('libs/PHPMailer/PHPMailer.php');
    require_once('libs/PHPMailer/SMTP.php');

    require_once('registrations.php');

    class RegistrationNotifyModel {
        public $game_id;
        public $game_city;
        public $game_cityid;
        public $game_date;
        public $team_name;
        public $team_count;
        public $team_leader;
        public $team_phone;
        public $team_email;
    }
    class CallbackNotifyModel {
        public $name;
        public $phone;
    }
    class CertificateNotifyModel {
        public $name;
        public $phone;
    }

    class NotifyModel {
        public $id;
        public $type;
        public $city_id;
        public $email;
    }
    
    class Message {
        public $to;
        public $from;
        public $subject;
        public $body;
    }

    class MessageFactory {

        private $NOTIFY_TYPES = array(
            'REG' => 'REGISTRATION',
            'CALL' => 'CALLBACK',
            'CERT' => 'CERTIFICATE'
        );

        private $SUBJECTS = array(
            'REGISTRATION' => 'Регистрация на игру',
            'CALLBACK' => 'Обратный знонок',
            'CERTIFICATE' => 'Сертификат'
        );

        public function buildModel($notify_type, $params) {
            if ($notify_type == $this->NOTIFY_TYPES['REG']) {
                $result = new RegistrationNotifyModel();
                $result->game_id = $params["GameId"];
                $result->game_city = $params["City"];
                $result->game_cityid = $params["CityId"];
                $result->game_date = $params["Date"];
                $result->team_name = $params["TeamName"];
                $result->team_count = $params["Count"];
                $result->team_leader = $params["Leader"];
                $result->team_phone = $params["Phone"];
                $result->team_email = $params["Email"];
                return $result;
            } else if ($notify_type == $this->NOTIFY_TYPES['CALL']) {
                $result = new CallbackNotifyModel();
                $result->name = $params["Name"];
                $result->phone = $params["Phone"];
                return $result;
            } else if ($notify_type == $this->NOTIFY_TYPES['CERT']) {
                $result = new CertificateNotifyModel();
                $result->name = $params["Name"];
                $result->phone = $params["Phone"];
                return $result;
            } else {
                return NULL;
            }
        }

        public function handleEvent($notify_type, $model) {
            if ($notify_type == $this->NOTIFY_TYPES['REG']) {
                $timezone = new DateTimeZone('Europe/Moscow');

                $regRepo = new RegistrationRepository();
                $reg = new RegistrationModel();
                $reg->game_id = $model->game_id;
                $date = new DateTime('NOW', $timezone);
                $reg->date = $date->format('Y-m-d H:i:s');
                $reg->team_name = $model->team_name;
                $reg->team_count = $model->team_count;
                $reg->leader_name = $model->team_leader;
                $reg->phone = $model->team_phone;
                $reg->email = $model->team_email;
                $regRepo->Create($reg);
            }
        }

        public function buildMessage($notify_type, $model) {

            $config = include('config.php');
            
            $result = new Message();
            $result->to = $this->getToAddress($notify_type, $model);
            $result->from = $config['MAIL_FROM_ADDRESS'];
            $result->subject = "Новая заявка с сайта Let's quiz";
            $result->body = $this->formatMessage($notify_type, $model);
            return $result;
        }

        public function getToAddress($notify_type, $model) {
            $config = include('config.php');

            $notifyRepo = new NotifyRepository();
            $email = $notifyRepo->GetEmail($notify_type, $model->game_cityid);
            if ($email) {
                return $email;
            } else {
                return $config['MAIL_TO_ADDRESS'];
            }
        }

        private function formatData($notify_type, $model) {
            // TODO: move message text to resources
            if ($notify_type == $this->NOTIFY_TYPES['REG']) {
                return "
                <p>
                    <b>Город</b>: <i>".htmlspecialchars($model->game_city)."</i>
                </p>
                <p>
                    <b>Дата и время</b>: <i>".htmlspecialchars($model->game_date)."</i>
                </p>
                <p>
                    <b>Название команды</b>: <i>".htmlspecialchars($model->team_name)."</i>
                </p>
                <p>
                    <b>Количество человек</b>: <i>".htmlspecialchars($model->team_count)."</i>
                </p>
                <p>
                    <b>Капитан</b>: <i>".htmlspecialchars($model->team_leader)."</i>
                </p>
                <p>
                    <b>Телефон</b>: <i>".htmlspecialchars($model->team_phone)."</i>
                </p>
                <p>
                    <b>Email</b>: <i>".htmlspecialchars($model->team_email)."</i>
                </p>";
            } else if ($notify_type == $this->NOTIFY_TYPES['CALL']) {
                return "
                <p>
                    <b>Имя</b>: <i>".htmlspecialchars($model->name)."</i>
                </p>
                <p>
                    <b>Телефон</b>: <i>".htmlspecialchars($model->phone)."</i>
                </p>";
            } else if ($notify_type == $this->NOTIFY_TYPES['CERT']) {
                return "
                <p>
                    <b>Имя</b>: <i>".htmlspecialchars($model->name)."</i>
                </p>
                <p>
                    <b>Телефон</b>: <i>".htmlspecialchars($model->phone)."</i>
                </p>";
            } else {
                return "";
            }
        }

        private function formatMessage($notify_type, $model) {
            $subject = $this->SUBJECTS[$notify_type];
            $data_text = $this->formatData($notify_type, $model);
            $text = "
                <html>
                    <head>
                        <meta charset=\"UTF-8\">
                        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />
                        <title>Заявка с сайта Let's quiz</title>
                    </head>
                <body>
                    <p>
                        С сайта \"LET'S QUIZ\" поступила новая заявка!
                    </p>
                    <p>
                        <b>Тип заявки</b>: <i>$subject</i>
                    </p>
                    $data_text
                </body>
                </html>";
            return wordwrap($text, 70, "\r\n");
        }
    }

    
    class NotifyRepository {

        
        public function BuildModel($data) {
            $rec = new NotifyModel();
            $rec->id = $data['id'];
            $rec->type = $data['type'];
            $rec->city_id = $data['city_id'];
            $rec->email = $data['email'];
            return $rec;
        }

        public function GetAll() {
            $config = include('config.php');
            $result = array();

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }
            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
	
	        $query = 'SELECT `id`, `type`, `city_id`, `email` FROM `notify` ORDER BY `id`';
	        $db_result = mysqli_query($con, $query);
            if ($db_result) {
                while($row = mysqli_fetch_array($db_result)) {
                    $rec = new NotifyModel();
                    $rec->id = $row['id'];
                    $rec->type = $row['type'];
                    $rec->city_id = $row['city_id'];
                    $rec->email = $row['email'];
                    array_push($result, $rec);
                }
            }

            mysqli_close($con);

            return $result;
        }

        public function GetEmail($notifyType, $cityId) {
            $config = include('config.php');
            $result = '';

            $con = new mysqli($config['DB_CONFIG_HOSTNAME'], $config['DB_CONFIG_USERNAME'], $config['DB_CONFIG_PASSWORD']);

            if (!$con) {
                die('Db connect error: ' . mysqli_error());
            }
            mysqli_set_charset($con, $config['DB_CONFIG_CHARSET']);
	        mysqli_select_db($con, $config['DB_CONFIG_DATABASENAME']);
	
            $query = "SELECT `id`, `type`, `city_id`, `email` FROM `notify` WHERE (`type` IS NULL OR `type` = '$notifyType') AND (`city_id` IS NULL OR `city_id` = $cityId) ORDER BY `type` DESC, `city_id` DESC LIMIT 1";
	        $db_result = mysqli_query($con, $query);
            if ($db_result) {
                if($row = mysqli_fetch_array($db_result)) {
                    $result = $row['email'];
                }
            }

            mysqli_close($con);

            return $result;
        }
    }


    class Sender {

        public function send($message) {
            $config = include('config.php');
            $send_method = $config['MAIL_SEND_METHOD'];
            if ($send_method == 'PHP') {
                return $this->sendByPHP($message);
            } else if ($send_method == 'SMTP') {
                return $this->sendBySMTP($message);
            } else {
                return false;
            }
        }

        private function sendByPHP($message) {
            if ($message->to) {
                $headers = array(); 
                $headers[] = "MIME-Version: 1.0"; 
                $headers[] = "Content-type: text/html; charset=utf-8"; 
                $headers[] = "From: Lets's quiz site <" . $message->from . ">";
                $headers[] = "Subject: {$message->subject}"; 
                $headers[] = "X-Mailer: PHP/".phpversion();
                // print_r($message);
                // return true;
                return mail($message->to, $message->subject, $message->body, implode("\r\n", $headers));
            } else {
                return true;
            }
        }

        private function sendBySMTP($message) {
            $config = include('config.php');
            $host = $config['MAIL_SMTP_HOST'];
            $port = $config['MAIL_SMTP_PORT'];
            $user = $config['MAIL_SMTP_USERNAME'];
            $pass = $config['MAIL_SMTP_PASSWORD'];

            // Instantiation and passing `true` enables exceptions
            $mail = new PHPMailer(true);

            try {
                //Server settings
                $mail->CharSet = 'UTF-8';
 
                // Настройки SMTP
                $mail->isSMTP();
                $mail->SMTPAuth = true;
                $mail->SMTPDebug = 0;

                $mail->Host       = $host;                    // Set the SMTP server to send through
                $mail->Username   = $user;                     // SMTP username
                $mail->Password   = $pass;                               // SMTP password
                $mail->Port       = $port;                                    // TCP port to connect to, use 465 for `PHPMailer::ENCRYPTION_SMTPS` above
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;         // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` encouraged

                //Recipients
                $mail->setFrom($message->from, 'Lets Quiz');
                $mail->addAddress($message->to);

                // Content
                $mail->isHTML(true);                                  // Set email format to HTML
                $mail->Subject = $message->subject;
                $mail->Body    = $message->body;

                return $mail->send();
            } catch (Exception $e) {
                // TODO: log error - echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
                // echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
                return false;
            }
        }
    }
?>