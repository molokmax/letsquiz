$(document).ready(function() {

    // $('.carousel-schedule').slick({
    //     //dots: true,
    //     slidesToShow: 4
    // });

    var CityUtils = {
        AnyCityName: 'Все',
        OnlineCityName: 'Онлайн',
        currentCity: null,
        isAnyCity: function() {
            return this.AnyCityName == this.currentCity;
        },
        getSavedCity: function () {
            var city = localStorage.getItem('selectedCity');
            if (city) {
                return city;
            } else {
                return null;
            }
        },
        selectCity: function(city) {
            localStorage.setItem('selectedCity', city);
        },
        cityDetermination: function() {
            var city = this.getSavedCity();
            if (city) {
                this.updateInterface(city);
            } else {
                $('#selectCityWindow').modal('show');
            }
        },
        filterCity(index) {
            var item = $(this).find(".quiz-game-card");
            var cityName = item.data("city-name")
            var result = CityUtils.isAnyCity() || cityName === CityUtils.OnlineCityName || cityName === CityUtils.currentCity;
            return result;
        },
        updateInterface: function(city) {
            this.currentCity = city;
            $(".selected-city-link").text(city);
            // $('.carousel-schedule').slick('slickUnfilter');
            // $('.carousel-schedule').slick('slickFilter', this.filterCity);
            if (this.isAnyCity()) {
                $(".list-schedule .quiz-game-card-container").show();
                $(".address-item").show();
            } else {
                $(".list-schedule .quiz-game-card-container").hide();
                $(".list-schedule .quiz-game-card-container[data-city-name='"+city+"']").show();
                $(".list-schedule .quiz-game-card-container[data-city-name='"+CityUtils.OnlineCityName+"']").show();
                $(".address-item").hide();
                $(".address-item[data-city-name='"+city+"']").show();
                $(".address-item[data-city-name='"+CityUtils.OnlineCityName+"']").show();
            }
        }

    }

    CityUtils.cityDetermination();

    var navMain = $("#navbarNav");
    navMain.on("click", "a", null, function () {
        navMain.collapse('hide');
    });
    var navMain = $("#navbarNav");
    $('.registration-btn a').click(function () {
        var card = $(this).parents('.quiz-game-card');
        var date = card.find('.game-date').text();
        $("#registrationWindow .display-date").text(date);
        var time = card.find('.game-time').text();
        $("#registrationWindow .display-time").text(time);
        var price = card.data('price');
        $("#registrationWindow .display-price").text(price);
        var city = card.data('city-name');
        $("#registrationWindow .quiz-window-title").hide();
        if (city == CityUtils.OnlineCityName) {
            $("#registrationWindow .quiz-window-title.online-game").show();
        } else {
            $("#registrationWindow .quiz-window-title.offline-game").show();
        }
        $("#registrationWindow").data("city-name", city);
        $("#registrationWindow .display-city").text(city);
        var cityId = card.data('city-id');
        $("#registrationWindow").data("city-id", cityId);
        var fullDate = card.data('game-fulldate');
        $("#registrationWindow").data("game-fulldate", fullDate);
        var gameId = card.data('game-id');
        $("#registrationWindow").data("game-id", gameId);
    });

    $("#questionWindow .question-answer-link").click(function(link) {
        $(link.currentTarget).parents(".question-item").find(".question-answer-text").toggle();
    });
    
    $(".select-city-button").click(function(link) {
        var city = $("#city").val();
        CityUtils.selectCity(city);
        CityUtils.updateInterface(city);
        $('#selectCityWindow').modal('hide');
    });

    $("#questionWindow").on('hidden.bs.modal', function(win) {
        $(".question-answer-text").hide();
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
                                    $('#' + dialogId).modal('hide');
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
        var form = $('#certificateWindow form')[0];
        if (form.checkValidity()) {
            var name = $("#cert-name").val();
            var phone = $("#cert-phone").val();
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
        var form = $('#callbackWindow form')[0];
        if (form.checkValidity()) {
            var name = $("#callback-name").val();
            var phone = $("#callback-phone").val();
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
        var win = $("#" + winId);
        var form = $('#registrationWindow form')[0];
        var gameId = win.data('game-id');
        var gameDate = win.data('game-fulldate');
        var gameCity = win.data('city-name');
        var gameCityId = win.data('city-id');
        var isHiddenFieldsValid = gameCity && gameDate;
        if (isHiddenFieldsValid) {
            if (form.checkValidity()) {
                var teamName = $("#reg-name").val();
                var count = $("#reg-count").val();
                var leader = $("#reg-capitan").val();
                var phone = $("#reg-phone").val();
                var email = $("#reg-email").val();
                var data = {
                    NotifyType: 'REGISTRATION',
                    GameId: gameId,
                    City: gameCity,
                    CityId: gameCityId,
                    Date: gameDate,
                    TeamName: teamName,
                    Count: count,
                    Leader: leader,
                    Phone: phone,
                    Email: email
                };
                MessageUtils.sendRequest(data, winId);
            } else {
                MessageUtils.showInfo("Заполнены не все поля");
            }
        } else {
            MessageUtils.showInfo("Заполнены не все поля");
        }
    });
});
