<?php

    require_once('app/auth.php');
	require_once('app/games.php');
	require_once('app/cities.php');
	require_once('app/feedbacks.php');
	require_once('app/questions.php');
	require_once('app/settings.php');
	require_once('app/photos.php');
	require_once('app/colors.php');
	require_once('libs/smarty/Smarty.class.php');

    $auth = new AuthUtility();
    $auth->Auth();

	$timezone = new DateTimeZone('Europe/Moscow');

    $smarty = new Smarty();
    
	$smarty->template_dir = 'templates/';
	$smarty->compile_dir = 'libs/smarty/templates_c/';
	$smarty->config_dir = 'libs/smarty/configs/';
    $smarty->cache_dir = 'libs/smarty/cache/';
	
	$settingRepo = new SettingRepository();
	$settings = $settingRepo->Read();
	$smarty->assign('SETTING_LIST', $settings);

	$gameRepo = new GameRepository();
	$games = $gameRepo->Read($timezone);
	$smarty->assign('GAME_LIST', $games);

	$cityRepo = new CityRepository();
	$cities = $cityRepo->Read();
	$smarty->assign('CITY_LIST', $cities);

	$feedbackRepo = new FeedbackRepository();
	$feedbacks = $feedbackRepo->Read();
	$smarty->assign('FEEDBACK_LIST', $feedbacks);

	$questionRepo = new QuestionRepository();
	$questions = $questionRepo->Read();
	$smarty->assign('QUESTION_LIST', $questions);

	$photoRepo = new PhotoRepository();
	$photos = $photoRepo->Read();
	$smarty->assign('PHOTO_LIST', $photos);
	
	$colorRepo = new ColorRepository();
	$colors = $colorRepo->Read();
	$smarty->assign('COLOR_LIST', $colors);

	/*$smarty->assign('GAME_LIST', $game_list);
	$smarty->assign('ADDRESS_LIST', $address_list);
	$smarty->assign('CITY_LIST', $city_list);

    $smarty->assign('PHOTO_LIST', $photo_list);
    $smarty->assign('QUESTION_LIST', $question_list);
    $smarty->assign('FEEDBACK_LIST', $feedback_list);
    
    $smarty->assign('SETTING_LIST', $setting_list);*/
    
	//** раскомментируйте следующую строку для отображения отладочной консоли
	//$smarty->debugging = true;

	$smarty->display('admin.tpl');

?>