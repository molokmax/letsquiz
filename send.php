<?php

    require_once('app/notifications.php');

    if ($_SERVER['REQUEST_METHOD'] != 'POST') {
        $answer = array(
            "success" => false, 
            "message" => "Метод не поддерживается"
        );
        echo(json_encode($answer));
    } else {

        $notify_type = $_POST['NotifyType'];

        $messageFactory = new MessageFactory();
        $model = $messageFactory->buildModel($notify_type, $_POST);
        if ($model == NULL) {
            $answer = array(
                "success" => false, 
                "message" => "Не удалось создать модель для типа оповещения '$notify_type'"
            );
            echo(json_encode($answer));
        } else {
            $message = $messageFactory->buildMessage($notify_type, $model);
            $sender = new Sender();
            $result = $sender->send($message);
            if ($result) {
                $answer = array(
                    "success" => true, 
                    "message" => "Запрос отправлен"
                );
                echo(json_encode($answer));
            } else {
                $answer = array(
                    "success" => false, 
                    "message" => "Не удалось отправить запрос"
                );
                echo(json_encode($answer));
            }
        }
    }

?>