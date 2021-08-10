
INSERT INTO `setting` (`id`, `name`, `prefix`, `type`, `value`) VALUES (14, 'Количество фотографий для отображения', 'PHOTO_TAKE', 'int', '4');
INSERT INTO `setting` (`id`, `name`, `prefix`, `type`, `value`) VALUES (15, 'Скрыть раздел "Контакты"', 'HIDE_FOOTER', 'bool', 'false');

delete from `setting` where `prefix` = 'HIDE_FRIENDS';
delete from `setting` where `prefix` = 'HIDE_FEEDBACK';

update `setting` set `value` = '300' where `prefix` = 'DEFAULT_GAME_PRICE';