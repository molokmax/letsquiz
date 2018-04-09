$(document).ready(function() {

    $('.carousel-schedule').slick({
        //dots: true,
        slidesToShow: 4
    });

    var CityUtils = {
        AnyCityName: 'Все',
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
            return CityUtils.isAnyCity() || $(this).data("city-name") === CityUtils.currentCity;
        },
        updateInterface: function(city) {
            this.currentCity = city;
            $(".selected-city-link").text(city);
            $('.carousel-schedule').slick('slickUnfilter');
            $('.carousel-schedule').slick('slickFilter', this.filterCity);
            if (this.isAnyCity()) {
                $(".list-schedule .quiz-game-card").show();
                $(".address-item").show();
            } else {
                $(".list-schedule .quiz-game-card").hide();
                $(".list-schedule .quiz-game-card[data-city-name='"+city+"']").show();
                $(".address-item").hide();
                $(".address-item[data-city-name='"+city+"']").show();
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
        var city = card.data('city-name');
        $("#registrationWindow").data("city-name", city);
        $("#registrationWindow .display-city").text(city);
        var fullDate = card.data('game-fulldate');
        $("#registrationWindow").data("game-fulldate", fullDate);
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
        var win = $("#" + winId);
        var gameDate = win.data('game-fulldate');
        var gameCity = win.data('city-name');
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
    });
});
