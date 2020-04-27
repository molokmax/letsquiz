
INSERT INTO `setting` (`id`, `name`, `prefix`, `type`, `value`) VALUES (12, 'Стоимость игры по умолчанию', 'DEFAULT_GAME_PRICE', 'string', '300 руб/чел');

ALTER TABLE game ADD COLUMN `price` varchar(50);

UPDATE game set `price` = '300';
UPDATE game set `price` = '500/1000' where `city_id` in (select `id` from `city` where `name` = 'Онлайн');


ALTER TABLE game MODIFY `price` varchar(50) NOT NULL;

