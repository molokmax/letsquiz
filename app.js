$(document).ready(function() {

    $("#questionWindow .question-answer-link").click(function(link) {
        $(link.currentTarget).parents(".question-item").find(".question-answer-text").toggle();
    });
    // $("#questionWindow").on('show.bs.modal', function(win) {
    //     if (!$(win.currentTarget).data("initialized")) {
    //         $(".question-answer-link").click(function(link) {
    //             $(link.currentTarget).parents(".question-item").children(".question-answer-text").toggle();
    //         });
    //         $(win.currentTarget).data("initialized", true);
    //     }
    // });
    $("#questionWindow").on('hidden.bs.modal', function(win) {
        $(".question-answer-text").hide();
    });

    // $("#registrationWindow").on('show.bs.modal', function(win) {
    //     if (!$(win.currentTarget).data("initialized")) {
    //         $(".quiz-game-card").click(function(link) {
    //             $(link.currentTarget).parents(".carousel-inner").find(".quiz-game-card").removeClass("selected");
    //             $(link.currentTarget).addClass("selected");
    //         });
    //         $(win.currentTarget).data("initialized", true);
    //     }
    // });

    $(".quiz-game-card").click(function(link) {
        $(link.currentTarget).parents(".carousel-inner").find(".quiz-game-card").removeClass("selected");
        $(link.currentTarget).addClass("selected");
    });
    $("#registrationWindow").on('hidden.bs.modal', function(win) {
        $(".quiz-game-card").removeClass("selected");
    });

    var MessageUtils = {
        showError: function (text) {
            this.showMessage('Ошибка', text, 'error');
        },
        showInfo: function (text) {
            this.showMessage('Информация', text, 'info');
        },
        showSuccess: function (text) {
            this.showMessage('Готово', text, 'success');
        },
        showMessage: function (title, text, type) {
            new PNotify({
                title: title,
                text: text,
                type: type,
                delay: 4000,
                //styling: "bootstrap3",
                buttons: {
                    sticker: false
                }
            });
        },

        sendRequest: function(data, dialogId) {
            $.post('send.php', data)
                .done(function(resp) {
                    if (resp) {
                        if (resp[0] == "{") {
                            var json = JSON.parse(resp);
                            if (json.success) {
                                MessageUtils.showSuccess(json.message || "Запрос отправлен");
                                if (dialogId) {
                                    $('#' + dialogId).modal('toggle');
                                }
                            } else {
                                MessageUtils.showError(json.message || "Не удалось отправить запрос");
                            }
                        } else {
                            MessageUtils.showError("Не удалось отправить запрос");
                        }
                    } else {
                        MessageUtils.showError("Не удалось отправить запрос");
                    }
                })
                .fail(function() {
                    MessageUtils.showError("Не удалось отправить запрос");
                });
        }
    }

    $(".cert-send-button").click(function(btn) {
        var winId = "certificateWindow";
        var name = $("#cert-name").val();
        var phone = $("#cert-phone").val();
        var isValid = name && phone;
        if (isValid) {
            var data = {
                NotifyType: 'CERTIFICATE',
                Name: name,
                Phone: phone
            };
            MessageUtils.sendRequest(data, winId);
        } else {
            MessageUtils.showInfo("Заполнены не все поля");
        }
    });

    $(".call-send-button").click(function(btn) {
        var winId = "callbackWindow";
        var name = $("#callback-name").val();
        var phone = $("#callback-phone").val();
        var isValid = name && phone;
        if (isValid) {
            var data = {
                NotifyType: 'CALLBACK',
                Name: name,
                Phone: phone
            };
            MessageUtils.sendRequest(data, winId);
        } else {
            MessageUtils.showInfo("Заполнены не все поля");
        }
    });

    $(".reg-send-button").click(function(btn) {
        var winId = "registrationWindow";
        var selectedGame = $(".quiz-game-card.selected")[0];
        if (selectedGame) {
            var selectedGameJQElement = $(selectedGame);
            var gameDate = selectedGameJQElement.data('game-fulldate');
            var cityElement = selectedGameJQElement.find('.registration-city');
            var gameCity = cityElement.text();
            var teamName = $("#reg-name").val();
            var count = $("#reg-count").val();
            var leader = $("#reg-capitan").val();
            var phone = $("#reg-phone").val();
            var isValid = gameCity && gameDate && teamName && count && leader && phone;
            if (isValid) {
                var data = {
                    NotifyType: 'REGISTRATION',
                    City: gameCity,
                    Date: gameDate,
                    TeamName: teamName,
                    Count: count,
                    Leader: leader,
                    Phone: phone
                };
                MessageUtils.sendRequest(data, winId);
            } else {
                MessageUtils.showInfo("Заполнены не все поля");
            }
        } else {
            MessageUtils.showInfo("Не выбрана игра");
        }
    });
});
