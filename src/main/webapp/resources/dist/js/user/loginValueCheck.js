function checkFormValidity() {
    var employeeNumberValue = document.getElementsByName('employeeNumber');
    var passwordValue = document.getElementsByName('password');

    if (employeeNumberValue[0].value == "") {
        swal("employee Number!", "Please input your employee Number (9 digits)", "warning");
        employeeNumberValue[0].focus();return;

        return;
    }
    if (employeeNumberValue[0].value.length < 9 || employeeNumberValue[0].value.length > 9) {
        swal("employee Number!", "Please input your employee Number (9 digits)", "warning");
        employeeNumberValue[0].focus();
        return;
    }
    if (passwordValue[0].value == "") {
        swal("Password!", "Please input your password", "warning");
        passwordValue[0].focus();
        return;
    }

}