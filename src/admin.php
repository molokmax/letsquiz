<?php

    require_once('app/auth.php');
	require_once('app/games.php');
	require_once('app/cities.php');
	require_once('app/places.php');
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

	foreach ($settings as $item) {
		$smarty->assign('SETTING_' . $item->prefix, $item->value);
	}

	$gameRepo = new GameRepository();
	$games = $gameRepo->Read($timezone);
	$smarty->assign('GAME_LIST', $games);

	$cityRepo = new CityRepository();
	$cities = $cityRepo->Read();
	$smarty->assign('CITY_LIST', $cities);

	$placeRepo = new PlaceRepository();
	$places = $placeRepo->GetAll();
	$smarty->assign('PLACE_LIST', $places);

	$photoRepo = new PhotoRepository();
	$photos = $photoRepo->Read();
	$smarty->assign('PHOTO_LIST', $photos);
	
	$colorRepo = new ColorRepository();
	$colors = $colorRepo->Read();
	$smarty->assign('COLOR_LIST', $colors);
    
	//** раскомментируйте следующую строку для отображения отладочной консоли
	//$smarty->debugging = true;

	$smarty->display('admin.tpl');

?>