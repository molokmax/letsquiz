<!DOCTYPE html>
<html lang="ru">
	<head>
		<!--<base href="..">-->
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<link rel="icon" type="image/png" href="image/favicon16.png" sizes="16x16">
		<link rel="icon" type="image/png" href="image/favicon32.png" sizes="32x32">
		<link rel="icon" type="image/png" href="image/favicon64.png" sizes="64x64">

		<meta property="og:title" content="LET'S КВИЗ!" />
		<meta property="og:image" content="http://letsquiz.ru/photo/Jzscf5qA8Nw.jpg" />

		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/2.1.19/css/materialdesignicons.min.css" integrity="sha256-L3NrnCWf0Pw+HvXutUdR0Vlj4pI5pM2s7tijm55+DzU=" crossorigin="anonymous" />
		<link href="vendor/bootstrap/bootstrap.min.css" rel="stylesheet" />
		<link href="vendor/pnotify/pnotify.custom.min.css" media="all" rel="stylesheet" type="text/css" />
		<link href="vendor/slick/slick.css" rel="stylesheet" />
		<link href="vendor/slick/slick-theme.css" rel="stylesheet" />
		<link href="style.css" rel="stylesheet" />
		
		<title>LET'S КВИЗ!</title>
	</head>
	<body data-spy="scroll" data-target=".quiz-menu">
		<nav class="quiz-menu navbar navbar-expand-lg sticky-top">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="quiz-menu-button mdi mdi-menu"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav nav">
{if $SETTING_HIDE_MAIN eq 'false'}
					<li class="nav-item">
						<a class="nav-link" href="#main">Главная</a>
					</li>
{/if}
{if $SETTING_HIDE_TERMS eq 'false'}
					<li class="nav-item">
						<a class="nav-link" href="#terms">Правила</a>
					</li>
{/if}
{if $SETTING_HIDE_GALLERY eq 'false'}
					<li class="nav-item">
						<a class="nav-link" href="#gallery">Галерея</a>
					</li>
{/if}
{if $SETTING_HIDE_FRIENDS eq 'false'}
					<li class="nav-item">
						<a class="nav-link" href="#friends">Друзья и партнеры</a>
					</li>
{/if}
{if $SETTING_HIDE_CORP eq 'false'}
					<li class="nav-item">
						<a class="nav-link" href="#corp">Корпоративы</a>
					</li>
{/if}
{if $SETTING_HIDE_FEEDBACK eq 'false'}
					<li class="nav-item">
						<a class="nav-link" href="#feedback">Отзывы</a>
					</li>
{/if}
					<li class="nav-item">
						<a class="nav-link" href="#footer">Контакты</a>
					</li>
				</ul>
			</div>
			<div class="selectCityBlock">
				<ul class="navbar-nav nav">
					<li class="selected-city">
						<i class="mdi mdi-city"></i> <a class="selected-city-link" href="javascript:void(0);" data-toggle="modal" data-target="#selectCityWindow">Все</a>
					</li>
				</ul>
			</div>
		</nav>
{if $SETTING_HIDE_MAIN eq 'false'}
		<div id="main" class="main container quiz-block-container">
			<div class="container quiz-block">
				<div class="row">
					<div class="col-md-12">
						<div class="main-header">ИНТЕЛЛЕКТУАЛЬНО-РАЗВЛЕКАТЕЛЬНАЯ </br> БИТВА</div>
					</div>
				</div>
				<div class="row main-block-desktop">
					<div class="col-md-4 offset-md-2">
						<div class="contacts">
							<div class="phone">{$SETTING_PHONE}</div>
							<button type="button" class="btn btn-light quiz-button" data-toggle="modal" data-target="#callbackWindow">Обратный звонок</button>
						</div>
						<div class="socialbuttons">
							<a href="https://vk.com/letsquiz" target="_blank"><img src="image/vk.png"></a>
							<a href="https://www.instagram.com/lets_quiz/" target="_blank"><img src="image/instagram.png"></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="signup">
							<div class="text text-right">Расписание игр и регистрация</div>
							<a class="btn btn-light quiz-button float-right" href="#schedule">Хочу играть</a>
						</div>
						<div class="cert">
							<div class="text text-right">Подарочный сертификат</div>
							<button type="button" class="btn btn-light quiz-button float-right" data-toggle="modal" data-target="#certificateWindow">Приобрести</button>
						</div>
					</div>
				</div>
				<div class="row main-block-mobile">
					<div class="logo-placeholder"></div>
					<div class="col-12">
							<a class="btn btn-light quiz-button d-block mx-auto" href="#schedule">Хочу играть</a>
						</div>
					</div>
				</div>
			</div>
		</div>
{/if}
{if $SETTING_HIDE_SCHEDULE eq 'false'}
		<div id="schedule" class="schedule container quiz-block-container">
			<div class="photos container quiz-block block-light">
				<div class="row">
					<div class="col-12">
						<div class="quiz-header">РАСПИСАНИЕ ИГР</div>
					</div>
				</div>
				<div class="row address-list">
{foreach from=$ADDRESS_LIST item=address name=addresses}
					<div class="col-12">
						<div class="address-item" data-city-name="{$address->city_name}">{$address->city_name}, {$address->description}</div>
					</div>
{/foreach}
				</div>
				<div class="row">
					<div class="col-md-8 offset-md-2">
						<div class="carousel-schedule">
{foreach from=$GAME_LIST item=game name=games}
							<div class="quiz-game-card {if $game->is_closed eq '1'}game-closed{/if}" data-game-id="{$game->id}" data-city-name="{$game->city}" data-game-fulldate="{$game->full_date}">
								<div class="game-city">{$game->city}</div>
								<div class="game-name">Игра <b>{$game->game_name}</b></div>
								<div class="game-date">{$game->date}</div>
								<div class="game-day">{$game->day_name}</div>
								<div class="game-time">{$game->time}</div>
								<div class="registration-btn">
{if $game->is_closed eq '1'}
<span>Мест нет</span>
{else}
<a href="javascript:void(0);" data-toggle="modal" data-target="#registrationWindow">Регистрация</a>
{/if}
								</div>
							</div>
{/foreach}
						</div>					
						<div class="row list-schedule">
{foreach from=$GAME_LIST item=game name=games}
							<div class="quiz-game-card col-sm-5 col-11 {if $game->is_closed eq '1'}game-closed{/if}" data-game-id="{$game->id}" data-city-name="{$game->city}" data-game-fulldate="{$game->full_date}">
								<div class="game-city">{$game->city}</div>
								<div class="game-name">Игра <b>{$game->game_name}</b></div>
								<div class="game-date">{$game->date}</div>
								<div class="game-day">{$game->day_name}</div>
								<div class="game-time">{$game->time}</div>
								<div class="registration-btn">
{if $game->is_closed eq '1'}
										<span>Мест нет</span>
{else}
										<a href="javascript:void(0);" data-toggle="modal" data-target="#registrationWindow">Регистрация</a>
{/if}
								</div>
							</div>
{/foreach}
						</div>
					</div>
				</div>
			</div>
		</div>
{/if}
{if $SETTING_HIDE_TERMS eq 'false'}
		<div id="terms" class="terms container quiz-block-container">
			<div class="intro container quiz-block block-dark">
				<div class="row">
					<div class="col-12">
						<div class="quiz-header">ЧТО ТАКОЕ LET'S КВИЗ?</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-10 offset-sm-1 col-md-6 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-timer"></i>2,5 часа игры каждые 2 недели</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-10 offset-sm-1 col-md-6 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-account-multiple-outline"></i>От 2 до 9 человек в команде</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-10 offset-sm-1 col-md-6 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-comment-question-outline"></i>7 раундов с интересными вопросами на логику, интуицию и удачу!</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-10 offset-sm-1 col-md-6 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-gift"></i>Крутые призы от наших партнеров для победителей и призеров</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-10 offset-sm-1 col-md-6 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-food"></i>Еда, напитки, неповторимая атмосфера и заряд позитива</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-10 offset-sm-1 col-md-6 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-cake"></i>Повод встретиться с друзьями не только на День Рождения</div>
					</div>
				</div>
			</div>
			<div class="container quiz-block block-light">
				<div class="row">
					<!--<div class="col-md-4"></div>-->
					<div class="col-12">
						<div class="main-text">Наша цель - позитивный вечер, а не взрыв мозга!</div>
					</div>
					<!--<div class="col-md-4"></div>-->
				</div>
				<div class="row">
					<div class="col-12 col-md-10 text-right">
						<div class="text">Хочешь сыграть в LET'S КВИЗ?</div>
						<a class="btn btn-dark quiz-button float-right" href="#schedule">Онлайн-регистрация</a>
					</div>
					<div class="hidden-md-down col-md-2"></div>
				</div>
			</div>
			<div class="details container quiz-block block-dark">
				<div class="row">
					<div class="col-12">
						<div class="quiz-header light">А ТЕПЕРЬ ПОДРОБНЕЕ</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-10 offset-sm-1 col-md-6 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-lead-pencil"></i> Для вашей команды забронирован стол, на котором лежит все необходимое для игры</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-10 offset-sm-1 col-md-6 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-account-multiple-plus-outline"></i> В зале находится более 15-ти команд</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-10 offset-sm-1 col-md-6 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-emoticon-excited"></i> Вы думаете, пьёте, кушаете и весело проводите время в компании друзей</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-10 offset-sm-1 col-md-6 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-voice"></i> Ведущий зачитывает вопросы, которые дублируются на экранах</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-10 offset-sm-1 col-md-6 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-wallet-membership"></i> После жаркого командного обсуждения, правильный ответ записывается в бланк</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-10 offset-sm-1 col-md-6 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-information-outline"></i> Сдаем бланки и узнаем правильные ответы</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-10 offset-sm-1 col-md-6 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-trophy-outline"></i> Победитель определяется после 7-ми раундов игры (39 вопросов)</div>
					</div>
				</div>
			</div>
			<div class="faq container quiz-block block-light">
				<div class="row">
					<div class="col-12 col-md-4 offset-md-2">
						<div class="faq-block good">
							<div class="quiz-title"></i>Что нужно взять с собой?</div>  <!-- <i class="quiz-icon mdi mdi-check-circle-outline"> -->
							<div class="quiz-item"><i class="quiz-icon mdi mdi-plus"></i>компанию друзей</div>
							<div class="quiz-item"><i class="quiz-icon mdi mdi-plus"></i>хорошее настроение</div>
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="faq-block bad">
							<div class="quiz-title"></i>Что не нужно брать с собой?</div> <!-- <i class="quiz-icon mdi mdi-close-circle-outline"> -->
							<div class="quiz-item"><i class="quiz-icon mdi mdi-minus"></i>энциклопедии</div>
							<div class="quiz-item"><i class="quiz-icon mdi mdi-minus"></i>успокоительные</div>
						</div>
					</div>
				</div>
			</div>
		</div>
{/if}
{if $SETTING_HIDE_GALLERY eq 'false'}
		<div id="gallery" class="gallery container quiz-block-container">
			<div class="photos container quiz-block block-dark">
				<div class="row">
					<div class="col-md-8 offset-md-2">
						<div id="carousel-gallery" class="carousel slide" data-ride="carousel" data-interval=10000>
							<div class="carousel-inner" role="listbox">
{foreach from=$PHOTO_LIST item=url name=gallery}
								<div class="carousel-item {if $smarty.foreach.gallery.first}active{/if}">
									<img class="d-block img-fluid" src="{$url}">
								</div>
{/foreach}
							</div>
							<a class="carousel-control-prev" href="#carousel-gallery" role="button" data-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="carousel-control-next" href="#carousel-gallery" role="button" data-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-md-10">
						<button type="button" class="btn btn-light quiz-button float-right" data-toggle="modal" data-target="#questionWindow">Примеры вопросов</button>
					</div>
					<div class="hidden-md-down col-md-2"></div>
				</div>
			</div>
		</div>
{/if}
{if $SETTING_HIDE_FRIENDS eq 'false'}
		<div id="friends" class="friends container quiz-block-container">
			<div class="friends-block container quiz-block block-light">
				<div class="row">
					<div class="col-12">
						<div class="quiz-header dark">НАШИ ДРУЗЬЯ И ПАРТНЕРЫ</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-4 offset-sm-2 col-md-3 offset-md-3">
						<div class="quiz-panel panel-light"><a href="https://stupino.mosigra.ru/" target="_blank"><img src="image/logo-mosigra.png"></a></div>
					</div>
					<div class="col-12 col-sm-4 col-md-3">
						<div class="quiz-panel panel-light"><a href="https://vk.com/shizgarastupino" target="_blank"><img src="image/logo-shizgara.png"></a></div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-4 offset-sm-2 col-md-3 offset-md-3">
						<div class="quiz-panel panel-light"><a href="https://vk.com/m.ugli" target="_blank"><img src="image/logo-mugli.png"></a></div>
					</div>
					<div class="col-12 col-sm-4 col-md-3">
						<div class="quiz-panel panel-light"><a href="https://vk.com/pobeda22_stupino" target="_blank"><img src="image/logo-pobeda.png"></a></div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-4 offset-sm-2 col-md-3 offset-md-3">
						<div class="quiz-panel panel-light"><a href="https://fotopodarkist.ru/" target="_blank"><img src="image/logo-photo.png"></a></div>
					</div>
					<div class="col-12 col-sm-4 col-md-3">
						<div class="quiz-panel panel-light"><a href="https://www.instagram.com/artiko_print/" target="_blank"><img src="image/logo-artiko.png"></a></div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-4 offset-sm-2 col-md-3 offset-md-3">
						<div class="quiz-panel panel-light"><a href="http://www.perspektiva-pravo.ru/" target="_blank"><img src="image/logo-pravo.png"></a></div>
					</div>
					<div class="col-12 col-sm-4 col-md-3">
						<div class="quiz-panel panel-light"><a href="http://www.1litr-bar.ru/" target="_blank"><img src="image/logo-litr.png"></a></div>
					</div>
				</div>
			</div>
		</div>
{/if}
{if $SETTING_HIDE_CORP eq 'false'}
		<div id="corp" class="corp container quiz-block-container">
			<div class="corp-block container quiz-block block-dark">
				<div class="row">
					<div class="col-12">
						<div class="quiz-header">КВИЗ НА КОРПОРАТИВ</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-10 offset-sm-1 col-md-6 offset-md-3">
						<div class="main-text">LET'S КВИЗ - отличный вариант для корпоратива или сплочения команды (team building)! Это могут подтвердить компании, которые уже работали с нами:</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-4 offset-sm-2 col-md-3 offset-md-3">
						<div class="quiz-panel quiz-panel-no-img panel-dark"><a href="#">MARS Chocolate</a></div>
					</div>
					<div class="col-12 col-sm-4 col-md-3">
						<div class="quiz-panel quiz-panel-no-img panel-dark"><a href="#">Kimberly-Clark</a></div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-4 offset-sm-2 col-md-3 offset-md-3">
						<div class="quiz-panel quiz-panel-no-img panel-dark"><a href="#">ДОЛ им. Ю.А. Гагарина</a></div>
					</div>
					<div class="col-12 col-sm-4 col-md-3">
						<div class="quiz-panel quiz-panel-no-img panel-dark"><a href="#">MARS Food</a></div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-4 offset-sm-2 col-md-3 offset-md-3">
						<div class="quiz-panel quiz-panel-no-img panel-dark"><a href="#">Мастокройф</a></div>
					</div>
					<div class="col-12 col-sm-4 col-md-3">
						<div class="quiz-panel quiz-panel-no-img panel-dark"><a href="#">Радиал-С</a></div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-md-10">
						<div class="text text-right">Оставь заявку чтобы узнать подробности</div>
						<button type="button" class="btn btn-light quiz-button float-right" data-toggle="modal" data-target="#callbackWindow">Обратный звонок</button>
					</div>
					<div class="hidden-md-down col-md-2"></div>
				</div>
			</div>
		</div>
{/if}
{if $SETTING_HIDE_FEEDBACK eq 'false'}
		<div id="feedback" class="feedback container quiz-block-container">
			<div class="container quiz-block block-dark">
				<div class="row">
					<div class="col-12">
						<div class="quiz-header">ОТЗЫВЫ НАШИХ УЧАСТНИКОВ</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-10 offset-sm-1 col-md-6 offset-md-3">
						<div id="carousel-feedback" class="carousel slide" data-ride="carousel" data-interval=10000>
							<div class="carousel-inner" role="listbox">
{foreach from=$FEEDBACK_LIST item=feedback name=feedbacks}
								<div class="carousel-item {if $smarty.foreach.feedbacks.first}active{/if}">
									<div class="d-block">
										<div class="feedback-item">
											<div class="feedback-text">{$feedback->text}</div>
											<div class="feedback-author">{$feedback->author}</div>
										</div>
									</div>
								</div>
{/foreach}
							</div>
							<a class="carousel-control-prev" href="#carousel-feedback" role="button" data-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="carousel-control-next" href="#carousel-feedback" role="button" data-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
{/if}
		<div id="footer" class="footer container quiz-block-container">
			<div class="container quiz-block block-footer">
			
				<div class="row">
					<div class="col-12">
						<div class="footer-text text">Наши контакты:</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="footer-text phone">{$SETTING_PHONE}</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="footer-text email"><a href="mailto:{$SETTING_EMAIL}">{$SETTING_EMAIL}</a></div>
					</div>
				</div>

				<div class="row">
					<div class="col-12">
						<!-- <div class="main-text">Заявки, вопросы, предложения, корпоративные и выездные игры!</div> -->
						<div class="footer-text text">Заявки, вопросы, предложения, корпоративные и выездные игры!</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="footer-text text">Работаем круглосуточно и без выходных :)</div>
					</div>
				</div>

				<div class="row">
					<div class="col-12">
						<div class="footer-text text">Мы в соц. сетях:</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="socialbuttons footer-text">
							<a href="https://vk.com/letsquiz" target="_blank"><img src="image/vk.png"></a>
							<a href="https://www.instagram.com/lets_quiz/" target="_blank"><img src="image/instagram.png"></a>
						</div>
					</div>
				</div>
			</div>
		</div>



<!--  Modal windows  -->

		<!-- Callback Window -->
		<div class="quiz-window modal fade" id="callbackWindow" tabindex="-1" role="dialog" aria-labelledby="CallbackWindowTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="callbackWindowTitle">ОБРАТНЫЙ ЗВОНОК</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span class="mdi mdi-close" aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<form>
							<div class="quiz-window-title">Оставь номер телефона и мы перезвоним</div>
							<label for="callback-name">Имя:</label>
							<input type="text" class="form-control" id="callback-name" required aria-describedby="callback-name" placeholder="Как к тебе обращаться">
							<label for="callback-phone">Телефон:</label>
							<input type="tel" class="form-control" id="callback-phone" required aria-describedby="callback-phone" placeholder="Как с тобой связаться">
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-light quiz-button call-send-button">Отправить</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Select City Window -->
		<div class="quiz-window modal fade" id="selectCityWindow" tabindex="-1" role="dialog" aria-labelledby="SelectCityWindowTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="selectCityWindowTitle">Город</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span class="mdi mdi-close" aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<div class="quiz-window-title">Выбери свой город</div>
						<select class="form-control" id="city" aria-describedby="city">
							<option>Все</option>
{foreach from=$CITY_LIST item=city name=cities}
							<option>{$city}</option>
{/foreach}
						</select>
					</div>
					<div class="modal-footer">
						<!--data-dismiss="modal"-->
						<button type="button" class="btn btn-light quiz-button select-city-button">Выбрать</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Certificate Window -->
		<div class="quiz-window modal fade" id="certificateWindow" tabindex="-1" role="dialog" aria-labelledby="CertificateWindowTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="certificateWindowTitle">СЕРТИФИКАТЫ</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span class="mdi mdi-close" aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<form>
							<div class="quiz-window-title">Ты можешь приобрести подарочный сертификат. Оставь заявку и мы перезвоним</div>
							<label for="cert-name">Имя:</label>
							<input type="text" class="form-control" id="cert-name" required aria-describedby="cert-name" placeholder="Как к тебе обращаться">
							<label for="cert-phone">Телефон:</label>
							<input type="tel" class="form-control" id="cert-phone" required aria-describedby="cert-phone" placeholder="Как с тобой связаться">
						</form>
					</div>
					<div class="modal-footer">
						<!--data-dismiss="modal"-->
						<button type="button" class="btn btn-light quiz-button cert-send-button" >Отправить</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Question Example Window -->
		<div class="quiz-window modal fade" id="questionWindow" tabindex="-1" role="dialog" aria-labelledby="QuestionWindowTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="questionWindowTitle">ПРИМЕРЫ ВОПРОСОВ</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span class="mdi mdi-close" aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<div id="carousel-question" class="carousel slide" data-ride="carousel" data-interval=10000>
							<div class="carousel-inner" role="listbox">
{foreach from=$QUESTION_LIST item=question name=questions}
								<div class="carousel-item {if $smarty.foreach.questions.first}active{/if}">
									<div class="d-block">
										<div class="question-item">
											<div class="question-text">{$question->question}</div>
											<div class="question-answer-link-wrapper"><span class="question-answer-link">Ответ</span></div>
											<div class="question-answer-text-wrapper"><div class="question-answer-text">{$question->answer}</div></div>
										</div>
									</div>
								</div>
{/foreach}
							</div>
							<a class="carousel-control-prev" href="#carousel-question" role="button" data-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="carousel-control-next" href="#carousel-question" role="button" data-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Registration Window -->
		<div class="quiz-window modal fade" id="registrationWindow" tabindex="-1" role="dialog" aria-labelledby="RegistrationWindowTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="registrationWindowTitle">ЗАПИСАТЬСЯ НА ИГРУ</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span class="mdi mdi-close" aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<form>
							<div class="quiz-window-title">Заполни форму регистрации на игру в городе <span class="display-city"></span> <span class="display-date"></span> в <span class="display-time"></span></div>
							<label for="reg-name">Название команды</label>
							<input type="text" class="form-control" id="reg-name" required aria-describedby="reg-name" placeholder="">
							<label for="reg-count">Количество человек</label>
							<select class="form-control" id="reg-count" required>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
							</select>
							<label for="reg-capitan">Капитан</label>
							<input type="text" class="form-control" id="reg-capitan" required aria-describedby="reg-phone" placeholder="">
							<label for="reg-phone">Телефон</label>
							<input type="tel" class="form-control" id="reg-phone" required aria-describedby="reg-phone" placeholder="">
							<div class="quiz-window-text">Стоимость участия - 300 руб/чел</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-light quiz-button reg-send-button">Отправить</button>
					</div>
				</div>
			</div>
		</div>
		
	
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="vendor/jquery/jquery-3.3.1.min.js"></script>
		<script src="vendor/bootstrap/bootstrap.min.js"></script>
		<script src="vendor/pnotify/pnotify.custom.min.js"></script>
		<script src="vendor/slick/slick.js"></script>
		<script src="app.js"></script>
	</body>
</html>