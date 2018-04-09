<?php

    require_once('app/auth.php');

    $auth = new AuthUtility();
    $auth->Auth();

    echo('WELCOME TO PERSIST');

?>