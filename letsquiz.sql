-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Фев 11 2018 г., 11:52
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
-- Структура таблицы `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `city`
--

INSERT INTO `city` (`id`, `name`) VALUES
(1, 'Ступино'),
(2, 'Коломна');

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
(3, 3, 'Мы молодны! Все молодны! Было круто круто! Почему я раньше не знача о вас, ребята?', 'varvalola'),
(4, 4, 'Пускай без призовых мест, НО зато стабильность нашей команды зашкаливает. Мы не изменяем своим привычкам и поэтому каждые 2 недели мы на Let''s QUIZ, а теперь они еще и на Коломну замахнулись... думаю она их примет с распростертыми объятьями! А мы желаем всем таких привычек!', 'partygoer2013'),
(5, 5, 'Закончился второй сезон барных викторин Let''s QUIZ! Это была череда крутых выходных с чумовыми вопросами, шумом, классными ребятами и Shizgara! Те, кто участвовал, знают, о чем речь =) Остальные, скорее присоединяйтесь, регистрируйтесь на игры нового сезона! Для этого нужно найти компанию 2-9 человек и оставить заявку. Спасибо, Let''s QUIZ за офигенный сезон! Ждем продолжения (с нетерпением)', 'mosigrastupino'),
(6, 6, 'Роман, Алина, спасибо большое вам и всем кто за кадром :) супер, что вы организовали игру, которая приносит столько эмоций, новых друзей и кругозор расширяет :)', '');

-- --------------------------------------------------------

--
-- Структура таблицы `game`
--

CREATE TABLE IF NOT EXISTS `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Дамп данных таблицы `game`
--

INSERT INTO `game` (`id`, `date`, `city_id`) VALUES
(19, '2018-02-11 15:00:00', 1),
(20, '2018-02-11 18:30:00', 1),
(21, '2018-02-24 15:00:00', 1),
(22, '2018-02-24 18:30:00', 1),
(23, '2018-03-10 15:00:00', 1),
(24, '2018-03-10 18:30:00', 1),
(25, '2018-03-24 15:00:00', 1),
(26, '2018-03-24 18:30:00', 1),
(27, '2018-04-07 15:00:00', 1),
(28, '2018-04-07 18:30:00', 1),
(29, '2018-04-21 15:00:00', 1),
(30, '2018-04-21 18:30:00', 1),
(31, '2018-02-13 19:30:00', 2),
(32, '2018-02-27 19:30:00', 2),
(33, '2018-03-13 19:30:00', 2),
(34, '2018-03-27 19:30:00', 2),
(35, '2018-04-10 19:30:00', 2),
(36, '2018-04-24 19:30:00', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `photo`
--

CREATE TABLE IF NOT EXISTS `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Дамп данных таблицы `photo`
--

INSERT INTO `photo` (`id`, `url`, `order`) VALUES
(1, 'photo/0XaWojqhyxQ.jpg', 1),
(2, 'photo/1bW6I69yYBE.jpg', 2),
(3, 'photo/2970M5Y6OPw.jpg', 3),
(4, 'photo/2B0FwAzlv-8.jpg', 4),
(5, 'photo/31aNsN6Arqw.jpg', 5),
(6, 'photo/39r_Ui0Cw04.jpg', 6),
(7, 'photo/3eDPWvkVvfw.jpg', 7),
(8, 'photo/4s44n2I1uRE.jpg', 8),
(9, 'photo/5vehvvqkQKs.jpg', 9),
(10, 'photo/5Za03yvwwH0.jpg', 10),
(11, 'photo/665UfHkS_ug.jpg', 11),
(12, 'photo/7BeNA99q-EM.jpg', 12),
(13, 'photo/8FvIvjdktkE.jpg', 13),
(14, 'photo/8kiJjNyya2I.jpg', 14),
(15, 'photo/Bfbj5gA1ius.jpg', 15),
(16, 'photo/BRD9w3djemM.jpg', 16),
(17, 'photo/CmhREm3qQUU.jpg', 17),
(18, 'photo/cr11GfDk1yM.jpg', 18),
(19, 'photo/CY02nBB5Bhw.jpg', 19),
(20, 'photo/ddkctaiPm5k.jpg', 20),
(21, 'photo/eJV-YmXvTnM.jpg', 21),
(22, 'photo/F6D8-2v24f8.jpg', 22),
(23, 'photo/F7x4viIO0Z8.jpg', 23),
(24, 'photo/fd6tecX6AyY.jpg', 24),
(25, 'photo/gqkZgywKsgo.jpg', 25),
(26, 'photo/HDNMaNwBeHg.jpg', 26),
(27, 'photo/HlA0cdYi-X0.jpg', 27),
(28, 'photo/hom9A4DnVlQ.jpg', 28),
(29, 'photo/jMPM2RYX1Cs.jpg', 29),
(30, 'photo/myFXND2Ho0k.jpg', 30),
(31, 'photo/O0A9Qi2YqRY.jpg', 31),
(32, 'photo/tiU_ZtS10L0.jpg', 32),
(33, 'photo/TUTs__hJafQ.jpg', 33),
(34, 'photo/VGHyonWKfmk.jpg', 34),
(35, 'photo/VvyqxdWnNys.jpg', 35),
(36, 'photo/WXBl0avMLwU.jpg', 36),
(37, 'photo/xR38eXW6Lcw.jpg', 37);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `setting`
--

INSERT INTO `setting` (`id`, `name`, `prefix`, `type`, `value`) VALUES
(1, 'Номер контактного телефона', 'PHONE', 'string', '8-916-451-44-81'),
(2, 'Контактный Email', 'EMAIL', 'string', 'info@letsquiz.ru'),
(3, 'Количество игр для отображения', 'GAME_TAKE', 'int', '10'),
(4, 'Скрыть раздел "Отзывы"', 'HIDE_FEEDBACK', 'bool', 'false'),
(5, 'Скрыть раздел "Галерея"', 'HIDE_GALLERY', 'bool', 'false'),
(6, 'Скрыть раздел "Друзья"', 'HIDE_FRIENDS', 'bool', 'false'),
(7, 'Скрыть раздел "Корпоративы"', 'HIDE_CORP', 'bool', 'true'),
(8, 'Скрыть раздел "Главная"', 'HIDE_MAIN', 'bool', 'false'),
(9, 'Скрыть раздел "Правила"', 'HIDE_TERMS', 'bool', 'false'),
(10, 'Закрывать регистрацию за N часов до начала игры', 'GAME_CLOSE', 'int', '4');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
