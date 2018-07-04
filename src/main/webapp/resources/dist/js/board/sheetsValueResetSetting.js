$(document).ready(function () {
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
    function resetValue(addZone_clone) {
        //Goal Title Value값 초기화
        $(addZone_clone).children(":eq(4)")
            .children()
            .first()
            .prevObject[1].value = "";
        //Goal Description값 초기화
        $(addZone_clone).children(":eq(5)")
            .children()
            .first()
            .prevObject[1]
            .value = "[Issue, Gap]\n" +
            "\n" +
            "\n" +
            "[Target]\n" +
            "\n" +
            "\n" +
            "[Tasks '-':Must, '+']\n";
        //Evaluation comments by Self 값 초기화
        $(addZone_clone).children(":eq(6)")
            .children()
            .first()
            .prevObject[1]
            .value = "[Result]\n" +
            "\n" +
            "[Keep]\n" +
            "\n" +
            "[Problem]\n" +
            "\n" +
            "[Try]\n";
        //Task due date 초기화
        $(addZone_clone).children(":eq(2)")
            .children()
            .first()
            .children()
            .first()[0].value = "";
        $(addZone_clone).children(":eq(2)")
            .children()
            .first()
            .children(":eq(2)")[0].value = "";

    }

    resetValueJQ = resetValue; // javascript 함수에 jQuery 함수 대입.
});

$('#resetBtn').click(function () {
    swal({
        title: "Are you sure?",
        text: "All your content will delete!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
        .then((willDelete) => {
        if(willDelete) {
            var formValue = document.getElementsByName('evaluationForm')
            formValue[0].reset();
        }
    });
});


$(function(){
    $('#historyVersion').click(function(){
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
    })
})