<?php

    class RegistrationModel {
        public $game_city;
        public $game_date;
        public $team_name;
        public $team_count;
        public $team_leader;
        public $team_phone;
    }
    class CallbackModel {
        public $name;
        public $phone;
    }
    class CertificateModel {
        public $name;
        public $phone;
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
                $result = new RegistrationModel();
                $result->game_city = $params["City"];
                $result->game_date = $params["Date"];
                $result->team_name = $params["TeamName"];
                $result->team_count = $params["Count"];
                $result->team_leader = $params["Leader"];
                $result->team_phone = $params["Phone"];
                return $result;
            } else if ($notify_type == $this->NOTIFY_TYPES['CALL']) {
                $result = new CallbackModel();
                $result->name = $params["Name"];
                $result->phone = $params["Phone"];
                return $result;
            } else if ($notify_type == $this->NOTIFY_TYPES['CERT']) {
                $result = new CertificateModel();
                $result->name = $params["Name"];
                $result->phone = $params["Phone"];
                return $result;
            } else {
                return NULL;
            }
        }

        public function buildMessage($notify_type, $model) {

            $config = include('config.php');
            
            $result = new Message();
            $result->to = getToAddress($notify_type, $model)
            $result->from = $config['MAIL_FROM_ADDRESS'];
            $result->subject = "Новая заявка с сайта Let's quiz";
            $result->body = $this->formatMessage($notify_type, $model);
            return $result;
        }

        public function getToAddress($notify_type, $model) {
            $config = include('config.php');

            if ($notify_type == $this->NOTIFY_TYPES['REG'] && $model->game_city == "Москва") {
                $config['MAIL_TO_ADDRESS_BUTOVO']
            } else {
                $config['MAIL_TO_ADDRESS']
            }
        }

        private function formatData($notify_type, $model) {
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

    class Sender {

        public function send($message) {
            $config = include('config.php');
            $send_method = $config['MAIL_SEND_METHOD'];
            if ($send_method == 'PHP') {
                return $this->sendByPHP($message);
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
                //print_r($message);
                return mail($message->to, $message->subject, $message->body, implode("\r\n", $headers));
            } else {
                return true;
            }
        }
    }

?>