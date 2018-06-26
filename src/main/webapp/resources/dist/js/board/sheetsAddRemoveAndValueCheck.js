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
    var termValue = document.getElementsByName('taskDateTemp');
    var titleValue = document.getElementsByName('taskGoalTitleTemp');
    var formValue = document.getElementsByName('evaluationForm')

    for (var i = 0; i < termValue.length; i++) {
        if (termValue[i].value == "") {
            swal("Fill Term", "Please input task's term", "warning");
            return termValue[i].focus()
        }
        if (titleValue[i].value == "") {
            swal("Fill Title", "Please input task's title", "warning");
            return titleValue[i].focus()
        }
    }
    return formValue[0].submit();

}