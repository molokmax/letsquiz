$(document).ready(function() {

    $("#questionWindow").on('show.bs.modal', function(win) {
        if (!$(win.currentTarget).data("initialized")) {
            $(".question-answer-link").click(function(link) {
                $(link.currentTarget).parents(".question-item").children(".question-answer-text").toggle();
            });
            $(win.currentTarget).data("initialized", true);
        }
    });
    $("#questionWindow").on('hidden.bs.modal', function(win) {
        $(".question-answer-text").hide();
    });

    $("#registrationWindow").on('show.bs.modal', function(win) {
        if (!$(win.currentTarget).data("initialized")) {
            $(".quiz-game-card").click(function(link) {
                $(link.currentTarget).parents(".carousel-inner").find(".quiz-game-card").removeClass("selected");
                $(link.currentTarget).addClass("selected");
            });
            $(win.currentTarget).data("initialized", true);
        }
    });
    $("#registrationWindow").on('hidden.bs.modal', function(win) {
        $(".quiz-game-card").removeClass("selected");
    });
});
