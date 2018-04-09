CREATE TABLE letsquiz.`user` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`pass` varchar(100) NOT NULL,
	`is_locked` tinyint(1) DEFAULT 0 NOT NULL,
  	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

insert into letsquiz.`user` (`name`, `pass`, `is_locked`) values ('admin', PASSWORD('secret'), 0)

