
INSERT INTO `setting` (`id`, `name`, `prefix`, `type`, `value`) VALUES (12, 'Стоимость игры по умолчанию', 'DEFAULT_GAME_PRICE', 'int', '300');

ALTER TABLE game ADD COLUMN `price` int(11) DEFAULT NULL;

UPDATE game set `price` = 300;

ALTER TABLE game MODIFY `price` int(11) NOT NULL;

