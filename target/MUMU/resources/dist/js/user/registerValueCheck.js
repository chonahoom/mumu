function checkFormValidity() {
    var employeeNumberValue = document.getElementsByName('employeeNumber');
    var passwordValue = document.getElementsByName('password');
    var passwordConfirmValue = document.getElementsByName('passwordConfirm');
    var nameValue = document.getElementsByName('name');
    var supervisorNumberValue = document.getElementsByName('supervisorNumber');
    var formValue = document.getElementsByName('form');


    if (employeeNumberValue[0].value == "") {
        swal("Employee Number!", "Please input your employee Number (9 digits)", "warning");
        employeeNumberValue[0].focus();
        return;
    }
    if (employeeNumberValue[0].value.length < 9 && employeeNumberValue[0].value != "") {
        swal("Employee Number!", "Please input your employee Number (9 digits)", "warning");
        employeeNumberValue[0].focus();
        return;
    }
    if (passwordValue[0].value == "") {
        swal("Password!", "Please input your password", "warning");
        passwordValue[0].focus();
        return;
    }
    if (passwordConfirmValue[0].value == "") {
        swal("Password confirm", "Please input your password confirm", "warning");
        passwordConfirmValue[0].focus();
        return;
    }
    if (passwordValue[0].value != passwordConfirmValue[0].value) {
        swal("Password Check", "Please check password value & password comfirm value", "warning");
        passwordValue[0].focus();
        return;
    }
    if (nameValue[0].value == "") {
        swal("Name!", "Please input your name ex) nahoom.jo", "warning");
        nameValue[0].focus();
        return;
    }
    if (supervisorNumberValue[0].value.length < 9 && supervisorNumberValue[0].value != "") {
        swal("Supervisor!", "Please input supervisor number 9 digits", "warning");
        supervisorNumberValue[0].focus();
        return;
    }
    if (supervisorNumberValue[0].value == "") {
        swal("input number \"000000000\"!", "If you have not superviser, input number \"000000000\" 9 digits", "warning");
        supervisorNumberValue[0].focus();
        return;
    }
    if (supervisorNumberValue[0].value == employeeNumberValue[0].value) {
        swal("NO!", "Please Don't do that", "error");
        supervisorNumberValue[0].focus();
        return;
    }
    formValue[0].submit();

}