CREATE TABLE IF NOT EXISTS `color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` nvarchar(50) NOT NULL,
  `prefix` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `color` (`id`, `name`, `prefix`) VALUES 
(1, 'Зеленый', 'green'),
(2, 'Синий', 'blue'),
(3, 'Красный', 'red'),
(4, 'Желный', 'yellow');

ALTER TABLE `game` ADD COLUMN `color_id` int(11) NULL;
