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
		<meta property="og:image" content="https://letsquiz.ru/photo/Jzscf5qA8Nw.jpg" />

		<link rel="stylesheet" href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css" />
		<link href="vendor/bootstrap/bootstrap.min.css" rel="stylesheet" />
		<link href="vendor/pnotify/pnotify.custom.min.css" media="all" rel="stylesheet" type="text/css" />
		<link href="vendor/slick/slick.css" rel="stylesheet" />
		<link href="vendor/slick/slick-theme.css" rel="stylesheet" />
		<link href="style.css?{$SETTING_SYSTEM_VERSION_NUMBER}" rel="stylesheet" type="text/css" />
		
		<title>ЛЕТС КВИЗ!</title>
	</head>
	<body data-spy="scroll" data-target=".quiz-menu">
		<!-- Yandex.Metrika counter -->
		<!-- <script type="text/javascript" src="metrika.js"></script>
		<noscript><div><img src="https://mc.yandex.ru/watch/54485767" style="position:absolute; left:-9999px;" alt="" /></div></noscript> -->
		<!-- /Yandex.Metrika counter -->
<!--
		<nav class="quiz-menu navbar">
			<div class="intro-text">ЛЕТС КВИЗ</div>
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
-->

{if $SETTING_HIDE_MAIN eq 'false'}
		<div id="main" class="main container quiz-block-container">
			<div class="container quiz-block">
				<div class="row main-block-desktop">
					<div class="col-md-4 offset-md-2">
					</div>
					<div class="col-md-4">
					</div>
				</div>
				<div class="row main-block-mobile">
					<div class="logo-placeholder"></div>
						<div class="col-12">
						</div>
					</div>
				</div>
			</div>
		</div>
{/if}
{if $SETTING_HIDE_SCHEDULE eq 'false'}
		<div id="schedule" class="schedule container quiz-block-container">
			<div class="container quiz-block block-light">
				<div class="row">
					<div class="col-12">
						<div class="quiz-header">РАСПИСАНИЕ ИГР</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8 offset-md-2">				
						<div class="row list-schedule">
{foreach from=$GAME_LIST item=game name=games}
							<div class="quiz-game-card-container col-lg-4 col-md-6 col-sm-12" data-city-name="{$game->city}">
								<div class="quiz-game-card game-color-{$game->color} {if $game->is_closed eq '1'}game-closed{/if}" 
									data-game-id="{$game->id}" data-city-id="{$game->city_id}" data-city-name="{$game->city}" data-price="{$game->price}" data-game-fulldate="{$game->full_date}">
									<div class="game-label game-name">{$game->game_name}</div>
									<div class="game-label game-city">
										<i class="game-label-icon mdi mdi-flag-outline"></i>{$game->city}
									</div>
									<div class="game-label game-label">
										<i class="game-label-icon mdi mdi-calendar"></i>{$game->date_short}, {$game->day_short_name}
									</div>
									<div class="game-label game-date-block"> 
										<div class="game-label game-time">
											<i class="game-label-icon mdi mdi-clock-time-three-outline"></i>{$game->time}
										</div>
										<div class="game-label game-price">
											<i class="game-label-icon mdi mdi-currency-usd"></i>{$game->price} руб.
										</div>
									</div>
									<div class="registration-btn">
	{if $game->is_closed eq '1'}
											<span>МЕСТ НЕТ</span>
	{else}
											<a href="javascript:void(0);" data-toggle="modal" data-target="#registrationWindow">РЕГИСТРАЦИЯ</a>
	{/if}
									</div>
								</div>
							</div>
{/foreach}
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8 offset-md-2">
						<div class="quiz-schedule-ad">
							<div class="quiz-schedule-ad-text">ТВОИ ЭМОЦИИ, КОГДА ТЫ УСПЕЛ ПОДАТЬ ЗАЯВКУ НА СВОЕ ЛЮБИМОЕ ВРЕМЯ</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8 offset-md-2">	
						<div class="quiz-schedule-target-container">
							<span class="quiz-schedule-target-text">Наша цель - позитивный вечер, а не взрыв мозга!</span>
							<div class="quiz-schedule-target-tags">
								<div class="quiz-schedule-target-tag">#ноэтонеточно</div>
								<div class="quiz-schedule-target-tag">(с) Организаторы</div>
							</div>
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
					<div class="col-md-8 offset-md-2">
						<div class="row row-cols-2">		
							<div class="col">
								<div class="quiz-terms-header">ЧТО ТАКОЕ ЛЕТС КВИЗ?</div>
							</div>	
							<div class="col">
								<div class="quiz-terms-details">
									<div class="row">		
										<div class="col-12 quiz-terms-details-text">
											"ЛЕТС КВИЗ" - это интеллектуально- развлекательная викторина, цель которой - дружный и веселый праздник, а не взрыв мозга.
										</div>	
										<div class="col-12">
											<div class="quiz-terms-details-item">
												<i class="quiz-icon mdi mdi-record-circle"></i>2 часа интересного времяпрепровождения
											</div>
											<div class="quiz-terms-details-item">
												<i class="quiz-icon mdi mdi-record-circle"></i>Призы и подарки победителям
											</div>
											<div class="quiz-terms-details-item">
												<i class="quiz-icon mdi mdi-record-circle"></i>Универсальная игра для всех возрастов
											</div>
											<div class="quiz-terms-details-item">
												<i class="quiz-icon mdi mdi-record-circle"></i>Пригодятся любые знания (даже те, о которых вы забыли ;)
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
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
			<div class="photos container quiz-block block-light">
				<div class="row">
					<div class="col-12">
						<div class="quiz-header">ФОТОГРАФИИ</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8 offset-md-2">
						<div class="row photo-container">
{foreach from=$PHOTO_LIST item=url name=gallery}
							<div class="photo-block col-lg-4 col-md-6 col-sm-12">
								<img class="img-fluid" src="{$url}"> <!-- d-block -->
							</div>
{/foreach}
							<div class="photo-gallery-link col-lg-8 col-md-6 col-sm-12">
								<div class="photo-gallery-link-background">
									<div class="photo-gallery-link-text">ЭТО, КОНЕЧНО, </br>НЕ ВСЕ ФОТОГРАФИИ... </br>ПОЛНЫЕ ФОТООТЧЕТЫ </br>СМОТРИ ЗДЕСЬ <a href="https://vk.com/letsquiz" target="_blank"><img class="photo-gallery-link-text-vk" src="image/vk3.png" alt="VK"></a></div>
								</div>
							</div>
						</div>
					</div>
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
						<div class="quiz-panel panel-light"><a href="https://www.instagram.com/artiko_print/" target="_blank"><img src="image/logo-artiko.png"></a></div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-4 offset-sm-2 col-md-3 offset-md-3">
						<div class="quiz-panel panel-light"><a href="https://fotopodarkist.ru/" target="_blank"><img src="image/logo-photo.png"></a></div>
					</div>
					<div class="col-12 col-sm-4 col-md-3">
						<div class="quiz-panel panel-light"><a href="https://www.perspektiva-pravo.ru/" target="_blank"><img src="image/logo-pravo.png"></a></div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-4 offset-sm-2 col-md-3 offset-md-3">
						<div class="quiz-panel panel-light"><a href="https://yatort.ru/" target="_blank"><img src="image/logo-yatort.png"></a></div>
					</div>
					<div class="col-12 col-sm-4 col-md-3">
						<div class="quiz-panel panel-light"><a href="https://vk.com/kvartalbutovo" target="_blank"><img src="image/logo-kvartal.png"></a></div>
					</div>
				</div>
			</div>
		</div>
{/if}
{if $SETTING_HIDE_CORP eq 'false'}
		<div id="corp" class="corp container quiz-block-container">
			<div class="corp-block container quiz-block block-light">
				<div class="row">
					<div class="col-12">
						<div class="quiz-header">КОРПОРАТИВЫ</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 offset-md-3">
						<div class="corp-text">Уже сделали интеллектуально и весело таким компаниям как:</div>
						<div class="corp-text">КАРУСЕЛЬКА</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="quiz-header">ЧТО МЫ МОЖЕМ СДЕЛАТЬ?</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 offset-md-3">		
						<div class="row">
							<div class="col-12 col-md-6">
								<div class="corp-item">
									<i class="quiz-icon mdi mdi-toggle-switch"></i>Он-лайн или Офф-лайн
								</div>
								<div class="corp-item">
									<i class="quiz-icon mdi mdi-toggle-switch"></i>От 6 до бесконечности человек
								</div>
								<div class="corp-item">
									<i class="quiz-icon mdi mdi-toggle-switch"></i>Сложность Вы выбираете сами
								</div>
								<div class="corp-item">
									<i class="quiz-icon mdi mdi-toggle-switch"></i>Офис, бар, поле - приедем куда угодно
								</div>
							</div>
							<div class="col-12 col-md-6">
								<div class="corp-item">
									<i class="quiz-icon mdi mdi-toggle-switch"></i>Тематическая игра или раунд
								</div>
								<div class="corp-item">
									<i class="quiz-icon mdi mdi-toggle-switch"></i>Элементы игры в Вашем фирменном стиле
								</div>
								<div class="corp-item">
									<i class="quiz-icon mdi mdi-toggle-switch"></i>Можем организовать мероприятие "под ключ"
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 offset-md-3">		
						<div class="row">
							<div class="col-12 col-md-6">
								<div class="corp-questions-text">
									<img src="image/quiestions-text.png" alt="Остались вопросы?">
								</div>
							</div>
							<div class="col-12 col-md-6">
								<div class="corp-questions-buttons">
									<div class="corp-questions-button"><a href="javascript:void(0);" target="_blank">НАШ PR-KIT</a></div>
									<div class="corp-questions-button"><a href="javascript:void(0);" data-toggle="modal" data-target="#callbackWindow">ОБРАТНЫЙ ЗВОНОК</a></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
{/if}
{if $SETTING_HIDE_FOOTER eq 'false'}
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
{/if}


<!--  Modal windows  -->

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

		<!-- Registration Window -->
		<div class="quiz-window modal fade" id="registrationWindow" tabindex="-1" role="dialog" aria-labelledby="RegistrationWindowTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="registrationWindowTitle">ЗАПИСАТЬСЯ<span class="d-none d-md-inline"> НА ИГРУ</span></h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span class="mdi mdi-close" aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<form class="quiz-form">
							<div class="quiz-window-title online-game">
								Заполни форму регистрации на игру <span class="display-city"></span> <span class="display-date"></span> в <span class="display-time"></span> 
								(стоимость - <span class="display-price"></span>)
							</div>
							<div class="quiz-window-title offline-game">
								Заполни форму регистрации на игру в городе <span class="display-city"></span> <span class="display-date"></span> в <span class="display-time"></span> 
								(стоимость - <span class="display-price"></span>)
							</div>
							<!--<label for="reg-name">Название команды</label>-->
							<input type="text" class="form-control" id="reg-name" required aria-describedby="reg-name" placeholder="Название команды">
							<!--<label for="reg-count">Количество человек</label>-->
							<select class="form-control" id="reg-count" required>
								<option disabled selected value>Количество человек</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
							</select>
							<!--<label for="reg-capitan">Капитан</label>-->
							<input type="text" class="form-control" id="reg-capitan" required aria-describedby="reg-capitan" placeholder="Капитан">
							<!--<label for="reg-phone">Телефон</label>-->
							<input type="tel" class="form-control" id="reg-phone" required aria-describedby="reg-phone" placeholder="Телефон">
							<input type="email" class="form-control" id="reg-email" required aria-describedby="reg-email" placeholder="Email">
							<!--<div class="quiz-window-text">Стоимость участия - 300 руб/чел</div>-->
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
		<script src="app.js?{$SETTING_SYSTEM_VERSION_NUMBER}"></script>
	</body>
</html>