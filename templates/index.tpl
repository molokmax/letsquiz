<!DOCTYPE html>
<html lang="ru">
	<head>
		<!--<base href="..">-->
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/2.1.19/css/materialdesignicons.min.css" integrity="sha256-L3NrnCWf0Pw+HvXutUdR0Vlj4pI5pM2s7tijm55+DzU=" crossorigin="anonymous" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
		<!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" integrity="sha256-ENFZrbVzylNbgnXx0n3I1g//2WeO47XxoPe0vkp3NC8=" crossorigin="anonymous" />-->
		<link href="pnotify.custom.min.css" media="all" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="style.css">
		
		<title>Let's QUIZ!</title>
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
				</ul>
			</div>
		</nav>
{if $SETTING_HIDE_MAIN eq 'false'}
		<div id="main" class="main container quiz-block-container">
			<div class="container quiz-block">
				<div class="row">
					<div class="col-md-12">
						<div class="main-header">ИНТЕЛЛЕКТУАЛЬНО-РАЗВЛЕКАТЕЛЬНАЯ БИТВА</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 offset-md-2">
						<div class="contacts">
							<div class="phone">{$SETTING_PHONE}</div>
							<div class="email"><a href="mailto:{$SETTING_EMAIL}">{$SETTING_EMAIL}</a></div>
							<div class="text">Оставь заявку на обратный звонок и мы перезвоним</div>
							<button type="button" class="btn btn-light quiz-button" data-toggle="modal" data-target="#callbackWindow">Обратный звонок</button>
						</div>
						<div class="socialbuttons hidden-md-down">
							<a href="https://vk.com/letsquiz" target="_blank"><img src="image/vk.png"></a>
							<a href="https://www.instagram.com/lets_quiz/" target="_blank"><img src="image/instagram.png"></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="main-logo"></div>
					</div>
					<div class="col-md-2">
						<div class="signup">
							<div class="text text-right">Ближайшая игра состоится {$NEXT_GAME}</div>
							<div class="text text-right">Зарегистрируйся на игру прямо сейчас!</div>
							<button type="button" class="btn btn-light quiz-button float-right" data-toggle="modal" data-target="#registrationWindow">Онлайн-регистрация</button>
						</div>
					<div class="cert">
						<div class="text text-right">Ты можешь приобрести подарочные сертификаты на наши игры</div>
						<button type="button" class="btn btn-light quiz-button float-right" data-toggle="modal" data-target="#certificateWindow">Сертификаты</button>
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
					<div class="col-md-12">
						<div class="quiz-header">ЧТО ТАКОЕ LET'S QUIZ?</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-9 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-timer"></i> 2,5 часа игры каждые 2 недели по воскресеньям</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-9 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-account-multiple-outline"></i> От 2 до 9 человек в команде</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-9 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-comment-question-outline"></i> 7 раундов с интересными вопросами на логику, интуицию и удачу!</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-9 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-gift"></i> Крутые призы от наших партнеров для победителей и призеров</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-9 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-food"></i> Еда, напитки, неповторимая атмосфера и заряд позитива</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-9 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-cake"></i> Повод встретиться с друзьями не только на День Рождения</div>
					</div>
				</div>
			</div>
			<div class="container quiz-block block-light">
				<div class="row">
					<!--<div class="col-md-4"></div>-->
					<div class="col-md-12">
						<div class="main-text">Наша цель - позитивный вечер, а не взрыв мозга!</div>
					</div>
					<!--<div class="col-md-4"></div>-->
				</div>
				<div class="row">
					<div class="col-md-7"></div>
					<div class="col-md-3 text-right">
						<div class="text">Хочешь сыграть в LET'S QUIZ?</div>
						<button type="button" class="btn btn-dark quiz-button float-right" data-toggle="modal" data-target="#registrationWindow">Онлайн-регистрация</button>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
			<div class="details container quiz-block block-dark">
				<div class="row">
					<div class="col-md-12">
						<div class="quiz-header light">А ТЕПЕРЬ ПОДРОБНЕЕ</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-9 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-lead-pencil"></i> Для вашей команды забронирован стол, на котором лежит все необходимое для игры</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-9 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-account-multiple-plus-outline"></i> В зале находится более 15-ти команд</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-9 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-emoticon-excited"></i> Вы пьете, кушаете и весело проводите время в своей компании</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-9 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-voice"></i> Ведущий зачитывает вопросы, которые дублируются на экранах</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-9 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-wallet-membership"></i> После жаркого командного обсуждения, правильный ответ записывается в бланк</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-9 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-information-outline"></i> Сдаем бланки и узнаем правильные ответы</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-9 offset-md-3">
						<div class="quiz-item"><i class="quiz-icon mdi mdi-trophy-outline"></i> Победитель определяется после 7-ми раундов игры (39 вопросов)</div>
					</div>
				</div>
			</div>
			<div class="faq container quiz-block block-light">
				<div class="row">
					<div class="col-md-4 offset-md-2">
						<div class="quiz-title"><i class="quiz-icon mdi mdi-check-circle-outline"></i>Что нужно взять с собой?</div>
						<div class="quiz-item">1) компанию друзей</div>
						<div class="quiz-item">2) хорошее настроение</div>
					</div>
					<div class="col-md-4">
						<div class="quiz-title"><i class="quiz-icon mdi mdi-close-circle-outline"></i>Что не нужно брать с собой?</div>
						<div class="quiz-item">1) энциклопедии</div>
						<div class="quiz-item">2) успокоительные</div>
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
					<div class="col-md-8"></div>
					<div class="col-md-2">
						<button type="button" class="btn btn-light quiz-button float-right" data-toggle="modal" data-target="#questionWindow">Примеры вопросов</button>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
{/if}
{if $SETTING_HIDE_FRIENDS eq 'false'}
		<div id="friends" class="friends container quiz-block-container">
			<div class="friends-block container quiz-block block-light">
				<div class="row">
					<div class="col-md-12">
						<div class="quiz-header dark">НАШИ ДРУЗЬЯ И ПАРТНЕРЫ</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 offset-md-3">
						<div class="quiz-panel panel-light"><a href="https://stupino.mosigra.ru/" target="_blank"><img src="image/logo-mosigra.png"></a></div>
					</div>
					<div class="col-md-3">
						<div class="quiz-panel panel-light"><a href="https://vk.com/shizgarastupino" target="_blank"><img src="image/logo-shizgara.png"></a></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 offset-md-3">
						<div class="quiz-panel panel-light"><a href="https://www.instagram.com/artiko_print/" target="_blank"><img src="image/logo-artiko.png"></a></div>
					</div>
					<div class="col-md-3">
						<div class="quiz-panel panel-light"><a href="https://vk.com/pobeda22_stupino" target="_blank"><img src="image/logo-pobeda.png"></a></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 offset-md-3">
						<div class="quiz-panel panel-light"><a href="https://fotopodarkist.ru/" target="_blank"><img src="image/logo-photo.png"></a></div>
					</div>
					<div class="col-md-3">
						<div class="quiz-panel panel-light"><a href="https://vk.com/m.ugli" target="_blank"><img src="image/logo-mugli.png"></a></div>
					</div>
				</div>
			</div>
		</div>
{/if}
{if $SETTING_HIDE_CORP eq 'false'}
		<div id="corp" class="corp container quiz-block-container">
			<div class="corp-block container quiz-block block-dark">
				<div class="row">
					<div class="col-md-12">
						<div class="quiz-header">КВИЗ НА КОРПОРАТИВ</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 offset-md-3">
						<div class="main-text">LET'S QUIZ - отличный вариант для корпоратива или сплочения команды (team building)! Это могут подтвердить компании, которые уже работали с нами:</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 offset-md-3">
						<div class="quiz-panel quiz-panel-no-img panel-dark"><a href="#">MARS Chocolate</a></div>
					</div>
					<div class="col-md-3">
						<div class="quiz-panel quiz-panel-no-img panel-dark"><a href="#">Kimberly-Clark</a></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 offset-md-3">
						<div class="quiz-panel quiz-panel-no-img panel-dark"><a href="#">ДОЛ им. Ю.А. Гагарина</a></div>
					</div>
					<div class="col-md-3">
						<div class="quiz-panel quiz-panel-no-img panel-dark"><a href="#">MARS Food</a></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 offset-md-3">
						<div class="quiz-panel quiz-panel-no-img panel-dark"><a href="#">Мастокройф</a></div>
					</div>
					<div class="col-md-3">
						<div class="quiz-panel quiz-panel-no-img panel-dark"><a href="#">Радиал-С</a></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8"></div>
					<div class="col-md-2">
						<div class="text text-right">Оставь заявку чтобы узнать подробности</div>
						<button type="button" class="btn btn-light quiz-button float-right" data-toggle="modal" data-target="#callbackWindow">Обратный звонок</button>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
{/if}
{if $SETTING_HIDE_FEEDBACK eq 'false'}
		<div id="feedback" class="feedback container quiz-block-container">
			<div class="container quiz-block block-dark">
				<div class="row">
					<div class="col-md-12">
						<div class="quiz-header">ОТЗЫВЫ НАШИХ УЧАСТНИКОВ</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8 offset-md-2">
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
					<div class="col-md-12">
						<div class="footer-text text">Наши контакты:</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="footer-text phone">{$SETTING_PHONE}</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="footer-text email"><a href="mailto:{$SETTING_EMAIL}">{$SETTING_EMAIL}</a></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="footer-text text">Мы в соц. сетях:</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
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
						<div class="quiz-window-title">Оставь номер телефона и мы перезвоним</div>
						<label for="callback-name">Имя:</label>
						<input type="text" class="form-control" id="callback-name" aria-describedby="callback-name" placeholder="Как к тебе обращаться">
						<label for="callback-phone">Телефон:</label>
						<input type="tel" class="form-control" id="callback-phone" aria-describedby="callback-phone" placeholder="Как с тобой связаться">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-light quiz-button call-send-button" data-dismiss="modal">Отправить</button>
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
						<div class="quiz-window-title">Ты можешь приобрести подарочный сертификат. Оставь заявку и мы перезвоним</div>
						<label for="cert-name">Имя:</label>
    					<input type="text" class="form-control" id="cert-name" aria-describedby="cert-name" placeholder="Как к тебе обращаться">
						<label for="cert-phone">Телефон:</label>
    					<input type="tel" class="form-control" id="cert-phone" aria-describedby="cert-phone" placeholder="Как с тобой связаться">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-light quiz-button cert-send-button" data-dismiss="modal">Отправить</button>
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
						<div class="quiz-window-title">Выбери игру на которую хочешь записаться</div>
						<div id="carousel-registration" class="carousel slide" data-ride="carousel" data-interval=false>
							<div class="carousel-inner" role="listbox">
{foreach from=$GAME_LIST item=game name=games}
								<div class="carousel-item {if $smarty.foreach.games.first}active{/if}">
									<div class="d-block registration-item container">
										<div class="row">
											<div class="quiz-game-card col-md-12 col-12" data-game-id="{$game->id}" data-game-fulldate="$game->full_date">
												<div class="registration-city">{$game->city}</div>
												<div class="registration-date">{$game->date}</div>
												<div class="registration-day">{$game->day_name}</div>
												<div class="registration-time">{$game->time}</div>
											</div>
										</div>
									</div>
								</div>
{/foreach}
							</div>
							<a class="carousel-control-prev" href="#carousel-registration" role="button" data-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="carousel-control-next" href="#carousel-registration" role="button" data-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
						<label for="reg-name">Название команды</label>
    					<input type="text" class="form-control" id="reg-name" aria-describedby="reg-name" placeholder="">
						<label for="reg-count">Количество человек</label>
    					<select class="form-control" id="reg-count">
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
    					<input type="text" class="form-control" id="reg-capitan" aria-describedby="reg-phone" placeholder="">
						<label for="reg-phone">Телефон</label>
    					<input type="tel" class="form-control" id="reg-phone" aria-describedby="reg-phone" placeholder="">
						<div class="quiz-window-text">Стоимость участия - 300 руб/чел</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-light quiz-button reg-send-button" data-dismiss="modal">Отправить</button>
					</div>
				</div>
			</div>
		</div>
		
	
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
		<!--<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>-->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>
		<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js" integrity="sha256-3blsJd4Hli/7wCQ+bmgXfOdK7p/ZUMtPXY08jmxSSgk=" crossorigin="anonymous"></script>-->
		<script type="text/javascript" src="pnotify.custom.min.js"></script>
		<script src="app.js"></script>
	</body>
</html>