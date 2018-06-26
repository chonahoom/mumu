$(function () {
    $(".first").mouseover(function () {
        $(".first").css("border", "1px solid black");
    });
    $(".first").mouseout(function () {
        $(".first").css("border", "1px solid #dddddd");
    });


    $(".second").mouseover(function () {
        $(".second").css("border", "1px solid black");
    });
    $(".second").mouseout(function () {
        $(".second").css("border", "1px solid #dddddd");
    });


    $(".third").mouseover(function () {
        $(".third").css("border", "1px solid black");
    });
    $(".third").mouseout(function () {
        $(".third").css("border", "1px solid #dddddd");
    });
});