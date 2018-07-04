function settingFrames(){
    var taskTypeTemp = $('select[name="taskTypeTemp"]');
    var start = $('input[name="taskDateStartTemp"]');
    var end = $('input[name="taskDateEndTemp"]');
    var taskWeight = $('select[name="taskWeightTemp"]');
    var taskGoalTitle = $('input[name="taskGoalTitleTemp"]');
    var taskGoalDescription = $('textarea[name="taskGoalDescriptionTemp"]');
    var taskEvaluationComment = $('textarea[name="taskEvaluationCommentTemp"]');
    var taskRate = $('select[name="taskRateTemp"]');

    var taskCompetency = $('textarea[name="taskCompetency"]');
    var competencyTitle = $('select[name="competencyTitle"]');
    var competencyRate = $('select[name="competencyRate"]');
    var overallPerformanceComment = $('textarea[name="overallPerformanceComment"]');
    var historyVersionValue = $('#historyVersion option:selected').text();

    if(historyVersionValue === "Goal Setting" || historyVersionValue === "Mid-term Evaluation"){
        taskEvaluationComment.css("border","1px solid #dbdbdb");
        taskRate.css("border","1px solid #dbdbdb");
        competencyTitle.css("border","1px solid #dbdbdb");
        competencyRate.css("border","1px solid #dbdbdb");
        overallPerformanceComment.css("border","1px solid #dbdbdb");

        taskTypeTemp.css("border","2px solid #3c8dbc");
        start.css("border","2px solid #3c8dbc");
        end.css("border","2px solid #3c8dbc");
        taskWeight.css("border","2px solid #3c8dbc");
        taskGoalTitle.css("border","2px solid #3c8dbc");
        taskGoalDescription.css("border","2px solid #3c8dbc");
        taskCompetency.css("border","2px solid #3c8dbc");
    }
    if(historyVersionValue === "Final Evaluation"){
        taskTypeTemp.css("border","1px solid #dbdbdb");
        start.css("border","1px solid #dbdbdb");
        end.css("border","1px solid #dbdbdb");
        taskWeight.css("border","1px solid #dbdbdb");
        taskGoalTitle.css("border","1px solid #dbdbdb");
        taskGoalDescription.css("border","1px solid #dbdbdb");
        taskCompetency.css("border","1px solid #dbdbdb");

        taskEvaluationComment.css("border","2px solid #3c8dbc");
        taskRate.css("border","2px solid #3c8dbc");
        competencyTitle.css("border","2px solid #3c8dbc");
        competencyRate.css("border","2px solid #3c8dbc");
        overallPerformanceComment.css("border","2px solid #3c8dbc");
    }
};
$(document).ready(function () {
    settingFrames()
    var formObj = $("form[role='form']");
    //change formObj.attr as check status
    $('#checkValue').val($(this).is('unchecked'));
    $('#checkboxCreateSheet').change(function () {
        if (!$(this).is(':checked')) {
            $('#checkValue').val($(this).is('unchecked'));
            formObj.attr("action", "/board/modify");
        } else if (!$(this).is('checked')) {
            $('#checkValue').val($(this).is('checked'));
            formObj.attr("action", "/board/sheets");
        }
    });
    // click Done button
    $(".doneBtn").on("click", function () {
        formObj.attr("method", "post");
        formObj.submit();
    });
    // click Cancel button
    $(".cancelBtn").on("click", function () {
        $(location).attr('href', '/board/sheet-historys');
    });
});

$(function(){
    $('#historyVersion').click(function(){
        settingFrames();
    })
})