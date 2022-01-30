-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Апр 27 2020 г., 21:18
-- Версия сервера: 5.6.37-82.2
-- Версия PHP: 7.1.33

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
-- Структура таблицы `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `description` varchar(250) NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `address`
--

INSERT INTO `address` (`id`, `description`, `city_id`) VALUES
(1, 'Клуб-ресторан-караоке \"Shizgara\" (Проспект победы, 71)', 1),
(2, 'Гриль-бар \"МЯСО И УГЛИ\" (ул. Гагарина, 68)', 2),
(4, 'KVARTAL Lounge (ул. Куликовская, 5)', 4),
(5, 'Караоке-клуб \"Мёд\" (Каширское шоссе, 107)', 5),
(6, 'Ресторан \"УСТРИЦЫ & ТАНЦЫ\" (ТРЦ Премьер, этаж 2)', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `city`
--

INSERT INTO `city` (`id`, `name`, `order`) VALUES
(1, 'Ступино', 4),
(2, 'Коломна', 5),
(4, 'Москва', 7),
(5, 'Домодедово', 8),
(6, 'Рязань', 9),
(7, 'Онлайн', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `prefix` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `color`
--

INSERT INTO `color` (`id`, `name`, `prefix`) VALUES
(1, 'Зеленый', 'green'),
(2, 'Синий', 'blue'),
(3, 'Красный', 'red'),
(4, 'Желный', 'yellow');

-- --------------------------------------------------------

--
-- Структура таблицы `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `text` text NOT NULL,
  `author` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `feedback`
--

INSERT INTO `feedback` (`id`, `order`, `text`, `author`) VALUES
(1, 1, 'Заразилась. Нереально круто! Отлично провели время. Подумали, посмеялись, пообщались. В новом сезоне будем новой командой \"экоЛогика\" зажигать!', 'katrina_shubina'),
(2, 2, 'Да, душевно и интерактивно, элемент свадебного интерактива поразил!!! Узнать трек, и тд + гифки на экране... В общем, не хочу повторяться, но это очень круто! Спасибо огромное!', 'Алёна'),
(3, 3, 'Мы молодцы! Все молодцы! Было круто круто! Почему я раньше не знала о вас, ребята?', 'varvalola'),
(5, 5, 'Закончился второй сезон барных викторин Let\'s КВИЗ! Это была чреда крутых выходных с чумовыми вопросами, шумом, классными ребятами и Shizgara! Те, кто участвовал, знают, о чем речь =) Остальные, скорее присоединяйтесь, регистрируйтесь на игры нового сезона! Для этого нужно найти компанию 2-9 человек и оставить заявку. Спасибо, Let\'s КВИЗ за офигенный сезон! Ждем продолжения (с нетерпением)', 'mosigrastupino'),
(6, 6, 'Роман, Алина, спасибо большое вам и всем кто за кадром :) супер, что вы организовали игру, которая приносит столько эмоций, новых друзей и кругозор расширяет :)', 'Алёна'),
(7, NULL, 'С летс Квиз мы почти с самого начала ', 'Екатерина'),
(8, NULL, 'Очень, очень, очень нравится с Вами проводить воскресный вечер! Весело, познавательно, к тому же есть возможность выиграть призы. Да что призы, наша цель всегда одна - ТОРТ! Спасибо Вам! Никогда не бывает скучно. Даже наоборот. Квиз - это реальная возможность после рабочей недели встретиться всем за игральным столом, посмеяться, поспорить, пофотографироваться, выиграть крутейшие призы и просто хорошо провести время.', 'Валерия Карева'),
(9, NULL, 'Ребята, огромное вам спасибо, играем всей семьей , втянули всех друзей, хотя сами влились не так давно, дали начало еще двум командам и сейчас еще одна формируется. Я приглашаю всех своих знакомых из разных сфер и они цепляются, нам уже тесно в одной команде, теперь мы играем против своих, но это же очень интересно. КВИЗ сумел объединить не только команды, но и семьи, и людей очень разных возрастов. Мы ждем воскресный вечер с Алиной. Алина и Роман спасибо!', 'Любовь Самойлова'),
(10, NULL, 'В #летсквиз мне нравится все! Шутки и стиль общения Алины во время игры, серьезность и перфекционизм Романа, наша команда, эмоции, которые мы переживаем в игре и после), около 400 единомышленников, которые каждое воскресенье выбирают интеллектуальный отдых! Все нравится мне, идеальный проект и прекрасные люди❤', 'Светлана Кудинова'),
(11, NULL, 'Я каждый раз отправляясь на очередную игру квиз думаю что же в ней такого? А ответ прост - квиз дает нам возможность отдохнуть, встряхнуть извилины, поскрипеть мозгами...Море эмоций, охрипший голос и заряд энергии на целую неделю. А также прекрасная ведущая и крутая команда за кадром. Алина - ты наверное главная составляющая квиза. Нам есть с чем сравнить. Вот все есть - и подача, и интрига, и стиль. Рома - ты супер! И никаких ребусов с \"тли\"... Ступинский квиз - это круто!', 'Марина Сухарева'),
(12, NULL, 'Моя квизомания началась почти два года назад и до сих пор каждую игру я жду с трепетом и предвкушением эмоциональных американских горок! Чувствуешь себя словно в параллельной вселенной - сейчас тебе пощекотят нервишки, да ещё и заснимут это для истории.\nРебята, спасибо вам за те эмоции, которые вы нам всем дарите. Спасибо за ваш профессиональный подход к каждой игре - ведь все продуманно до мелочей, на самом высоком уровне. Вы лучшие!', 'Катерина Раевская'),
(13, NULL, 'Благодаря вам я стал запоминать всякую информацию, которая мне попадается, точнее и детальнее. Потому что - а вдруг спросят на Квизе)). И все «запылённые полки» памяти, которые казались никому ненужными, вдруг оказываются актуальными и приносят заветный бал в копилку команды.\nСпасибо, что даёте такую возможность задействовать свою память и мозг. И потом радоваться результатам.\nМоё мнение - команда Летс Квиз делает для города больше, администрация и весь чиновничий аппарат(в плане развлечений конечно. По укладке бордюра администрация пока лидирует)\nА для детей вы делаете больше чем министерство министерство образования и просвещения. Потому что раньше они читали книжки просто так или вовсе не читали. А теперь читают, а всё почему? Потому что вдруг на Квизе спросят ', 'Аршак Амирзян');

-- --------------------------------------------------------

--
-- Структура таблицы `game`
--

CREATE TABLE `game` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `name` varchar(50) NOT NULL,
  `city_id` int(11) NOT NULL,
  `is_closed` tinyint(1) NOT NULL,
  `color_id` int(11) DEFAULT NULL,
  `price` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `game`
--

INSERT INTO `game` (`id`, `date`, `name`, `city_id`, `is_closed`, `color_id`, `price`) VALUES
(47, '2018-04-26 19:30:00', '27', 3, 0, NULL, '300'),
(58, '2018-05-10 19:30:00', '28', 3, 0, NULL, '300'),
(387, '2020-04-04 16:00:00', 'Летс Квиз Онлайн №1', 2, 0, 2, '300'),
(388, '2020-04-04 16:00:00', 'Летс Квиз Онлайн №1', 7, 0, 2, '500/1000'),
(389, '2020-04-18 16:00:00', 'Летс Квиз Онлайн №2', 7, 0, 2, '500/1000'),
(393, '2020-04-19 16:00:00', 'Junior Летс Квиз Онлайн №1', 7, 0, 1, '500/1000'),
(394, '2020-04-26 16:00:00', 'Онлайн №3/Кино и музыка', 7, 0, 2, '500/1000'),
(395, '2020-05-01 18:00:00', 'Saint Twins Detective Online №1', 7, 0, 2, ' 1 команда = 1000 руб');

-- --------------------------------------------------------

--
-- Структура таблицы `notify`
--

CREATE TABLE `notify` (
  `id` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `notify`
--

INSERT INTO `notify` (`id`, `type`, `city_id`, `email`) VALUES
(1, NULL, NULL, 'info@letsquiz.ru'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `photo`
--

INSERT INTO `photo` (`id`, `url`, `order`) VALUES
(4, 'photo/2B0FwAzlv-8.jpg', 9),
(6, 'photo/39r_Ui0Cw04.jpg', 11),
(9, 'photo/5vehvvqkQKs.jpg', 14),
(10, 'photo/5Za03yvwwH0.jpg', 15),
(14, 'photo/8kiJjNyya2I.jpg', 19),
(24, 'photo/fd6tecX6AyY.jpg', 29),
(25, 'photo/gqkZgywKsgo.jpg', 30),
(26, 'photo/HDNMaNwBeHg.jpg', 31),
(27, 'photo/HlA0cdYi-X0.jpg', 32),
(28, 'photo/hom9A4DnVlQ.jpg', 33),
(30, 'photo/myFXND2Ho0k.jpg', 35),
(32, 'photo/tiU_ZtS10L0.jpg', 37),
(36, 'photo/WXBl0avMLwU.jpg', 41),
(39, 'photo/Jzscf5qA8Nw.jpg', 10),
(41, 'photo/bV8VRG1thlU.jpg', 4),
(42, 'photo/rXJLW7qhDMM.jpg', 5),
(43, 'photo/SBxgxLohBOsI.jpg', 5),
(44, 'photo/ujPmnZxeeY2u.jpg', 5),
(45, 'photo/CSinSGsVoDxf.jpg', 3),
(46, 'photo/Bz5eHiOrUXBe.jpg', 4),
(47, 'photo/CTctTbwYnfxV.jpg', 5),
(48, 'photo/OhAhhW4bVdDx.jpg', 1),
(49, 'photo/G8MlPYL2ai2C.jpg', 7),
(50, 'photo/pvP4LtdX3wVK.jpg', 3),
(51, 'photo/1TrxQm5349NI.jpg', 4),
(52, 'photo/VL2oNBxFiEHG.jpg', 2),
(53, 'photo/z9DDMr0ZIAKO.jpg', 3),
(54, 'photo/4D1jLsRELj1m.jpg', 3),
(55, 'photo/7jFVHh2LTNGt.jpg', 6),
(56, 'photo/7X5Ki9aWBLd7.jpg', 7),
(57, 'photo/6rBR7flk0dF4.jpg', 3),
(58, 'photo/D81ERb01jCeT.jpg', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `question`
--

INSERT INTO `question` (`id`, `order`, `question`, `answer`) VALUES
(1, 1, 'В этой европейской стране популярны футболки с перечеркнутым изображением кенгуру и надписью, что тут кенгуру не живут. Что это за страна?', 'Австрия (не путать с Австралией)'),
(2, 2, 'Угадайте знаменитость: <br />Родился в 1978 г <br />Начал свою карьеру в сериале \"Улицы разбитых фонарей\" <br />Играет на гитаре, фортепиано, аккордеоне, блок-флейте и ударных <br />Является соавтором книги Владимира Познера \"Одноэтажная Америка\" <br />Ведущий кулинарного шоу <br />Очень любит Елки', 'Иван Ургант'),
(3, 3, 'В честь юбилея одной замечательной игры, издатель Hasbro сообщил что упакует в коробки с игрой настоящие деньги. В 79 коробках игровые деньги будут частично заменены на реальные купюры, а в одной коробке будут заменены все банкноты и обладатель получит сумму = 20,5 тысяч евро. Как называется эта игра? И сколько лет ей исполняется?', 'Монополия, 80 лет'),
(4, 4, 'Народное название этой травы \"Мяун\". Напишите научное название', 'Валериана'),
(5, 5, 'Притча о шести великих евреях, которые изменили мир: <br />Моисей сказал, что все от НЕБЕС <br />Соломон сказал, что все от ГОЛОВЫ <br />Иисус сказал, что все от СЕРДЦА <br />Маркс сказал, что все от ЖИВОТА <br />Фрейд сказал, что все от КХЕКХЕ ЧУТЬ НИЖЕ ЖИВОТА)) <br />Эйнштейн сказа, что все ОT... <br />Что сказал Эйнштейн?', 'все ОТНОСИТЕЛЬНО'),
(6, 6, 'В одном американском городе местные библиотекари устроили выставку. Среди разнообразных бумажек и полосок картона, посетители могли увидеть и такие экспонаты как: кредитные карты, фантики от конфет, ломтики засохшей колбасы, расчески, лезвия для бритвы', 'Выставка книжных закладок'),
(7, 7, '\"Король Тьмы\" и популярный музыкант Мерилин Мэнсон выпускает абсент под названием \"Absinthe Mansinthe\". Чему равна крепость напитка Мэнсона?', 'Крепость равна 66,6%');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `setting`
--

INSERT INTO `setting` (`id`, `name`, `prefix`, `type`, `value`) VALUES
(1, 'Номер контактного телефона', 'PHONE', 'string', '8-916-451-44-81'),
(2, 'Контактный Email', 'EMAIL', 'string', 'info@letsquiz.ru'),
(3, 'Количество игр для отображения', 'GAME_TAKE', 'int', '21'),
(4, 'Скрыть раздел \"Отзывы\"', 'HIDE_FEEDBACK', 'bool', 'false'),
(5, 'Скрыть раздел \"Галерея\"', 'HIDE_GALLERY', 'bool', 'false'),
(6, 'Скрыть раздел \"Друзья\"', 'HIDE_FRIENDS', 'bool', 'false'),
(7, 'Скрыть раздел \"Корпоративы\"', 'HIDE_CORP', 'bool', 'true'),
(8, 'Скрыть раздел \"Главная\"', 'HIDE_MAIN', 'bool', 'false'),
(9, 'Скрыть раздел \"Правила\"', 'HIDE_TERMS', 'bool', 'false'),
(10, 'Закрывать регистрацию за N часов до начала игры', 'GAME_CLOSE', 'int', '4'),
(11, 'Скрыть раздел \"Расписание\"', 'HIDE_SCHEDULE', 'bool', 'false'),
(12, 'Стоимость игры по умолчанию', 'DEFAULT_GAME_PRICE', 'string', '300 руб/чел');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `pass`, `is_locked`) VALUES
(1, 'admin', '*027011E607535B7EC88190C1299032C3AF63CF53', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

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
-- Индексы таблицы `feedback`
--
ALTER TABLE `feedback`
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
-- Индексы таблицы `question`
--
ALTER TABLE `question`
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
-- AUTO_INCREMENT для таблицы `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `game`
--
ALTER TABLE `game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=396;

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
-- AUTO_INCREMENT для таблицы `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
