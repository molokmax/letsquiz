
INSERT INTO `setting` (`id`, `name`, `prefix`, `type`, `value`) VALUES (14, 'Количество фотографий для отображения', 'PHOTO_TAKE', 'int', '4');
INSERT INTO `setting` (`id`, `name`, `prefix`, `type`, `value`) VALUES (15, 'Скрыть раздел "Контакты"', 'HIDE_FOOTER', 'bool', 'false');
INSERT INTO `setting` (`id`, `name`, `prefix`, `type`, `value`) VALUES (16, 'Активировать Yandex.Metrika', 'METRIKA_ENABLED', 'bool', 'false');

delete from `setting` where `prefix` = 'HIDE_FRIENDS';
delete from `setting` where `prefix` = 'HIDE_FEEDBACK';

update `setting` set `value` = '400' where `prefix` = 'DEFAULT_GAME_PRICE';
update `setting` set `value` = '9' where `prefix` = 'GAME_TAKE';
update `setting` set `value` = '+7 916 451 44 81' where `prefix` = 'PHONE';
update `setting` set `value` = 'false' where `prefix` = 'HIDE_CORP';




delete from `photo`;

INSERT INTO photo (id,url,`order`) VALUES 
(1,'photo/IMG_4902.jpg',1)
,(2,'photo/IMG_4910.jpg',2)
,(3,'photo/IMG_4911.jpg',3)
,(4,'photo/IMG_4913.jpg',4)
,(5,'photo/IMG_4914.jpg',5)
,(6,'photo/IMG_4916.jpg',6)
,(7,'photo/IMG_4917.jpg',7)
,(8,'photo/IMG_4918.jpg',8)
,(9,'photo/IMG_4920.jpg',9)
,(10,'photo/IMG_4921.jpg',10)
,(11,'photo/IMG_4922.jpg',11)
;
INSERT INTO photo (id,url,`order`) VALUES 
(12,'photo/IMG_4923.jpg',12)
,(13,'photo/IMG_4924.jpg',13)
,(14,'photo/IMG_4925.jpg',14)
,(15,'photo/IMG_4927.jpg',15)
,(16,'photo/IMG_4932.jpg',16)
,(17,'photo/IMG_4933.jpg',17)
,(18,'photo/IMG_4940.jpg',18)
,(19,'photo/IMG_4942.jpg',19)
,(20,'photo/IMG_4943.jpg',20)
;




RENAME TABLE `address` TO `place`;

update `place` set `description` = 'Шизгара' where `id` = 1;
update `place` set `description` = 'МЯСО И УГЛИ' where `id` = 2;
update `place` set `description` = 'KVARTAL' where `id` = 4;
update `place` set `description` = 'Мёд' where `id` = 5;
update `place` set `description` = 'УСТРИЦЫ & ТАНЦЫ' where `id` = 6;
insert into `place` (`id`, `description`, `city_id`) values (7, 'Онлайн', 7);

ALTER TABLE `game` ADD COLUMN `place_id` int(11) NULL;

!!! -- TODO: update place_id

ALTER TABLE `game` DROP COLUMN `city_id`;
ALTER TABLE `game` MODIFY `place_id` int(11) NOT NULL;

ALTER TABLE `city` ADD COLUMN `is_online` tinyint(1) NULL;
update `city` set `is_online` = 0;
update `city` set `is_online` = 1 where `id` = 7;
ALTER TABLE `city` MODIFY `is_online` tinyint(1) NOT NULL;
