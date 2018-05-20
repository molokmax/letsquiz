<?php

    require_once('app/auth.php');
	require_once('app/games.php');
	require_once('app/feedbacks.php');
	require_once('app/questions.php');
	require_once('app/settings.php');

    $auth = new AuthUtility();
    $auth->Auth();

	$timezone = new DateTimeZone('Europe/Moscow');

	function GetRepository($entityType) {
		if ($entityType == "GAME") {
			return new GameRepository();
		} else if ($entityType == "FEEDBACK") {
			return new FeedbackRepository();
		} else if ($entityType == "QUESTION") {
			return new QuestionRepository();
		} else if ($entityType == "SETTING") {
			return new SettingRepository();
		}
	}

	function DoAction($data, $action, $repo) {
		$result = false;
		if ($action == 'delete') {
			//print('del');
			$result = $repo->Delete($data);
		} else if ($action == 'update') {
			//print('upd');
			$result = $repo->Update($data);
		} else if ($action == 'create') {
			//print('cre');
			$result = $repo->Create($data);
		}
		return $result;
	}

	$method = $_SERVER['REQUEST_METHOD'];
	if ($method == 'POST') {
		$action = $_POST['action'];
		$entityType = $_POST['entityType'];
		$repo = GetRepository($entityType);
		$data = $repo->BuildModel($_POST);
		//print_r($data);
		$result = DoAction($data, $action, $repo);
		if ($result) {
			$response = array('success' => true);
			echo json_encode($response);
		} else {
			$response = array('success' => false, 'message' => "Unknown error");
			echo json_encode($response);
		}
	} else {
		$response = array('success' => false, 'message' => "Method {$method} not supported");
		echo json_encode($response);
	}

?>