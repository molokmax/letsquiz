CREATE TABLE `registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `team_name` varchar(50) NOT NULL,
  `team_count` TINYINT(1) NOT NULL,
  `leader_name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
);
