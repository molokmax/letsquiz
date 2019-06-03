CREATE TABLE letsquiz.`notify` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`type` varchar(100) NULL,
	`city_id` int(11) NULL,
	`email` varchar(100) NOT NULL,
  	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

insert into letsquiz.`notify` (`type`, `city_id`, `email`) values (NULL, NULL, 'info@letsquiz.ru');
insert into letsquiz.`notify` (`type`, `city_id`, `email`) values ('REGISTRATION', 4, 'kvartal.quiz@gmail.com');
