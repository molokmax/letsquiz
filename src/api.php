<?php

    require_once('app/auth.php');
	require_once('app/games.php');
	require_once('app/settings.php');
	require_once('app/photos.php');

    $auth = new AuthUtility();
    $auth->Auth();

	$timezone = new DateTimeZone('Europe/Moscow');

	function GetRepository($entityType) {
		if ($entityType == "GAME") {
			return new GameRepository();
		} else if ($entityType == "SETTING") {
			return new SettingRepository();
		} else if ($entityType == "PHOTO") {
			return new PhotoRepository();
		}
	}

	function DoAction($data, $action, $repo) {
		$result = false;
		if ($action == 'delete') {
			$result = $repo->Delete($data);
		} else if ($action == 'update') {
			$result = $repo->Update($data);
		} else if ($action == 'create') {
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
		
		if ($data) {
			$result = DoAction($data, $action, $repo);
			if ($result) {
				$response = array('success' => true);
				echo json_encode($response);
			} else {
				$response = array('success' => false, 'message' => "Unknown error");
				echo json_encode($response);
			}
		} else {
			$response = array('success' => false, 'message' => "Can't build data model");
			echo json_encode($response);
		}
	} else {
		$response = array('success' => false, 'message' => "Method {$method} not supported");
		echo json_encode($response);
	}

?>