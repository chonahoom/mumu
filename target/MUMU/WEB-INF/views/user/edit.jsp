<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>
<script>
    window.onload = function(){
        if("${sessionScope.userLoginInfo.name}" == '')
            location.href="/user/login";
    }
</script>
<script src="/dist/js/user/editValueCheck.js"></script>
<body class="hold-transition register-page">
<div class="register-box">
    <div class="register-logo">
        <a href="${path}/">
            <b>MUMU</b><br/>
            Evaluation System Support Service
        </a>
    </div>
    <div class="register-box-body">
        <p class="login-box-msg">Edit Profile Page</p>
        <form action="<c:url value="/user/edit"/>" method="post" name="form">
            <div class="form-group has-feedback">
                <input type="number" name="employeeNumberVisible" class="form-control" placeholder="Employee Number"
                       value="${sessionScope.userLoginInfo.employeeNumber}" disabled>
                <input type="hidden" name="employeeNumber" value="${sessionScope.userLoginInfo.employeeNumber}">
                <span class="glyphicon glyphicon-exclamation-sign form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" name="password" class="form-control" placeholder="Password">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" name="passwordConfirm" class="form-control" placeholder="Password confirm">
                <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" name="name" class="form-control" placeholder="Name"
                       value="${sessionScope.userLoginInfo.name}">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" name="supervisorNumber" class="form-control" placeholder="Supervisor Number"
                       value="${sessionScope.userLoginInfo.supervisorNumber}" maxlength="9">
                <span class="glyphicon glyphicon-exclamation-sign form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-4">
                    <input type="button" class="btn btn-primary btn-block btn-flat" onclick="checkFormValidity()"
                           value="save">
                </div>
            </div>
        </form>
    </div>
    <!-- /.form-box -->
</div>
<!-- /.register-box -->
<%@ include file="../include/plugin_js.jsp" %>
</body>
</html>
