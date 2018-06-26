$("#add_img").click(function() {
    addZone_clone           = $("#box-body").clone();
    add_img_clone           = $("#add_img").clone();
    remove_img_clone        = $("#remove_img").clone();
    competency_area_clone   = $("#competency_area").clone();

    //Goal Title Value값 초기화
    $(addZone_clone).children(":eq(4)").children().first().prevObject[1].value ="";
    //Goal Description값 초기화
    $(addZone_clone).children(":eq(5)").children().first().prevObject[1].value = "[Issue, Gap]\n" +
        "\n" +
        "\n" +
        "[Target]\n" +
        "\n" +
        "\n" +
        "[Tasks '-':Must, '+']";
    //Evaluation comments by Self 값 초기화
    $(addZone_clone).children(":eq(6)").children().first().prevObject[1].value ="";
    //Task due date 초기화
    $(addZone_clone).children(":eq(2)").children().first().prevObject[0].value ="";


    $("#add_img").remove();
    $("#remove_img").remove();
    $("#competency_area").remove();

    addZone_clone.appendTo("#box-body-pr");
    competency_area_clone.appendTo("#box-body-pr");
    remove_img_clone.appendTo("#box-body-pr");
    add_img_clone.appendTo("#box-body-pr");

});
$("#remove_img").click(function() {
    if($("#box-body").contents().length <= 18){
        return;
    }else{
        $("#box-body").remove();
    }
});
