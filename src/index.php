<?php

	require_once('app/settings.php');
	require_once('app/photos.php');
	require_once('app/questions.php');
	require_once('app/feedbacks.php');
	require_once('app/games.php');
	require_once('app/cities.php');
	require_once('app/addresses.php');
	require_once('libs/smarty/Smarty.class.php');

	$timezone = new DateTimeZone('Europe/Moscow');

	$smarty = new Smarty();

	$smarty->template_dir = 'templates/';
	$smarty->compile_dir = 'libs/smarty/templates_c/';
	$smarty->config_dir = 'libs/smarty/configs/';
	$smarty->cache_dir = 'libs/smarty/cache/';
	
		
	$settingRepo = new SettingRepository();
	$settings = $settingRepo->GetAll();

	$game_take = 8;
	$game_close_hourse = 4;
	foreach ($settings as $item) {
		$smarty->assign('SETTING_' . $item->prefix, $item->value);

		if ($item->prefix == 'GAME_TAKE') {
			$game_take = (int) $item->value;
		} else if ($item->prefix == 'GAME_CLOSE') {
			$game_close_hourse = (int) $item->value;
		}
	}

	$photoRepo = new PhotoRepository();
	$photos = $photoRepo->GetAll();
	$smarty->assign('PHOTO_LIST', $photos);

	$questionRepo = new QuestionRepository();
	$questions = $questionRepo->Read();
	$smarty->assign('QUESTION_LIST', $questions);

	$feedbackRepo = new FeedbackRepository();
	$feedbacks = $feedbackRepo->Read();
	$smarty->assign('FEEDBACK_LIST', $feedbacks);

	$cityRepo = new CityRepository();
	$cities = $cityRepo->GetAll();
	$smarty->assign('CITY_LIST', $cities);

	$addressRepo = new AddressRepository();
	$addresses = $addressRepo->GetAll();
	$smarty->assign('ADDRESS_LIST', $addresses);

	$formatter = new GameFormatter();
	$date = new DateTime('now', $timezone);
	$date->add(new DateInterval("PT{$game_close_hourse}H"));
	$gameRepo = new GameRepository();
	$games = $gameRepo->GetAfterDate($date, $game_take, $timezone);
	$game_list = array();
	$first_game_found = false;
	foreach ($games as $item) {
		$rec = new GameViewModel($item, $formatter);
        array_push($game_list, $rec);
		if (!$first_game_found) {
			$first_game_found = true;
			$smarty->assign('NEXT_GAME', $formatter->getGameDate($item->date));
		}
	}

	$smarty->assign('GAME_LIST', $game_list);

	//** раскомментируйте следующую строку для отображения отладочной консоли
	//$smarty->debugging = true;

	$smarty->display('index.tpl');
	
?>
