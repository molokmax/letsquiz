
INSERT INTO `city` (`id`, `name`) VALUES
(6, 'Рязань');

INSERT INTO `address` (`id`, `description`, `city_id`) VALUES
(6, 'Ресторан "УСТРИЦЫ & ТАНЦЫ" (ТРЦ Премьер, этаж 2)', 6);


insert into `notify` (`type`, `city_id`, `email`) values 
('REGISTRATION', 6, 'Lexa.rzn62@bk.ru');
