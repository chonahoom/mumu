function addSheet() {
    var addZone_id = document.getElementById('box-body-pr');
    var addZone_child_id = document.getElementById('box-body');
    var addImg_id = document.getElementById('add_img');
    var removeImg_id = document.getElementById('remove_img');
    var competency_area_id = document.getElementById('competency_area');

    addImg_id_clone = addImg_id.cloneNode(true);
    removeImg_id_clone = removeImg_id.cloneNode(true);
    addZone_child_clone = addZone_child_id.cloneNode(true);
    competency_area_clone = competency_area_id.cloneNode(true);

    resetValueJQ(addZone_child_clone);

    addImg_id.remove();
    removeImg_id.remove();
    competency_area_id.remove();


    addZone_id.appendChild(addZone_child_clone);
    addZone_id.appendChild(removeImg_id_clone);
    addZone_id.appendChild(addImg_id_clone);
    addZone_id.appendChild(competency_area_clone);

}

function removeSheet() {
    var addZone_id = document.getElementById('box-body-pr');
    var nminus1 = document.getElementById('box-body-pr').childNodes.length - 4;
    if (addZone_id.childNodes.length < 12) {
        return;
    }

    swal({
        title: "Are you sure?",
        text: "The last Task form is deleted !",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
        .then((willDelete) => {
        if (willDelete) {
            document.getElementById('box-body-pr').childNodes[nminus1].remove();
        }
    });

}

function checkFormValidity() {
    var taskDateStartValue = document.getElementsByName('taskDateStartTemp');
    var taskDateEndValue = document.getElementsByName('taskDateEndTemp');
    var weightValue = document.getElementsByName('taskWeightTemp');
    var titleValue = document.getElementsByName('taskGoalTitleTemp');
    var taskGoalDescriptionValue = document.getElementsByName('taskGoalDescriptionTemp');
    var taskCompetencyValue = document.getElementsByName('taskCompetency');

    var taskTypeValue = document.getElementsByName('taskTypeTemp');
    var historyVersionValue = document.getElementsByName('historyVersion');

    var taskEvaluationCommentValue = document.getElementsByName('taskEvaluationCommentTemp');
    var taskRateValue = document.getElementsByName('taskRateTemp');
    var competencyTitleValue = document.getElementsByName('competencyTitle');
    var competencyRateValue = document.getElementsByName('competencyRate');
    var overallPerformanceCommentValue = document.getElementsByName('overallPerformanceComment');

    var formValue = document.getElementsByName('evaluationForm');

    for (var i = 0; i < taskTypeValue.length; i++) {
        if(taskGoalDescriptionValue[i].value === "[Issue. Gap]\n" +
            "\n" +
            "\n" +
            "[Target]\n" +
            "\n" +
            "\n" +
            "[Tasks '-':Must. '+']\n" || taskGoalDescriptionValue[i].value === "[Issue, Gap]\n" +
            "\n" +
            "\n" +
            "[Target]\n" +
            "\n" +
            "\n" +
            "[Tasks '-':Must, '+']\n"){
            swal("Fill Goal Description", "Please input Description content", "warning");
            return taskGoalDescriptionValue[i].focus()
        }
        if (taskDateStartValue[i].value === "") {
            swal("Fill Term", "Please input start date", "warning");
            return taskDateStartValue[i].focus()
        }
        if (taskDateEndValue[i].value === "") {
            swal("Fill Term", "Please input end date", "warning");
            return taskDateEndValue[i].focus()
        }
        if (weightValue[i].value === "0") {
            swal("Fill Weight", "Please select task's weight", "warning");
            return weightValue[i].focus()
        }
        if (titleValue[i].value === "") {
            swal("Fill Title", "Please input task's title", "warning");
            return titleValue[i].focus()
        }
        if (taskCompetencyValue[0].value === "[Issue, Gap]\n" +
            "\n" +
            "\n" +
            "[Target]\n" +
            "\n" +
            "\n" +
            "[Tasks '-':Must, '+']\n") {
            swal("Goal Setting Comments for competencies", "Please input Goal Setting Comments for competencies", "warning");
            return taskCompetencyValue[0].focus()
        }
        if (historyVersionValue[0].value === "2") {
            if(checkFormValidityFinal(taskEvaluationCommentValue[i],taskRateValue[i],competencyTitleValue[0],competencyRateValue[0],overallPerformanceCommentValue[0]) === "emptyEvaluationComment") {
                return taskEvaluationCommentValue[0].focus()
            }
            if(checkFormValidityFinal(taskEvaluationCommentValue[i],taskRateValue[i],competencyTitleValue[0],competencyRateValue[0],overallPerformanceCommentValue[0]) === "emptyTaskRate") {
                return taskRateValue[i].focus()
            }
            if(checkFormValidityFinal(taskEvaluationCommentValue[i],taskRateValue[i],competencyTitleValue[0],competencyRateValue[0],overallPerformanceCommentValue[0]) === "emptyFivePrinciples") {
                return competencyRateValue[0].focus()
            }
            if(checkFormValidityFinal(taskEvaluationCommentValue[i],taskRateValue[i],competencyTitleValue[0],competencyRateValue[0],overallPerformanceCommentValue[0]) === "emptyCompetencyRate") {
                return competencyRateValue[0].focus()
            }
            if(checkFormValidityFinal(taskEvaluationCommentValue[i],taskRateValue[i],competencyTitleValue[0],competencyRateValue[0],overallPerformanceCommentValue[0]) === "emptyOverallPerformanceComment") {
                return competencyRateValue[0].focus()
            }
        }
    }
    return formValue[0].submit();
}

function checkFormValidityFinal(taskEvaluationCommentValue,taskRateValue,competencyTitleValue,competencyRateValue,overallPerformanceCommentValue) {
    if (taskEvaluationCommentValue.value === "[Result]\n" +
        "\n" +
        "[Keep]\n" +
        "\n" +
        "[Problem]\n" +
        "\n" +
        "[Try]\n") {
        swal("Evaluation comments by Self", "Please input comments", "warning");
        return "emptyEvaluationComment";
    }
    if (taskRateValue.value === "0") {
        swal("Task Rate", "Please select task's rate", "warning");
        console.log(taskRateValue.value);
        return "emptyTaskRate";
    }
    if (competencyTitleValue.value === "0") {
        swal("Five Principles", "Please select five principles", "warning");
        return "emptyFivePrinciples";
    }
    if (competencyRateValue.value === "0") {
        swal("Competency Rate", "Please select competency's rate", "warning");
        return "emptyCompetencyRate";
    }
    if (overallPerformanceCommentValue.value === "[Result]\n" +
        "\n" +
        "[Keep]\n" +
        "\n" +
        "[Problem]\n" +
        "\n" +
        "[Try]\n") {
        swal("Overall performance Comments", "Please input Overall performance Comments", "warning");
        return "emptyOverallPerformanceComment";
    }

}