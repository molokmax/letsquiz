<?php

	require_once('app/settings.php');
	require_once('app/photos.php');
	require_once('libs/smarty/Smarty.class.php');
	$smarty = new Smarty();

	$smarty->template_dir = 'templates/';
	$smarty->compile_dir = 'libs/smarty/templates_c/';
	$smarty->config_dir = 'libs/smarty/configs/';
	$smarty->cache_dir = 'libs/smarty/cache/';
	
		
	$settingRepo = new SettingRepository();
	$settingStore = $settingRepo->GetAll();

	foreach ($settingStore as $item) {
		$smarty->assign('SETTING_' . $item->prefix, $item->value);
	}

	$photoRepo = new PhotoRepository();
	$photos = $photoRepo->GetAll();
	$smarty->assign('PHOTO_LIST', $photos);

	//** раскомментируйте следующую строку для отображения отладочной консоли
	//$smarty->debugging = true;

	$smarty->display('index.tpl');
	
?>
