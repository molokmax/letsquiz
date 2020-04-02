
INSERT INTO `city` (`id`, `name`) VALUES
(7, 'Онлайн');


alter table `city` add column `order` int(11) DEFAULT NULL;


update `city` set `order` = `id` + 3;
update `city` set `order` = 0 where `name` = 'Все';
update `city` set `order` = 1 where `name` = 'Онлайн';
