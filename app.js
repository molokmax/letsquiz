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

        sendRequest: function(data) {
            $.post('send.php', data)
                .done(function(resp) {
                    if (resp) {
                        if (resp[0] == "{") {
                            var json = JSON.parse(resp);
                            if (json.success) {
                                MessageUtils.showSuccess(json.message || "Запрос отправлен");
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
        var name = $("#cert-name").val();
        var phone = $("#cert-phone").val();
        var isValid = name && phone;
        if (isValid) {
            var data = {
                NotifyType: 'CERTIFICATE',
                Name: name,
                Phone: phone
            };
            MessageUtils.sendRequest(data);
        } else {
            MessageUtils.showInfo("Заполнены не все поля");
        }
    });

    $(".call-send-button").click(function(btn) {

    });

    $(".reg-send-button").click(function(btn) {

    });
});
