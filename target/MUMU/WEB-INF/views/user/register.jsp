<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>
<script src="/dist/js/user/registerValueCheck.js"></script>
<body class="hold-transition register-page">
<div class="register-box">
    <div class="register-logo">
        <a href="/">
            <b>MUMU</b>
        </a>
        <h4>Evaluation System Support Service</h4>
    </div>
    <div class="register-box-body">
        <p class="login-box-msg">Sign up Page</p>
        <form method="post" action="<c:url value="/user/register"/>" name="form">
            <div class="form-group has-feedback">
                <input type="text" name="employeeNumber" class="form-control"
                       placeholder="Employee Number (9-digit number)" maxlength="9">
                <span class="glyphicon glyphicon-exclamation-sign form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" name="password" class="form-control" placeholder="Password">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" name="passwordConfirm" placeholder="Password confirm">
                <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" name="name" class="form-control" placeholder="name   [ex) nahoom.jo]">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" name="supervisorNumber" class="form-control"
                       placeholder="Supervisor Number (9-digit number)"  maxlength="9">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-4">
                    <input type="button" class="btn btn-primary btn-block btn-flat" onclick="checkFormValidity()"
                           value="sign up">
                </div>
            </div>
        </form>
        <a href="/user/login" class="text-center">login</a>
    </div>
    <!-- /.form-box -->
</div>
<!-- /.register-box -->

<%@ include file="../include/plugin_js.jsp" %>
<script>
    $(document).ready(function () {
        var msg = "${msg}";
    if (msg === "EXISTIED"){
        swal("It is existed ID!", "You can register as another ID", "warning");
    }
    });
</script>
</body>
</html>