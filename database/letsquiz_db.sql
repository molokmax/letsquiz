-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июл 04 2022 г., 19:32
-- Версия сервера: 5.7.35-38
-- Версия PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `letsquiz_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `is_online` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `city`
--

INSERT INTO `city` (`id`, `name`, `order`, `is_online`) VALUES
(1, 'Ступино', 4, 0),
(2, 'Коломна', 5, 0),
(6, 'Рязань', 9, 0),
(7, 'Онлайн', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `prefix` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `color`
--

INSERT INTO `color` (`id`, `name`, `prefix`) VALUES
(1, 'Черный', 'black'),
(2, 'Голубой', 'blue'),
(3, 'Синий', 'darkblue'),
(4, 'Желтый', 'yellow'),
(5, 'Розовый', 'pink');

-- --------------------------------------------------------

--
-- Структура таблицы `game`
--

CREATE TABLE `game` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `open_date` datetime DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `is_closed` tinyint(1) NOT NULL,
  `color_id` int(11) DEFAULT NULL,
  `price` varchar(50) NOT NULL,
  `place_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `game`
--

INSERT INTO `game` (`id`, `date`, `open_date`, `name`, `is_closed`, `color_id`, `price`, `place_id`) VALUES
(693, '2022-02-06 13:00:00', NULL, 'ЛЕТС КВИЗ 134/1', 0, 3, '400 ', 1),
(694, '2022-02-06 16:15:00', NULL, 'ЛЕТС КВИЗ 134/2', 0, 5, '400', 1),
(695, '2022-02-06 19:30:00', NULL, 'ЛЕТС КВИЗ 134/3', 0, 3, '400', 1),
(696, '2022-02-08 19:30:00', NULL, 'ЛЕТС КВИЗ 134', 0, 2, '300', 2),
(697, '2022-02-05 14:00:00', '2022-02-05 14:00:00', 'ЛЕТС КВИЗ 134/0', 0, 5, '400', 1),
(698, '2022-02-12 16:00:00', NULL, 'Детектив \"Сладкие обещания\"', 0, 2, '400', 1),
(699, '2022-02-12 16:00:00', NULL, 'Детектив \"Сладкие обещания\"', 0, 4, '400', 7),
(700, '2022-02-19 16:30:00', NULL, 'ЛЕТС КВИЗ 135/1', 0, 3, '400', 1),
(701, '2022-02-20 13:00:00', NULL, 'ЛЕТС КВИЗ 135/2', 0, 5, '400', 1),
(702, '2022-02-20 16:15:00', NULL, 'ЛЕТС КВИЗ 135/3', 0, 3, '400', 1),
(703, '2022-02-20 19:30:00', NULL, 'ЛЕТС КВИЗ 135/4', 0, 5, '400', 1),
(704, '2022-02-22 19:30:00', NULL, 'ЛЕТС КВИЗ 135', 0, 2, '300', 2),
(705, '2022-02-27 16:30:00', NULL, 'Детектив \"Круиз для победителя\"', 0, 2, '400', 1),
(706, '2022-02-27 16:30:00', NULL, 'Детектив \"Круиз для победителя\"', 0, 4, '400', 7),
(707, '2022-03-06 16:00:00', NULL, 'ЛЕТС КВИЗ 135/1', 0, 3, '400', 1),
(708, '2022-03-07 13:00:00', NULL, 'ЛЕТС КВИЗ 135/2', 0, 5, '400', 1),
(709, '2022-03-07 16:15:00', NULL, 'ЛЕТС КВИЗ 135/3', 0, 3, '400', 1),
(710, '2022-03-07 19:30:00', NULL, 'ЛЕТС КВИЗ 135/4', 0, 5, '400', 1),
(711, '2022-03-09 19:30:00', NULL, 'ЛЕТС КВИЗ 135', 0, 2, '300', 2),
(712, '2022-03-19 16:30:00', NULL, 'ЛЕТС КВИЗ 136/1', 0, 3, '400', 1),
(713, '2022-03-20 13:00:00', NULL, 'ЛЕТС КВИЗ 136/2', 0, 5, '400', 1),
(714, '2022-03-20 16:15:00', NULL, 'ЛЕТС КВИЗ 136/3', 0, 3, '400', 1),
(715, '2022-03-20 19:30:00', NULL, 'ЛЕТС КВИЗ 136/4', 0, 5, '400', 1),
(716, '2022-03-22 19:30:00', NULL, 'ЛЕТС КВИЗ 136', 0, 2, '300', 2),
(717, '2022-03-27 16:30:00', NULL, 'Детектив \"Ветренные\"', 0, 3, '400', 1),
(718, '2022-03-27 16:30:00', NULL, 'Детектив \"Ветренные\"', 0, 5, '400', 7),
(719, '2022-03-26 21:00:00', NULL, 'Ночной дозор. Джуманджи', 0, 4, '2000ком/', 1),
(720, '2022-04-09 18:00:00', NULL, 'ЛЕТС КВИЗ 137/1 СПЕЦигра+party', 0, 5, '400', 1),
(721, '2022-04-10 13:00:00', NULL, 'ЛЕТС КВИЗ 137/2 СПЕЦигра', 0, 3, '400', 1),
(722, '2022-04-10 16:15:00', NULL, 'ЛЕТС КВИЗ 137/3 СПЕЦигра', 0, 5, '400', 1),
(723, '2022-04-10 19:30:00', NULL, 'ЛЕТС КВИЗ 137/4 СПЕЦигра', 0, 3, '400', 1),
(724, '2022-04-12 19:30:00', NULL, 'ЛЕТС КВИЗ 137 СПЕЦигра', 0, 5, '400', 2),
(725, '2022-04-16 20:30:00', NULL, 'Автоквест. Фототочки', 0, 2, 'ком 500', 1),
(726, '2022-04-26 19:30:00', NULL, 'ЛЕТС КВИЗ 138', 0, 4, '400', 2),
(727, '2022-04-23 16:30:00', NULL, 'ЛЕТС КВИЗ 138/1', 0, 3, '400', 1),
(728, '2022-04-24 13:00:00', NULL, 'ЛЕТС КВИЗ 138/2', 0, 5, '400', 1),
(729, '2022-04-24 16:15:00', NULL, 'ЛЕТС КВИЗ 138/3', 0, 3, '400', 1),
(730, '2022-04-24 19:30:00', NULL, 'ЛЕТС КВИЗ 138/4', 0, 5, '400', 1),
(731, '2022-04-30 20:30:00', NULL, 'Ночной дозор #32. Мастер и Маргарита', 0, 2, '2000ком /', 1),
(732, '2022-05-03 16:30:00', NULL, 'Детектив \"Снег на голову\" ', 0, 4, '400', 7),
(733, '2022-05-03 16:30:00', NULL, 'Детектив \"Снег на голову\"', 0, 5, '400', 1),
(734, '2022-05-07 16:30:00', NULL, 'ЛЕТС КВИЗ 139/1', 0, 5, '400', 1),
(735, '2022-05-10 13:00:00', NULL, 'ЛЕТС КВИЗ 139/2', 0, 3, '400', 1),
(736, '2022-05-10 16:15:00', NULL, 'ЛЕТС КВИЗ 139/3', 0, 5, '400', 1),
(737, '2022-05-10 19:30:00', NULL, 'ЛЕТС КВИЗ 139/4', 0, 3, '400', 1),
(738, '2022-05-11 19:30:00', NULL, 'ЛЕТС КВИЗ 139', 0, 5, '400', 2),
(739, '2022-05-14 20:30:00', NULL, 'Ночной дозор #33. Пятница, 13-ое', 0, 2, '2000ком /', 1),
(740, '2022-05-24 19:30:00', NULL, 'ЛЕТС КВИЗ 140', 0, 5, '400', 2),
(741, '2022-05-21 16:30:00', NULL, 'ЛЕТС КВИЗ 140/1', 0, 5, '400', 1),
(742, '2022-05-22 13:00:00', NULL, 'ЛЕТС КВИЗ 140/2', 0, 3, '400', 1),
(743, '2022-05-22 16:15:00', NULL, 'ЛЕТС КВИЗ 140/3', 0, 5, '400', 1),
(744, '2022-05-22 19:30:00', NULL, 'ЛЕТС КВИЗ 140/4', 0, 3, '400', 1),
(745, '2022-05-28 20:30:00', NULL, 'Ночной дозор #34. Гравити Фолз', 0, 2, '2000ком /', 1),
(746, '2022-06-07 19:30:00', NULL, 'ЛЕТС КВИЗ 141', 0, 5, '400', 2),
(747, '2022-06-04 16:30:00', NULL, 'ЛЕТС КВИЗ 141/1', 0, 5, '400', 1),
(748, '2022-06-05 13:00:00', NULL, 'ЛЕТС КВИЗ 141/2', 0, 3, '400', 1),
(749, '2022-06-05 16:15:00', NULL, 'ЛЕТС КВИЗ 141/3', 0, 5, '400', 1),
(750, '2022-06-05 19:30:00', NULL, 'ЛЕТС КВИЗ 141/4', 0, 3, '400', 1),
(751, '2022-06-11 20:30:00', NULL, 'Ночной дозор #34. GHOSTBUSTERS', 0, 1, '2000ком /', 1),
(752, '2022-06-13 16:30:00', NULL, 'Детектив \"Муки совести\"', 0, 2, '400', 1),
(753, '2022-06-13 16:30:00', NULL, 'Детектив \"Муки совести\" ОНЛАЙН', 0, 2, '400', 7),
(754, '2022-06-18 18:00:00', NULL, 'КВИЗ \"Кино и музыка\"+party', 0, 5, '400', 1),
(755, '2022-06-19 13:00:00', NULL, 'КВИЗ \"Кино и музыка\"/2', 0, 3, '400', 1),
(756, '2022-06-19 16:15:00', NULL, 'КВИЗ \"Кино и музыка\"/3', 0, 5, '400', 1),
(757, '2022-06-19 19:30:00', NULL, 'КВИЗ \"Кино и музыка\"/4', 0, 3, '400', 1),
(758, '2022-06-21 19:30:00', NULL, 'КВИЗ \"Кино и музыка\"', 0, 2, '400', 2),
(759, '2022-06-25 20:30:00', NULL, 'Ночной дозор #36. Американский пирог', 0, 2, '2000ком/', 1),
(760, '2022-07-09 16:30:00', NULL, 'ЛЕТС КВИЗ 144/1', 0, 5, '400', 1),
(761, '2022-07-10 13:00:00', NULL, 'ЛЕТС КВИЗ 144/2', 0, 3, '400', 1),
(762, '2022-07-10 16:15:00', NULL, 'ЛЕТС КВИЗ 144/3', 0, 5, '400', 1),
(763, '2022-07-10 19:30:00', NULL, 'ЛЕТС КВИЗ 144/4', 0, 3, '400', 1),
(764, '2022-07-12 19:30:00', NULL, 'ЛЕТС КВИЗ 144', 0, 2, '400', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `notify`
--

CREATE TABLE `notify` (
  `id` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `notify`
--

INSERT INTO `notify` (`id`, `type`, `city_id`, `email`) VALUES
(1, NULL, NULL, 'letsquizST@yandex.ru'),
(2, 'REGISTRATION', 4, 'kvartal.quiz@gmail.com'),
(3, 'REGISTRATION', 5, 'letsquiz@yandex.ru'),
(4, 'REGISTRATION', 6, 'Lexa.rzn62@bk.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `photo`
--

CREATE TABLE `photo` (
  `id` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `photo`
--

INSERT INTO `photo` (`id`, `url`, `order`) VALUES
(1, 'photo/IMG_4902.jpg', 1),
(2, 'photo/IMG_4910.jpg', 2),
(3, 'photo/IMG_4911.jpg', 3),
(4, 'photo/IMG_4913.jpg', 4),
(5, 'photo/IMG_4914.jpg', 5),
(6, 'photo/IMG_4916.jpg', 6),
(7, 'photo/IMG_4917.jpg', 7),
(8, 'photo/IMG_4918.jpg', 8),
(9, 'photo/IMG_4920.jpg', 9),
(10, 'photo/IMG_4921.jpg', 10),
(11, 'photo/IMG_4922.jpg', 11),
(12, 'photo/IMG_4923.jpg', 12),
(13, 'photo/IMG_4924.jpg', 13),
(14, 'photo/IMG_4925.jpg', 14),
(15, 'photo/IMG_4927.jpg', 15),
(16, 'photo/IMG_4932.jpg', 16),
(17, 'photo/IMG_4933.jpg', 17),
(18, 'photo/IMG_4940.jpg', 18),
(19, 'photo/IMG_4942.jpg', 19),
(20, 'photo/IMG_4943.jpg', 20);

-- --------------------------------------------------------

--
-- Структура таблицы `place`
--

CREATE TABLE `place` (
  `id` int(11) NOT NULL,
  `description` varchar(250) NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `place`
--

INSERT INTO `place` (`id`, `description`, `city_id`) VALUES
(1, 'SHiZGARA', 1),
(2, 'МЯСО И УГЛИ', 2),
(4, 'KVARTAL Lounge (ул. Куликовская, 5)', 4),
(5, '\"playVR\" (ул. Лунная, 31)', 5),
(6, 'УСТРИЦЫ & ТАНЦЫ', 6),
(7, 'Онлайн', 7);

-- --------------------------------------------------------

--
-- Структура таблицы `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `team_name` varchar(50) NOT NULL,
  `team_count` tinyint(1) NOT NULL,
  `leader_name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `registration`
--


-- --------------------------------------------------------

--
-- Структура таблицы `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `prefix` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `setting`
--

INSERT INTO `setting` (`id`, `name`, `prefix`, `type`, `value`) VALUES
(1, 'Номер контактного телефона', 'PHONE', 'string', '+7 916 451 44 81'),
(2, 'Контактный Email', 'EMAIL', 'string', 'info@letsquiz.ru'),
(3, 'Количество игр для отображения', 'GAME_TAKE', 'int', '9'),
(5, 'Скрыть раздел \"Галерея\"', 'HIDE_GALLERY', 'bool', 'false'),
(7, 'Скрыть раздел \"Корпоративы\"', 'HIDE_CORP', 'bool', 'false'),
(8, 'Скрыть раздел \"Главная\"', 'HIDE_MAIN', 'bool', 'false'),
(9, 'Скрыть раздел \"Правила\"', 'HIDE_TERMS', 'bool', 'false'),
(10, 'Закрывать регистрацию после N часов от начала игры', 'GAME_CLOSE', 'int', '0'),
(11, 'Скрыть раздел \"Расписание\"', 'HIDE_SCHEDULE', 'bool', 'false'),
(12, 'Стоимость игры по умолчанию', 'DEFAULT_GAME_PRICE', 'string', '400'),
(13, 'Номер версии системы', 'SYSTEM_VERSION_NUMBER', 'string', 'v2.2'),
(14, 'Количество фотографий для отображения', 'PHOTO_TAKE', 'int', '4'),
(15, 'Скрыть раздел \"Контакты\"', 'HIDE_FOOTER', 'bool', 'false'),
(16, 'Активировать Yandex.Metrika', 'METRIKA_ENABLED', 'bool', 'false');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `pass`, `is_locked`) VALUES
(1, 'admin', '*027011E607535B7EC88190C1299032C3AF63CF53', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `notify`
--
ALTER TABLE `notify`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `game`
--
ALTER TABLE `game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=765;

--
-- AUTO_INCREMENT для таблицы `notify`
--
ALTER TABLE `notify`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `photo`
--
ALTER TABLE `photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT для таблицы `place`
--
ALTER TABLE `place`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8107;

--
-- AUTO_INCREMENT для таблицы `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
