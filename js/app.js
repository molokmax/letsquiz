$(document).ready(function() {

    // toastr.options = {
    //     "closeButton": false,
    //     "debug": false,
    //     "newestOnTop": false,
    //     "progressBar": false,
    //     "positionClass": "toast-top-right",
    //     "preventDuplicates": false,
    //     "onclick": null,
    //     "showDuration": "300",
    //     "hideDuration": "1000",
    //     "timeOut": "5000",
    //     "extendedTimeOut": "1000",
    //     "showEasing": "swing",
    //     "hideEasing": "linear",
    //     "showMethod": "fadeIn",
    //     "hideMethod": "fadeOut"
    // };

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


    $(".cert-send-button").click(function(btn) {
        var isValid = true;
        if (isValid) {
            var data = {
                NotifyType: 'CERTIFICATE',
                Name: '',
                Phone: ''
            };
            debugger;
            toastr['success']("Запрос отправлен");

            // $.notify("Не удалось отправить запрос", {
            //     className: "success"
            // });
            /*
            $.post('send.php', data)
                .done(function(resp) {
                    if (resp) {
                        if (resp.success) {
                            $.notify(resp.message || "Запрос отправлен", {
                                className: "success"
                            });
                        } else {
                            $.notify(resp.message || "Не удалось отправить запрос", {
                                className: "error"
                            });
                        }
                    } else {
                        $.notify("Не удалось отправить запрос", {
                            className: "error"
                        });
                    }
                })
                .fail(function() {
                    $.notify("Не удалось отправить запрос", {
                        className: "error"
                    });
                });
                */
        }
    });

    $(".call-send-button").click(function(btn) {

    });

    $(".reg-send-button").click(function(btn) {

    });
});
