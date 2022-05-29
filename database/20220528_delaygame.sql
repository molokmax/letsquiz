ALTER TABLE `game` ADD COLUMN `open_date` datetime NULL AFTER `date`;

update `setting` set `name` = 'Закрывать регистрацию после N часов от начала игры' where `prefix` = 'GAME_CLOSE';
