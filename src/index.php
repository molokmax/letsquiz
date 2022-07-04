<?php

	require_once('app/settings.php');
	require_once('app/photos.php');
	require_once('app/games.php');
	require_once('app/cities.php');
	require_once('app/colors.php');
	require_once('libs/smarty/Smarty.class.php');

	$timezone = new DateTimeZone('Europe/Moscow');

	$smarty = new Smarty();

	$smarty->template_dir = 'templates/';
	$smarty->compile_dir = 'libs/smarty/templates_c/';
	$smarty->config_dir = 'libs/smarty/configs/';
	$smarty->cache_dir = 'libs/smarty/cache/';
	
		
	$settingRepo = new SettingRepository();
	$settings = $settingRepo->Read();

	$photo_take = 4;
	$game_take = 8;
	$game_close_hours = 4;
	foreach ($settings as $item) {
		$smarty->assign('SETTING_' . $item->prefix, $item->value);

		if ($item->prefix == 'GAME_TAKE') {
			$game_take = (int) $item->value;
		} else if ($item->prefix == 'GAME_CLOSE') {
			$game_close_hours = (int) $item->value;
		} else if ($item->prefix == 'PHOTO_TAKE') {
			$photo_take = (int) $item->value;
		}
	}

	$photoRepo = new PhotoRepository();
	$photos_all = $photoRepo->GetAll(0);
	$photo_count = count($photos_all);
	$photos = array();
	if ($photo_take >= $photo_count) {
		$photos = $photos_all;
	} else {
		$indexes = array();
		while (count($indexes) < $photo_take) {
			$index = rand(0, $photo_count-1);
			if (!in_array($index, $indexes)) {
				array_push($indexes, $index);
			}
		}
		foreach ($indexes as $i) {
			$photo = $photos_all[$i];
			array_push($photos, $photo);
		}
	}
	$smarty->assign('PHOTO_LIST', $photos);

	$cityRepo = new CityRepository();
	$cities = $cityRepo->GetAll();
	$smarty->assign('CITY_LIST', $cities);

	$colorRepo = new ColorRepository();
	$colors = $colorRepo->Read();

	$formatter = new GameFormatter();
	$gameRepo = new GameRepository();
	$games = $gameRepo->GetActive($game_close_hours, $game_take, $timezone);
	$game_list = array();
	foreach ($games as $item) {
		$rec = new GameViewModel($item, $formatter, $colors);
        array_push($game_list, $rec);
	}
	$smarty->assign('GAME_LIST', $game_list);

	//** раскомментируйте следующую строку для отображения отладочной консоли
	//$smarty->debugging = true;

	$smarty->display('index.tpl');
	
?>
