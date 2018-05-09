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
		<link rel="stylesheet" type="text/css" href="style-admin.css">
		
		<title>LET'S КВИЗ! (Админка)</title>
	</head>
	<body >
		
		<h1>Добро пожаловать в интерфейс администратора</h1>
		
		<div class="container" data-entity-type='GAME'>
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
						<td>
							<button type="button" class="btn btn-primary btn-sm crud-update" data-toggle="modal" data-target="#gameEditor">Изменить</button>
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
						<input class="field" type="hidden" name="id">
						<label for="game-date">Дата</label>
    					<input type="datetime" class="form-control field" id="game-date" name="date" aria-describedby="game-date" placeholder="">
						<label for="game-name">Название</label>
						<input type="text" class="form-control field" id="game-name" name="name" aria-describedby="game-name" placeholder="">
						<label for="game-city">Город</label>
    					<select class="form-control field" id="game-city" name="city_id">
{foreach from=$CITY_LIST item=city name=selector_cities}
							<option value="{$city->id}">{$city->name}</option>
{/foreach}
						</select>
						<label for="game-is_closed">Закрыто</label>
    					<input type="checkbox" class="form-control field" id="game-is_closed" name="is_closed" aria-describedby="game-is_closed" placeholder="">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary save-button">Сохранить</button>
						<!-- <button type="button" class="btn btn-light cancel-button">Отменить</button> -->
					</div>
				</div>
			</div>
		</div>




		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>
		<script type="text/javascript" src="pnotify/pnotify.custom.min.js"></script>
		<script src="admin.js"></script>
	</body>
</html>