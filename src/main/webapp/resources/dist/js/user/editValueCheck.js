function checkFormValidity() {
    var passwordValue = document.getElementsByName('password');
    var passwordConfirmValue = document.getElementsByName('passwordConfirm');
    var nameValue = document.getElementsByName('name');
    var supervisorNumberValue = document.getElementsByName('supervisorNumber');
    var formValue = document.getElementsByName('form');
    var employeeNumberVisible = document.getElementsByName('employeeNumberVisible');


    if (passwordValue[0].value == "") {
        swal("Password!", "please input new password", "warning");

        passwordValue[0].focus();
        return;
    }
    if (passwordConfirmValue[0].value == "") {
        swal("Password Confirm!", "please input password confirm", "warning");
        passwordConfirmValue[0].focus();
        return;
    }
    if (passwordValue[0].value != passwordConfirmValue[0].value) {
        swal("Oops!", "please check password value & password comfirm value", "warning");
        passwordValue[0].focus();
        return;
    }
    if (nameValue[0].value == "") {
        swal("Name!", "please input new name", "warning");
        nameValue[0].focus();
        return;
    }
    if (supervisorNumberValue[0].value.length < 9 && supervisorNumberValue[0].value != "") {
        swal("9 digits!", "please input supervisor number 9 digits", "warning");
        supervisorNumberValue[0].focus();
        return;
    }
    if (supervisorNumberValue[0].value == "") {
        swal("input number \"000000000\"!", "If you have not superviser, input number \"000000000\" 9 digits", "warning");
        supervisorNumberValue[0].focus();
        return;
    }
    if (supervisorNumberValue[0].value == employeeNumberVisible[0].value) {
        swal("NO!", "Please..Don't do that ", "error");
        supervisorNumberValue[0].focus();
        return;
    }

    formValue[0].submit();

}