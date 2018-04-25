<?php

    require_once('app/auth.php');
	require_once('app/games.php');

    $auth = new AuthUtility();
    $auth->Auth();

	$timezone = new DateTimeZone('Europe/Moscow');

	$method = $_SERVER['REQUEST_METHOD'];
	if ($method == 'POST') {
		$action = $_POST['action'];
		$entityType = $_POST['entityType'];
		//print($action); 
		print_r($_POST);
		$gameRepo = new GameRepository();
		//$games = $gameRepo->Update();
	} else {

	}

?>