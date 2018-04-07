-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Апр 07 2018 г., 09:38
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `letsquiz`
--

-- --------------------------------------------------------

--
-- Структура таблицы `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(250) NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `address`
--

INSERT INTO `address` (`id`, `description`, `city_id`) VALUES
(1, 'Клуб-ресторан-караоке "Shizgara" (Проспект победы, 71)', 1),
(2, 'Гриль-бар "МЯСО И УГЛИ" (ул. Гагарина, 68)', 2),
(3, 'Ресторан "1 литр" (ул. Пушкина, 125)', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `city`
--

INSERT INTO `city` (`id`, `name`) VALUES
(1, 'Ступино'),
(2, 'Коломна'),
(3, 'Луховицы');

-- --------------------------------------------------------

--
-- Структура таблицы `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) DEFAULT NULL,
  `text` text NOT NULL,
  `author` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `feedback`
--

INSERT INTO `feedback` (`id`, `order`, `text`, `author`) VALUES
(1, 1, 'Заразилась. Нереально круто! Отлично провели время. Подумали, посмеялись, пообщались. В новом сезоне будем новой командой "экоЛогика" зажигать', 'katrina_shubina'),
(2, 2, 'Да, душевно и интерактивно, элемент свадебного интерактивна поразил!!! Узнать трек, и тд + гифки на экране... В общем, не хочу повторяться, но это оч круто! Спасибо огромное!', 'Алёна'),
(3, 3, 'Мы молодцы! Все молодцы! Было круто круто! Почему я раньше не знала о вас, ребята?', 'varvalola'),
(4, 4, 'Пускай без призовых мест, НО зато стабильность нашей команды зашкаливает. Мы не изменяем своим привычкам и поэтому каждые 2 недели мы на Let''s КВИЗ, а теперь они еще и на Коломну замахнулись... думаю она их примет с распростертыми объятьями! А мы желаем всем таких привычек!', 'partygoer2013'),
(5, 5, 'Закончился второй сезон барных викторин Let''s КВИЗ! Это была чреда крутых выходных с чумовыми вопросами, шумом, классными ребятами и Shizgara! Те, кто участвовал, знают, о чем речь =) Остальные, скорее присоединяйтесь, регистрируйтесь на игры нового сезона! Для этого нужно найти компанию 2-9 человек и оставить заявку. Спасибо, Let''s КВИЗ за офигенный сезон! Ждем продолжения (с нетерпением)', 'mosigrastupino'),
(6, 6, 'Роман, Алина, спасибо большое вам и всем кто за кадром :) супер, что вы организовали игру, которая приносит столько эмоций, новых друзей и кругозор расширяет :)', 'Алёна');

-- --------------------------------------------------------

--
-- Структура таблицы `game`
--

CREATE TABLE IF NOT EXISTS `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `name` varchar(10) NOT NULL,
  `city_id` int(11) NOT NULL,
  `is_closed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- Дамп данных таблицы `game`
--

INSERT INTO `game` (`id`, `date`, `name`, `city_id`, `is_closed`) VALUES
(37, '2018-04-08 13:00:00', '26.1', 1, 0),
(38, '2018-04-08 16:15:00', '26.2', 1, 0),
(39, '2018-04-08 19:30:00', '26.3', 1, 0),
(40, '2018-04-09 19:30:00', '26.1', 2, 0),
(41, '2018-04-10 19:30:00', '26.2', 2, 0),
(42, '2018-04-22 13:00:00', '27.1', 1, 0),
(43, '2018-04-22 16:15:00', '27.2', 1, 0),
(44, '2018-04-22 19:30:00', '27.3', 1, 0),
(45, '2018-04-23 19:30:00', '27.1', 2, 0),
(46, '2018-04-24 19:30:00', '27.2', 2, 0),
(47, '2018-04-26 19:30:00', '27', 3, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `photo`
--

CREATE TABLE IF NOT EXISTS `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Дамп данных таблицы `photo`
--

INSERT INTO `photo` (`id`, `url`, `order`) VALUES
(1, 'photo/0XaWojqhyxQ.jpg', 6),
(2, 'photo/1bW6I69yYBE.jpg', 7),
(3, 'photo/2970M5Y6OPw.jpg', 8),
(4, 'photo/2B0FwAzlv-8.jpg', 9),
(5, 'photo/31aNsN6Arqw.jpg', 10),
(6, 'photo/39r_Ui0Cw04.jpg', 11),
(7, 'photo/3eDPWvkVvfw.jpg', 12),
(8, 'photo/4s44n2I1uRE.jpg', 13),
(9, 'photo/5vehvvqkQKs.jpg', 14),
(10, 'photo/5Za03yvwwH0.jpg', 15),
(11, 'photo/665UfHkS_ug.jpg', 16),
(12, 'photo/7BeNA99q-EM.jpg', 17),
(13, 'photo/8FvIvjdktkE.jpg', 18),
(14, 'photo/8kiJjNyya2I.jpg', 19),
(15, 'photo/Bfbj5gA1ius.jpg', 20),
(16, 'photo/BRD9w3djemM.jpg', 21),
(17, 'photo/CmhREm3qQUU.jpg', 22),
(18, 'photo/cr11GfDk1yM.jpg', 23),
(19, 'photo/CY02nBB5Bhw.jpg', 24),
(20, 'photo/ddkctaiPm5k.jpg', 25),
(21, 'photo/eJV-YmXvTnM.jpg', 26),
(22, 'photo/F6D8-2v24f8.jpg', 27),
(23, 'photo/F7x4viIO0Z8.jpg', 28),
(24, 'photo/fd6tecX6AyY.jpg', 29),
(25, 'photo/gqkZgywKsgo.jpg', 30),
(26, 'photo/HDNMaNwBeHg.jpg', 31),
(27, 'photo/HlA0cdYi-X0.jpg', 32),
(28, 'photo/hom9A4DnVlQ.jpg', 33),
(29, 'photo/jMPM2RYX1Cs.jpg', 34),
(30, 'photo/myFXND2Ho0k.jpg', 35),
(31, 'photo/O0A9Qi2YqRY.jpg', 36),
(32, 'photo/tiU_ZtS10L0.jpg', 37),
(33, 'photo/TUTs__hJafQ.jpg', 38),
(34, 'photo/VGHyonWKfmk.jpg', 39),
(35, 'photo/VvyqxdWnNys.jpg', 40),
(36, 'photo/WXBl0avMLwU.jpg', 41),
(37, 'photo/xR38eXW6Lcw.jpg', 42),
(38, 'photo/tV0U1tYhFQw.jpg', 1),
(39, 'photo/Jzscf5qA8Nw.jpg', 2),
(40, 'photo/OGLv2NqIcNM.jpg', 3),
(41, 'photo/bV8VRG1thlU.jpg', 4),
(42, 'photo/rXJLW7qhDMM.jpg', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `question`
--

INSERT INTO `question` (`id`, `order`, `question`, `answer`) VALUES
(1, 1, 'В этой европейской стране популярны футболки с перечеркнутым изображением кенгуру и надписью, что тут кенгуру не живут. Что это за страна?', 'Австрия (не путать с Австралией)'),
(2, 2, 'Угадайте знаменитость: <br />Родился в 1978 г <br />Начал свою карьеру в сериале "Улицы разбитых фонарей" <br />Играет на гитаре, фортепиано, аккордеоне, блок-флейте и ударных <br />Является соавтором книги Владимира Познера "Одноэтажная Америка" <br />Ведущий кулинарного шоу <br />Очень любит Елки', 'Иван Ургант'),
(3, 3, 'В честь юбилея одной замечательной игры, издатель Hasbro сообщил что упакует в коробки с игрой настоящие деньги. В 79 коробках игровые деньги будут частично заменены на реальные купюры, а в одной коробке будут заменены все банкноты и обладатель получит сумму = 20,5 тысяч евро. Как называется эта игра? И сколько лет ей исполняется?', 'Монополия, 80 лет'),
(4, 4, 'Народное название этой травы "Мяун". Напишите научное название', 'Валериана'),
(5, 5, 'Притча о шести великих евреях, которые изменили мир: <br />Моисей сказал, что все от НЕБЕС <br />Соломон сказал, что все от ГОЛОВЫ <br />Иисус сказал, что все от СЕРДЦА <br />Маркс сказал, что все от ЖИВОТА <br />Фрейд сказал, что все от КХЕКХЕ ЧУТЬ НИЖЕ ЖИВОТА)) <br />Эйнштейн сказа, что все ОT... <br />Что сказал Эйнштейн?', 'все ОТНОСИТЕЛЬНО'),
(6, 6, 'В одном американском городе местные библиотекари устроили выставку. Среди разнообразных бумажек и полосок картона, посетители могли увидеть и такие экспонаты как: кредитные карты, фантики от конфет, ломтики засохшей колбасы, расчески, лезвия для бритвы', 'Выставка книжных закладок'),
(7, 7, '"Король Тьмы" и популярный музыкант Мерилин Мэнсон выпускает абсент под названием "Absinthe Mansinthe". Чему равна крепость напитка Мэнсона?', 'Крепость равна 66,6%');

-- --------------------------------------------------------

--
-- Структура таблицы `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `prefix` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `setting`
--

INSERT INTO `setting` (`id`, `name`, `prefix`, `type`, `value`) VALUES
(1, 'Номер контактного телефона', 'PHONE', 'string', '8-916-451-44-81'),
(2, 'Контактный Email', 'EMAIL', 'string', 'info@letsquiz.ru'),
(3, 'Количество игр для отображения', 'GAME_TAKE', 'int', '15'),
(4, 'Скрыть раздел "Отзывы"', 'HIDE_FEEDBACK', 'bool', 'false'),
(5, 'Скрыть раздел "Галерея"', 'HIDE_GALLERY', 'bool', 'false'),
(6, 'Скрыть раздел "Друзья"', 'HIDE_FRIENDS', 'bool', 'false'),
(7, 'Скрыть раздел "Корпоративы"', 'HIDE_CORP', 'bool', 'true'),
(8, 'Скрыть раздел "Главная"', 'HIDE_MAIN', 'bool', 'false'),
(9, 'Скрыть раздел "Правила"', 'HIDE_TERMS', 'bool', 'false'),
(10, 'Закрывать регистрацию за N часов до начала игры', 'GAME_CLOSE', 'int', '4'),
(11, 'Скрыть раздел "Расписание"', 'HIDE_SCHEDULE', 'bool', 'false');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
