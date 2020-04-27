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

	function BuildCSV($headers, $records) {
		// we use a threshold of 1 MB (1024 * 1024), it's just an example
		$fd = fopen('php://temp/maxmemory:1048576', 'w');
		if($fd === FALSE) {
			die('Failed to open temporary file');
		}

		fputs($fd, "Sep=;\r\n");
		fputcsv($fd, $headers, ";");
		foreach($records as $record) {
			fputcsv($fd, $record, ";");
		}

		rewind($fd);
		$csv = stream_get_contents($fd);
		$config = include('config.php');
		$target_encoding = $config['REPORT_CHARSET'];
		$csv = iconv("UTF-8", $target_encoding, $csv);
		fclose($fd); // releases the memory (or tempfile)
		return $csv;
	}

	$method = $_SERVER['REQUEST_METHOD'];
	if ($method == 'GET') {
		// $action = $_GET['action'];
		$entityType = $_GET['entityType'];
		$repo = GetRepository($entityType);
		$params = $repo->BuildReportParamsModel($_GET);
		
		if ($params) {
			$data = $repo->ReadReport($params);

			if ($data) {
				$headers = $repo->GetCSVReportHeader();
				$lines = array();
				foreach ($data as $rec) {
					$line = $repo->GetCSVReportLine($rec);
					array_push($lines, $line);
				}
				$result = BuildCSV($headers, $lines);
				$filename = $repo->GetCSVReportName($params, $timezone);

				header('Content-Description: File Transfer');
				header('Content-Type: text/csv');
				header('Content-Disposition: attachment; filename="' . $filename . '"');
				header('Expires: 0');
				header('Cache-Control: must-revalidate');
				header('Pragma: public');
				header('Content-Length: ' . strlen($result));
				echo $result;
			} else {
				$response = array('success' => false, 'message' => "Unknown error");
				echo json_encode($response);
			}
		} else {
			$response = array('success' => false, 'message' => "Can't build params model");
			echo json_encode($response);
		}
	} else {
		$response = array('success' => false, 'message' => "Method {$method} not supported");
		echo json_encode($response);
	}

?>