<!DOCTYPE html>
<html lang="ru">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<link rel="icon" type="image/png" href="image/favicon16.png" sizes="16x16">
		<link rel="icon" type="image/png" href="image/favicon32.png" sizes="32x32">
		<link rel="icon" type="image/png" href="image/favicon64.png" sizes="64x64">

		<meta property="og:title" content="LET'S КВИЗ!" />
		<meta property="og:image" content="https://letsquiz.ru/photo/Jzscf5qA8Nw.jpg" />

		<link rel="stylesheet" href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css" />
		<link href="vendor/bootstrap/bootstrap.min.css" rel="stylesheet" />
		<link href="vendor/slick/slick.css" rel="stylesheet" />
		<link href="vendor/slick/slick-theme.css" rel="stylesheet" />
		<link href="style.css?{$SETTING_SYSTEM_VERSION_NUMBER}" rel="stylesheet" type="text/css" />
		
		<title>ЛЕТС КВИЗ!</title>
	</head>
	<body data-spy="scroll" data-target=".quiz-menu">
		<!-- Yandex.Metrika counter -->
{if $SETTING_METRIKA_ENABLED eq 'true'}
		<script type="text/javascript" src="metrika.js"></script>
		<noscript><div><img src="https://mc.yandex.ru/watch/54485767" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
{/if}
		<!-- /Yandex.Metrika counter -->
		<div class="page-block"></div>
		<nav class="quiz-menu">
			<div class="menu-content closed"> <!--  d-none d-md-block  -->
				<div type="button" class="collapse-button mdi mdi-menu"></div>
				<div class="menu-info-block">
					<div class="menu-info-text">Интеллектуально- развлекательная битва</div>
				</div>
				<div class="menu-title-block">
					<div class="menu-title-text">ЛЕТС КВИЗ</div>
				</div>
			</div>
			<div class="menu-content opened">
				<div class="menu-content-opened-container">
					<div class="menu-header-block">
						<div type="button" class="collapse-button mdi mdi-menu"></div>
						<div class="menu-header-text">Меню</div>
					</div>
					<div class="menu-items-block">
						<ul class="navbar-nav nav">
							{if $SETTING_HIDE_MAIN eq 'false'}
							<li class="nav-item">
								<a class="nav-link" href="#main">Главная</a>
							</li>
							{/if}
							{if $SETTING_HIDE_SCHEDULE eq 'false'}
							<li class="nav-item">
								<a class="nav-link" href="#schedule">Расписание игр</a>
							</li>
							{/if}
						</ul>
						<ul class="navbar-nav nav">
							{if $SETTING_HIDE_TERMS eq 'false'}
							<li class="nav-item">
								<a class="nav-link" href="#terms">Что такое квиз?</a>
							</li>
							{/if}
							{if $SETTING_HIDE_TERMS eq 'false'}
							<li class="nav-item">
								<a class="nav-link" href="#rules">Как проходит игра?</a>
							</li>
							{/if}
							{if $SETTING_HIDE_GALLERY eq 'false'}
							<li class="nav-item">
								<a class="nav-link" href="#gallery">Фото</a>
							</li>
							{/if}
							{if $SETTING_HIDE_CORP eq 'false'}
							<li class="nav-item">
								<a class="nav-link" href="#corp">Корпоративы</a>
							</li>
							{/if}
							<li class="nav-item">
								<a class="nav-link" href="#footer">Контакты</a>
							</li>
						</ul>
					</div>
					<div class="menu-callback-block">
						<img class="callback-info" src="image/callback-info.png" alt="Нажми и мы перезвоним">
						<button type="button" class="quiz-button quiz-button--light callback-button" data-toggle="modal" data-target="#callbackWindow">Обратный звонок</button>
					</div>
					<div class="menu-contact-block">
						<div><a href="https://vk.com/letsquiz" target="_blank"><img class="menu-contact-block-link" src="image/vk4.png" alt="VK"></a></div>
						<div><a href="https://instagram.com/lets_quiz" target="_blank"><img class="menu-contact-block-link" src="image/instagram2.png" alt="Instagram"></a></div>
						<div class="menu-contact-block-phone"><a href="tel:{$SETTING_PHONE}">{$SETTING_PHONE}</a></div>
					</div>
				</div>
			</div>
		</nav>

{if $SETTING_HIDE_MAIN eq 'false'}
		<div id="main" class="main container quiz-block-container">
			<div class="container quiz-block">
				<div class="row main-block-desktop">
					<div class="col-12 text-center">
						<button type="button" class="quiz-button quiz-button--light main-page-button city-button" data-toggle="modal" data-target="#selectCityWindow"><i class="select-city-icon mdi mdi-map-marker-outline"></i> <span class="city-name">Выбрать город</span></button>
						<a href="#schedule" role="button" class="btn quiz-button quiz-button--pink main-page-button schedule-button">ХОЧУ ИГРАТЬ</a>
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
					<div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
						<div class="row list-schedule">
{foreach from=$GAME_LIST item=game name=games}
							<div class="quiz-game-card-container col-lg-4 col-md-6 col-12" data-city-name="{$game->city}">
								<div class="quiz-game-card game-color-{$game->color} {if $game->is_closed eq '1'}game-closed{/if}" 
									data-game-id="{$game->id}" data-city-id="{$game->city_id}" data-city-name="{$game->city}" data-place-id="{$game->place_id}" data-place-name="{$game->place}" data-is-online="{$game->is_online}" data-price="{$game->price}" data-date="{$game->date_short}, {$game->day_short_name} в {$game->time}" data-game-fulldate="{$game->full_date}">
									<div class="game-label game-name">{$game->game_name}</div>
									<div class="game-label game-city">
										<i class="game-label-icon mdi mdi-flag-outline"></i>{$game->city}{if $game->is_online eq '0'}, {$game->place}{/if}
									</div>
									<div class="game-label game-label">
										<i class="game-label-icon mdi mdi-calendar"></i>{$game->date_short}, {$game->day_short_name}
									</div>
									<div class="game-label game-date-block"> 
										<div class="game-label game-time">
											<i class="game-label-icon mdi mdi-clock-time-three-outline"></i>{$game->time}
										</div>
										<div class="game-label game-price">
											<i class="game-label-icon game-label-svg-icon game-price-ruble"></i>
											{$game->price} руб.
										</div>
									</div>
									<div class="registration-button">
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
					<div class="d-none d-md-block col-lg-8 offset-lg-2 col-md-10 offset-md-1">
						<div class="quiz-schedule-ad">
							<div class="quiz-schedule-ad-text">ТВОИ ЭМОЦИИ, КОГДА ТЫ УСПЕЛ ПОДАТЬ ЗАЯВКУ НА СВОЕ ЛЮБИМОЕ ВРЕМЯ</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">	
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
		</div>
		<div id="rules" class="rules container quiz-block-container">
			<div class="details container quiz-block block-dark">
				<div class="row">
					<div class="col-md-5 offset-md-2">
						<div class="quiz-header light">КАК ВСЕ ЭТО ПРОИСХОДИТ?</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-2 offset-xl-1 col-lg-4 offset-lg-2 col-md-4 offset-md-2 col-10 offset-1">
						<div class="rule rule-1">
							<img src="image/bluepic_1.png">
							<div>Рассаживаем команды по 2-10 человек. Один стол - это одна команда</div>
						</div>
					</div>
					<div class="col-xl-2 offset-xl-0 col-lg-4 offset-lg-0 col-md-4 offset-md-0 col-10 offset-1">
						<div class="rule rule-2">
							<img src="image/bluepic_2.png">
							<div>Вас ждут 2 часа игры, 7 раундов. Каждый раунд имеет свою особенность</div>
						</div>
					</div>
					<div class="col-xl-2 offset-xl-0 col-lg-4 offset-lg-2 col-md-4 offset-md-2 col-10 offset-1">
						<div class="rule rule-3">
							<img src="image/bluepic_4.png">
							<div>
								Вопросы на различную тематику и разной сложности:
								<ul>
									<li>Музыка</li>
									<li>Кино</li>
									<li>Спорт</li>
									<li>Общие знания</li>
									<li>Эрудиция</li>
									<li>Удача</li>
									<li>Логика</li>
									<li>... да что угодно!</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-xl-2 offset-xl-0 col-lg-4 offset-lg-0 col-md-4 offset-md-0 col-10 offset-1">
						<div class="rule rule-4">
							<img src="image/bluepic_3.png">
							<div>Думаем всей командой, затем отвечаем на специальных бланках. После каждого раунда узнаем правильные ответы и зарабатываем очки!</div>
						</div>
					</div>
					<div class="col-xl-2 offset-xl-0 col-lg-4 offset-lg-2 col-md-4 offset-md-2 col-10 offset-1">
						<div class="rule rule-5">
							<img src="image/bluepic_5.png">
							<div>Награждаем победителей под овации зала!</div>
						</div>
					</div>
				</div>
				<div class="row faq-blocks">
					<div class="col-lg-4 offset-lg-2 col-sm-8 offset-sm-2 col-10 offset-1">
						<div class="faq-block good">
							<div class="quiz-title">Возьми с собой на игру</div>
							<div class="quiz-item">+ компанию друзей</div>
							<div class="quiz-item">+ хорошее настроение</div>
						</div>
					</div>
					<div class="col-lg-4 offset-lg-0 col-sm-8 offset-sm-2 col-10 offset-1">
						<div class="faq-block bad">
							<div class="quiz-title">Точно не стоит брать на игру</div>
							<div class="quiz-item">- энциклопедии</div>
							<div class="quiz-item">- успокоительные</div>
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
							<div class="photo-block col-lg-4 col-md-6 col-12">
								<img class="img-fluid" src="{$url}">
							</div>
{/foreach}
							<div class="photo-gallery-link col-lg-8 col-12">
								<div class="photo-gallery-link-background">
									<div class="photo-gallery-link-text">ЭТО, КОНЕЧНО, </br>НЕ ВСЕ ФОТОГРАФИИ... </br>ПОЛНЫЕ ФОТООТЧЁТЫ </br>СМОТРИ <a class="underlined-link" href="https://vk.com/letsquiz" target="_blank">ЗДЕСЬ</a> <a href="https://vk.com/letsquiz" target="_blank"><img class="photo-gallery-link-text-vk" src="image/vk4.png" alt="VK"></a></div>
								</div>
							</div>
						</div>
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
						<div class="corp-company-items">
							<div class="corp-company-item"><img src="/image/corp-logo-1.jpg"></div>
							<div class="corp-company-item"><img src="/image/corp-logo-2.jpg"></div>
							<div class="corp-company-item"><img src="/image/corp-logo-3.jpg"></div>
							<div class="corp-company-item"><img src="/image/corp-logo-4.jpg"></div>
							<div class="corp-company-item"><img src="/image/corp-logo-5.jpg"></div>
							<div class="corp-company-item"><img src="/image/corp-logo-6.jpg"></div>
							<div class="corp-company-item"><img src="/image/corp-logo-7.jpg"></div>
							<div class="corp-company-item"><img src="/image/corp-logo-8.jpg"></div>
							<div class="corp-company-item"><img src="/image/corp-logo-9.jpg"></div>
							<div class="corp-company-item"><img src="/image/corp-logo-10.jpg"></div>
							<div class="corp-company-item"><img src="/image/corp-logo-11.jpg"></div>
							<div class="corp-company-item"><img src="/image/corp-logo-12.jpg"></div>
							<div class="corp-company-item"><img src="/image/corp-logo-13.jpg"></div>
							<div class="corp-company-item"><img src="/image/corp-logo-14.jpg"></div>
							<div class="corp-company-item"><img src="/image/corp-logo-15.jpg"></div>
							<div class="corp-company-item"><img src="/image/corp-logo-16.jpg"></div>
							<div class="corp-company-item"><img src="/image/corp-logo-17.jpg"></div>
							<div class="corp-company-item"><img src="/image/corp-logo-18.jpg"></div>
							<div class="corp-company-item"><img src="/image/corp-logo-19.jpg"></div>
							<div class="corp-company-item"><img src="/image/corp-logo-20.jpg"></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="quiz-header we-can-do">ЧТО МЫ МОЖЕМ СДЕЛАТЬ?</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 offset-md-3">		
						<div class="row">
							<div class="col-12 col-md-6">
								<div class="corp-item">
									<i class="quiz-icon mdi mdi-toggle-switch"></i>Онлайн или Офлайн
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
									<img src="image/questions-text.png" alt="Остались вопросы?">
								</div>
							</div>
							<div class="col-12 col-md-6">
								<div class="corp-questions-buttons">
									<a href="/letsquiz-pr-kit.pdf" target="_blank" role="button" class="quiz-button quiz-button--dark corp-questions-button">НАШ PR-KIT</a>
									<a href="javascript:void(0);" data-toggle="modal" data-target="#callbackWindow" role="button" class="quiz-button quiz-button--dark corp-questions-button callback-button">ОБРАТНЫЙ ЗВОНОК</a>
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
					<div class="col-md-4 offset-md-2 col-11 offset-1">
						<div class="quiz-header">УЖЕ ГОТОВЫ К УВЛЕКАТЕЛЬНЫМ ИНТЕЛЛЕКТУАЛЬНЫМ БИТВАМ?</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8 offset-md-2 col-11 offset-1">
						<div class="footer-text footer-subheader">Вот как с нами связаться:</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8 offset-md-2 col-11 offset-1">
						<div class="row">
							<div class="col-sm-6 col-12">
								<div class="footer-text phone">
									<a href="tel:{$SETTING_PHONE}"><img class="footer-icon" src="image/phone.png"></a><a href="tel:{$SETTING_PHONE}">{$SETTING_PHONE}</a>
								</div>
								<div class="footer-text email">
									<a href="mailto:{$SETTING_EMAIL}"><img class="footer-icon" src="image/email.png"></a><a href="mailto:{$SETTING_EMAIL}">{$SETTING_EMAIL}</a>
								</div>
							</div>
							<div class="col-sm-6 col-12">
								<div class="footer-text social">
									<a href="https://vk.com/letsquiz" target="_blank"><img class="footer-icon" src="image/vk4.png"></a><a href="https://vk.com/letsquiz" target="_blank">vk.com/letsquiz</a>
								</div>
								<div class="footer-text social">
									<a href="https://www.instagram.com/lets_quiz/" target="_blank"><img class="footer-icon" src="image/instagram2.png"></a><a href="https://www.instagram.com/lets_quiz/" target="_blank">@lets_quiz</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
{/if}



<!--  Modal windows  -->

		<!-- Photo popup Window -->
		<div id="photoWindow" class="modal fade" aria-labelledby="PhotoWindowLabel" aria-hidden="true" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-xl" data-dismiss="modal">
				<div class="modal-content"  >              
					<div class="modal-body">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<img src="">
					</div> 
				</div>
			</div>
		</div>

		<!-- Select City Window -->
		<div class="quiz-window modal fade" id="selectCityWindow" tabindex="-1" role="dialog" aria-labelledby="SelectCityWindowTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span class="mdi mdi-close" aria-hidden="true"></span>
						</button>
						<h5 class="modal-title" id="selectCityWindowTitle">ГОРОД</h5>
					</div>
					<div class="quiz-modal-body">
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
							<button type="button" class="quiz-button quiz-button--pink select-city-button">
								Выбрать
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Callback Window -->
		<div class="quiz-window modal fade" id="callbackWindow" tabindex="-1" role="dialog" aria-labelledby="CallbackWindowTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span class="mdi mdi-close" aria-hidden="true"></span>
						</button>
						<h5 class="modal-title" id="callbackWindowTitle">ЗВОНОК</h5>
					</div>
					<div class="quiz-modal-body">
						<div class="modal-body">
							<form>
								<div class="quiz-window-title">Заполни форму и мы перезвоним Вам ;)</div>
								<input type="text" class="form-control" id="callback-name" required aria-describedby="callback-name" placeholder="Как к Вам обращаться">
								<input type="tel" class="form-control" id="callback-phone" required aria-describedby="callback-phone" placeholder="Телефон">
								<div class="error-container"></div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="quiz-button quiz-button--pink call-send-button">
								<span class="button-label">Отправить</span>
								<span class="loading spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 
							</button>
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
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span class="mdi mdi-close" aria-hidden="true"></span>
						</button>
						<h5 class="modal-title" id="registrationWindowTitle">ЗАПИСАТЬСЯ<span class="d-none d-md-inline"> НА ИГРУ</span></h5>
					</div>
					<div class="quiz-modal-body">
						<div class="modal-body">
							<form class="quiz-form">
								<div class="quiz-window-title">
									<div>Где: <span class="display-city"></span></div>
									<div>Когда: <span class="display-date"></span></div>
								</div>
								<input type="text" class="form-control" id="reg-name" required aria-describedby="reg-name" placeholder="Название команды">
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
									<option value="10">10</option>
								</select>
								<input type="text" class="form-control" id="reg-capitan" required aria-describedby="reg-capitan" placeholder="Капитан">
								<input type="tel" class="form-control" id="reg-phone" required aria-describedby="reg-phone" placeholder="Телефон">
								<input type="email" class="form-control" id="reg-email" required aria-describedby="reg-email" placeholder="Email">
								<div class="error-container"></div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="quiz-button quiz-button--pink reg-send-button">
								<span class="button-label">Отправить</span>
								<span class="loading spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="vendor/jquery/jquery-3.3.1.min.js"></script>
		<script src="vendor/bootstrap/bootstrap.min.js"></script>
		<script src="vendor/slick/slick.js"></script>
		<script src="app.js?{$SETTING_SYSTEM_VERSION_NUMBER}"></script>
	</body>
</html>