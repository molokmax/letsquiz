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
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
		<link href="pnotify/pnotify.custom.min.css" media="all" rel="stylesheet" type="text/css" />

		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
  		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.0-alpha14/css/tempusdominus-bootstrap-4.min.css" />

		<link rel="stylesheet" type="text/css" href="style-admin.css">
		
		<title>LET'S КВИЗ! (Админка)</title>
	</head>
	<body >
		
		<h1>Добро пожаловать в интерфейс администратора</h1>
		
		<div class="container letsquiz-grid" data-entity-type='SETTING'>
			<h2>Настройки</h2>
			<!-- <button type="button" class="btn btn-success crud-create" data-toggle="modal" data-target="#settingEditor">Создать</button> -->
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Название</th>
						<th scope="col">Системное название</th>
						<th scope="col">Тип</th>
						<th scope="col">Значение</th>
						<th scope="col">Действие</th>
					</tr>
				</thead>
				<tbody>
	{foreach from=$SETTING_LIST item=setting name=settings}
					<tr class="record"
						data-record-id='{$setting->id}' 
						data-record-name='{$setting->name}' 
						data-record-prefix='{$setting->prefix}' 
						data-record-type='{$setting->type}' 
						data-record-value='{$setting->value}'>
						<td>{$setting->name}</td>
						<td>{$setting->prefix}</td>
						<td>{$setting->type}</td>
						<td>{$setting->value}</td>
						<td class="action-column">
							<button type="button" class="btn btn-primary btn-sm crud-update" data-toggle="modal" data-target="#settingEditor">Изменить</button>
							<!-- <button type="button" class="btn btn-danger btn-sm crud-delete">Удалить</button> -->
						</td>
					</tr>
	{/foreach}
				</tbody>
			</table>
		</div>

		<div class="container letsquiz-grid" data-entity-type='GAME'>
			<h2>Игры</h2>
			<button type="button" class="btn btn-success crud-create" data-toggle="modal" data-target="#gameEditor">Создать</button>
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Дата</th>
						<th scope="col">Номер</th>
						<th scope="col">Город</th>
						<th scope="col">Закрыто</th>
						<th scope="col">Действие</th>
					</tr>
				</thead>
				<tbody>
	{foreach from=$GAME_LIST item=game name=games}
					<tr class="record"
						data-record-id='{$game->id}' 
						data-record-date='{$game->date}' 
						data-record-name='{$game->game_name}' 
						data-record-city_id='{$game->city_id}' 
						data-record-city='{$game->city}'
						data-record-is_closed='{$game->is_closed}'>
						<td>{$game->date}</td>
						<td>{$game->game_name}</td>
						<td>{$game->city}</td>
						<td>{$game->is_closed}</td>
						<td class="action-column">
							<button type="button" class="btn btn-primary btn-sm crud-update" data-toggle="modal" data-target="#gameEditor">Изменить</button>
							<button type="button" class="btn btn-danger btn-sm crud-delete">Удалить</button>
						</td>
					</tr>
	{/foreach}
				</tbody>
			</table>
		</div>


		<div class="container letsquiz-grid" data-entity-type='PHOTO'>
			<h2>Фотографии</h2>
			<button type="button" class="btn btn-success crud-create" data-toggle="modal" data-target="#photoEditor">Создать</button>
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Фото</th>
						<th scope="col">URL</th>
						<th scope="col">Порядок</th>
						<th scope="col">Действие</th>
					</tr>
				</thead>
				<tbody>
	{foreach from=$PHOTO_LIST item=photo name=photos}
					<tr class="record"
						data-record-id='{$photo->id}' 
						data-record-url='{$photo->url}' 
						data-record-order='{$photo->order}'>
						<td><a href="{$photo->url}" target="_blank"><img class="img-preview" src="{$photo->url}"></a></td>
						<td><a href="{$photo->url}" target="_blank">{$photo->url}</a></td>
						<td>{$photo->order}</td>
						<td class="action-column">
							<button type="button" class="btn btn-primary btn-sm crud-update" data-toggle="modal" data-target="#photoEditor">Изменить</button>
							<button type="button" class="btn btn-danger btn-sm crud-delete">Удалить</button>
						</td>
					</tr>
	{/foreach}
				</tbody>
			</table>
		</div>


		<div class="container letsquiz-grid" data-entity-type='FEEDBACK'>
			<h2>Отзывы</h2>
			<button type="button" class="btn btn-success crud-create" data-toggle="modal" data-target="#feedbackEditor">Создать</button>
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Текст</th>
						<th scope="col">Автор</th>
						<th scope="col">Действие</th>
					</tr>
				</thead>
				<tbody>
	{foreach from=$FEEDBACK_LIST item=feedback name=feedbacks}
					<tr class="record"
						data-record-id='{$feedback->id}' 
						data-record-text='{$feedback->text}' 
						data-record-author='{$feedback->author}'>
						<td>{$feedback->text}</td>
						<td>{$feedback->author}</td>
						<td class="action-column">
							<button type="button" class="btn btn-primary btn-sm crud-update" data-toggle="modal" data-target="#feedbackEditor">Изменить</button>
							<button type="button" class="btn btn-danger btn-sm crud-delete">Удалить</button>
						</td>
					</tr>
	{/foreach}
				</tbody>
			</table>
		</div>


		<div class="container letsquiz-grid" data-entity-type='QUESTION'>
			<h2>Вопросы</h2>
			<button type="button" class="btn btn-success crud-create" data-toggle="modal" data-target="#questionEditor">Создать</button>
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Вопрос</th>
						<th scope="col">Ответ</th>
						<th scope="col">Порядок</th>
						<th scope="col">Действие</th>
					</tr>
				</thead>
				<tbody>
	{foreach from=$QUESTION_LIST item=question name=questions}
					<tr class="record"
						data-record-id='{$question->id}' 
						data-record-question='{$question->question}' 
						data-record-answer='{$question->answer}' 
						data-record-order='{$question->order}'>
						<td>{$question->question}</td>
						<td>{$question->answer}</td>
						<td>{$question->order}</td>
						<td class="action-column">
							<button type="button" class="btn btn-primary btn-sm crud-update" data-toggle="modal" data-target="#questionEditor">Изменить</button>
							<button type="button" class="btn btn-danger btn-sm crud-delete">Удалить</button>
						</td>
					</tr>
	{/foreach}
				</tbody>
			</table>
		</div>



		<!-- Modal windows -->

		<!-- Game editor -->
		<div class="editorWindow modal fade" id="gameEditor" tabindex="-1" role="dialog" aria-labelledby="GameEditorTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="gameEditorTitle">ИГРА</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span class="mdi mdi-close" aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<form>
							<input class="field" type="hidden" name="id">
							<div class="form-group">
								<label for="game-date">Дата</label>
								<div class="input-group date quiz-datetimepicker" id="game-date-group" data-target-input="nearest">
									<input type="text" class="form-control field datetimepicker-input" id="game-date" name="date" data-target="#game-date-group"/>
									<div class="input-group-append" data-target="#game-date-group" data-toggle="datetimepicker">
										<div class="input-group-text"><i class="fa fa-calendar"></i></div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="game-name">Название</label>
								<input type="text" class="form-control field" id="game-name" name="name" aria-describedby="game-name" placeholder="">
							</div>
							<div class="form-group">
								<label for="game-city">Город</label>
								<select class="form-control field" id="game-city" name="city_id">
	{foreach from=$CITY_LIST item=city name=selector_cities}
									<option value="{$city->id}">{$city->name}</option>
	{/foreach}
								</select>
							</div>
							<div class="form-group">
								<label for="game-is_closed">Закрыто</label>
								<input type="checkbox" class="form-control field" id="game-is_closed" name="is_closed" aria-describedby="game-is_closed" placeholder="">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary save-button">Сохранить</button>
					</div>
				</div>
			</div>
		</div>


		<!-- Feedback editor -->
		<div class="editorWindow modal fade" id="feedbackEditor" tabindex="-1" role="dialog" aria-labelledby="FeedbackEditorTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="feedbackEditorTitle">ОТЗЫВ</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span class="mdi mdi-close" aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<form>
							<input class="field" type="hidden" name="id">
							<div class="form-group">
								<label for="feedback-text">Текст</label>
								<textarea rows="5" class="form-control field" id="feedback-text" name="text" aria-describedby="feedback-text" placeholder=""></textarea>
							</div>
							<div class="form-group">
								<label for="feedback-author">Автор</label>
								<input type="text" class="form-control field" id="feedback-author" name="author" aria-describedby="feedback-author" placeholder="">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary save-button">Сохранить</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Question editor -->
		<div class="editorWindow modal fade" id="questionEditor" tabindex="-1" role="dialog" aria-labelledby="QuestionEditorTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="questionEditorTitle">ВОПРОС</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span class="mdi mdi-close" aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<form>
							<input class="field" type="hidden" name="id">
							<div class="form-group">
								<label for="question-question">Вопрос</label>
								<textarea rows="5" class="form-control field" id="question-question" name="question" aria-describedby="question-question" placeholder=""></textarea>
							</div>
							<div class="form-group">
								<label for="question-answer">Ответ</label>
								<input type="text" class="form-control field" id="question-answer" name="answer" aria-describedby="question-answer" placeholder="">
							</div>
							<div class="form-group">
								<label for="question-order">Порядок</label>
								<input type="number" class="form-control field" id="question-order" name="order" aria-describedby="question-order" placeholder="">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary save-button">Сохранить</button>
					</div>
				</div>
			</div>
		</div>

		
		<!-- Photo editor -->
		<div class="editorWindow modal fade" id="photoEditor" tabindex="-1" role="dialog" aria-labelledby="PhotoEditorTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="photoEditorTitle">ФОТОГРАФИЯ</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span class="mdi mdi-close" aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<!-- <form enctype="multipart/form-data" action="__URL__" method="POST"> -->
						<form>
							<input class="field" type="hidden" name="id">
							<div class="form-group">
								<label for="photo-url">Фото</label>
								<input type="file" accept="image/jpeg" class="form-control field" id="photo-url" name="url" aria-describedby="photo-url" placeholder="">
							</div>
							<div class="form-group">
								<label for="photo-order">Порядок</label>
								<input type="number" class="form-control field" id="photo-order" name="order" aria-describedby="photo-order" placeholder="">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary save-button">Сохранить</button>
					</div>
				</div>
			</div>
		</div>


		<!-- Setting editor -->
		<div class="editorWindow modal fade" id="settingEditor" tabindex="-1" role="dialog" aria-labelledby="SettingEditorTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="settingEditorTitle">НАСТРОЙКА</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span class="mdi mdi-close" aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<form>
							<input class="field" type="hidden" name="id">
							<div class="form-group">
								<label for="setting-name">Название</label>
								<input type="text" readonly class="form-control field" id="setting-name" name="name" aria-describedby="setting-name" placeholder="">
							</div>
							<div class="form-group">
								<label for="setting-value">Значение</label>
								<input type="text" class="form-control field" id="setting-value" name="value" aria-describedby="setting-value" placeholder="">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary save-button">Сохранить</button>
					</div>
				</div>
			</div>
		</div>
	
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>
		<script type="text/javascript" src="pnotify/pnotify.custom.min.js"></script>

		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.1/moment-with-locales.min.js" integrity="sha256-ZykW30UBCXWkPGsVyVPdJlUrce9/PawgYCEzinA4pnU=" crossorigin="anonymous"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.0-alpha14/js/tempusdominus-bootstrap-4.min.js"></script>
		
		<script src="admin.js"></script>
	</body>
</html>