$(document).ready(function() {

    function getSlidesToShow() {
        if (window.innerWidth >= 1200) {
            return 6;
        } else if (window.innerWidth >= 992) {
            return 4;
        } else if (window.innerWidth >= 768) {
            return 3;
        } else {
            return 2;
        }
    }
    function getDotsShow() {
        if (window.innerWidth >= 1200) {
            return true;
        } else if (window.innerWidth >= 992) {
            return false;
        } else if (window.innerWidth >= 768) {
            return false;
        } else {
            return false;
        }
    }
    
    var slidesToShow = getSlidesToShow();
    $('.corp-company-items').slick({
        dots: getDotsShow(),
        slidesToShow: slidesToShow,
        slidesToScroll: 1,
        arrows: slidesToShow > 2,
        autoplay: true,
        autoplaySpeed: 6000
    });

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
    $(".select-city-button").click(function(link) {
        var city = $("#city").val();
        CityUtils.selectCity(city);
        CityUtils.updateInterface(city);
        $('#selectCityWindow').modal('hide');
    });

    CityUtils.cityDetermination();

    function toogleMenu(link) {
        $("nav.quiz-menu .menu-content.closed").toggle(100);
        $("nav.quiz-menu .menu-content.opened").toggle(100);
    }
    $("nav.quiz-menu .collapse-button").click(toogleMenu);

    
    $("nav.quiz-menu .nav-link").click(toogleMenu);

    function cleanForm(dialogId) {
        $("#" + dialogId + " .form-control").val("");
        var errBlock = $("#" + dialogId + " .error-container");
        errBlock.text("");
        errBlock.hide();
    }
    $('.registration-button a').click(function () {
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
        
        cleanForm("registrationWindow");
    });

    
    $('.callback-button').click(function () {
        cleanForm("callbackWindow");
    });

    var MessageUtils = {
        setError: function (dialogId, error) {
            var errBlock = $("#" + dialogId + " .error-container");
            errBlock.text(error);
            errBlock.show();
        },

        sendRequest: function(data, dialogId) {
            $.post('send.php', data)
                .done(function(resp) {
                    if (resp) {
                        if (resp[0] == "{") {
                            var json = JSON.parse(resp);
                            if (json.success) {
                                if (dialogId) {
                                    $('#' + dialogId).modal('hide');
                                }
                            } else {
                                MessageUtils.setError(dialogId, json.message || "Не удалось отправить запрос");
                            }
                        } else {
                            MessageUtils.setError(dialogId, "Не удалось отправить запрос");
                        }
                    } else {
                        MessageUtils.setError(dialogId, "Не удалось отправить запрос");
                    }
                })
                .fail(function() {
                    MessageUtils.setError(dialogId, "Не удалось отправить запрос");
                });
        }
    }

    $(".call-send-button").click(function(btn) {
        var winId = "callbackWindow";
        var win = $('#' + winId);
        var form = $('#' + winId + ' form')[0];
        if (isFormValid(win, form, [])) {
            var name = $("#callback-name").val();
            var phone = $("#callback-phone").val();
            var data = {
                NotifyType: 'CALLBACK',
                Name: name,
                Phone: phone
            };
            MessageUtils.sendRequest(data, winId);
        } else {
            MessageUtils.setError(winId, "* Заполнены не все поля");
        }
    });

    function isFormValid(win, form, dataNames) {
        var isDataValid = true;
        for (var i = 0; i < dataNames.length; i++) {
            var data = win.data(dataNames[i]);
            if (!data) {
                isDataValid = false;
            }
        }
        return isDataValid && form.checkValidity();
    }

    $(".reg-send-button").click(function(btn) {
        var winId = "registrationWindow";
        var win = $("#" + winId);
        var form = $('#' + winId + ' form')[0];
        var gameId = win.data('game-id');
        var gameDate = win.data('game-fulldate');
        var gameCity = win.data('city-name');
        var gameCityId = win.data('city-id');
        if (isFormValid(win, form, ['game-fulldate', 'city-name'])) {
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
            MessageUtils.setError(winId, "* Заполнены не все поля");
        }
    });
});
