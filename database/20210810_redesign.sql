
INSERT INTO `setting` (`id`, `name`, `prefix`, `type`, `value`) VALUES (14, 'Количество фотографий для отображения', 'PHOTO_TAKE', 'int', '4');
INSERT INTO `setting` (`id`, `name`, `prefix`, `type`, `value`) VALUES (15, 'Скрыть раздел "Контакты"', 'HIDE_FOOTER', 'bool', 'false');

delete from `setting` where `prefix` = 'HIDE_FRIENDS';
delete from `setting` where `prefix` = 'HIDE_FEEDBACK';

update `setting` set `value` = '300' where `prefix` = 'DEFAULT_GAME_PRICE';
update `setting` set `value` = '6' where `prefix` = 'GAME_TAKE';
update `setting` set `value` = '+7 916 451 44 81' where `prefix` = 'PHONE';
update `setting` set `value` = 'false' where `prefix` = 'HIDE_CORP';




delete from `photo`;

INSERT INTO photo (id,url,`order`) VALUES 
(1,'photo/IMG_4902.png',1)
,(2,'photo/IMG_4910.png',2)
,(3,'photo/IMG_4911.png',3)
,(4,'photo/IMG_4913.png',4)
,(5,'photo/IMG_4914.png',5)
,(6,'photo/IMG_4916.png',6)
,(7,'photo/IMG_4917.png',7)
,(8,'photo/IMG_4918.png',8)
,(9,'photo/IMG_4920.png',9)
,(10,'photo/IMG_4921.png',10)
,(11,'photo/IMG_4922.png',11)
;
INSERT INTO photo (id,url,`order`) VALUES 
(12,'photo/IMG_4923.png',12)
,(13,'photo/IMG_4924.png',13)
,(14,'photo/IMG_4925.png',14)
,(15,'photo/IMG_4927.png',15)
,(16,'photo/IMG_4932.png',16)
,(17,'photo/IMG_4933.png',17)
,(18,'photo/IMG_4940.png',18)
,(19,'photo/IMG_4942.png',19)
,(20,'photo/IMG_4943.png',20)
;
