<?php

    require_once('app/auth.php');
	require_once('app/registrations.php');

    $auth = new AuthUtility();
    $auth->Auth();

	$timezone = new DateTimeZone('Europe/Moscow');

	function GetRepository($entityType) {
		if ($entityType == "REGISTRATION") {
			return new RegistrationRepository();
		}
	}

	function return_file($content, $filename) {
		header('Content-Description: File Transfer');
		header('Content-Type: text/csv');
		header('Content-Disposition: attachment; filename="' . $filename . '"');
		header('Expires: 0');
		header('Cache-Control: must-revalidate');
		header('Pragma: public');
		header('Content-Length: ' . strlen($content));
		echo $content;
	}

	$method = $_SERVER['REQUEST_METHOD'];
	if ($method == 'GET') {
		// $action = $_GET['action'];
		$entityType = $_GET['entityType'];
		$repo = GetRepository($entityType);
		$params = $repo->BuildReportParamsModel($_GET);
		if ($params) {
			$content = $repo->BuildReport($params);
			$filename = $repo->GetCSVReportName($params, $timezone);
			return_file($content, $filename);
		} else {
			$response = array('success' => false, 'message' => "Can't build params model");
			echo json_encode($response);
		}
	} else {
		$response = array('success' => false, 'message' => "Method {$method} not supported");
		echo json_encode($response);
	}

?>