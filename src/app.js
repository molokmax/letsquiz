$(document).ready(function() {
    toastr.options = {
        closeButton: false,
        progressBar: true,
        timeOut: 5000,
        extendedTimeOut: 1000
    };

    $('.corp-company-items').slick({
        dots: true,
        slidesToShow: 6,
        arrows: true,
        rows: 1,
        slidesPerRow: 1,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 1000,
        responsive: [
            {
              breakpoint: 1440,
              settings: {
                dots: false,
                slidesToShow: 5,
                arrows: true,
                rows: 1,
                slidesPerRow: 1
              }
            },
            {
              breakpoint: 1200,
              settings: {
                dots: false,
                slidesToShow: 4,
                arrows: true,
                rows: 1,
                slidesPerRow: 1
              }
            },
            {
              breakpoint: 1024,
              settings: {
                dots: false,
                slidesToShow: 3,
                arrows: true,
                rows: 1,
                slidesPerRow: 1
              }
            },
            {
              breakpoint: 768,
              settings: {
                dots: false,
                slidesToShow: 2,
                arrows: false,
                rows: 2
              }
            }
        ]
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
        updateInterface: function(city) {
            this.currentCity = city;
            if (this.isAnyCity()) {
                $(".list-schedule .quiz-game-card-container").show();
                $("div.quiz-block-container.main .city-button .city-name").text("Выбрать город");
            } else {
                $("div.quiz-block-container.main .city-button .city-name").text(city);
                $(".list-schedule .quiz-game-card-container").hide();
                $(".list-schedule .quiz-game-card-container[data-city-name='"+city+"']").show();
                $(".list-schedule .quiz-game-card-container[data-city-name='"+CityUtils.OnlineCityName+"']").show();
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
        $(".page-block").toggle(10);
    }
    $("nav.quiz-menu .collapse-button").click(toogleMenu);
    $(".page-block").click(toogleMenu);

    
    $("nav.quiz-menu .nav-link").click(toogleMenu);

    function cleanForm(dialogId) {
        $("#" + dialogId + " .form-control").val("");
        var errBlock = $("#" + dialogId + " .error-container");
        errBlock.text("");
        errBlock.hide();
        MessageUtils.setLoading(dialogId, false);
    }
    $('.registration-button a').click(function () {
        var card = $(this).parents('.quiz-game-card');
        var date = card.data("date");
        $("#registrationWindow .display-date").text(date);
        var price = card.data('price');
        $("#registrationWindow .display-price").text(price);
        var city = card.data('city-name');
        var place = card.data('place-name');
        var isOnline = card.data('is-online');
        $("#registrationWindow").data("city-name", city);
        $("#registrationWindow").data("place-name", place);
        var cityText = city + (isOnline ? '' : ', ' + place);
        $("#registrationWindow .display-city").text(cityText);
        var cityId = card.data('city-id');
        var placeId = card.data('place-id');
        $("#registrationWindow").data("city-id", cityId);
        $("#registrationWindow").data("place-id", placeId);
        var fullDate = card.data('game-fulldate');
        $("#registrationWindow").data("game-fulldate", fullDate);
        var gameId = card.data('game-id');
        $("#registrationWindow").data("game-id", gameId);
        
        cleanForm("registrationWindow");
    });

    
    $('.callback-button').click(function () {
        cleanForm("callbackWindow");
    });

    $('.gallery .photo-block img').click(function () {
        $('#photoWindow img').attr('src', $(this).attr('src'));
        $('#photoWindow').modal('show');
    });

    var MessageUtils = {
        setError: function (dialogId, error) {
            MessageUtils.setLoading(dialogId, false);

            var errBlock = $("#" + dialogId + " .error-container");
            errBlock.text(error);
            errBlock.show();
        },

        setLoading: function(dialogId, val) {
            $('#' + dialogId + ' button.quiz-button').prop('disabled', val);
            var displayLoading = val ? 'inline-block' : 'none';
            var displayLabel = val ? 'none' : 'inline-block';
            $('#' + dialogId + ' button.quiz-button .loading').css('display', displayLoading);
            $('#' + dialogId + ' button.quiz-button .button-label').css('display', displayLabel);
        },

        sendRequest: function(data, dialogId) {
            MessageUtils.setLoading(dialogId, true);

            $.post('send.php', data)
                .done(function(resp) {
                    if (resp) {
                        if (resp[0] == "{") {
                            var json = JSON.parse(resp);
                            if (json.success) {
                                if (dialogId) {
                                    MessageUtils.setLoading(dialogId, false);
                                    $('#' + dialogId).modal('hide');
                                    toastr.success(json.message || 'Запрос отправлен. Ждите подтверждения');
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
