<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>
<script src="/dist/js/user/loginValueCheck.js"></script>

<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="${path}/">
            <b>MUMU</b><br/>
        </a>
        <h4>Evaluation System Support Service</h4>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">Login</p>
        <form role="form" method="post" action="${path}/user/login">
            <div class="form-group has-feedback">
                <input type="text" name="employeeNumber" class="form-control" placeholder="Employee Number (9 digits)"
                       maxlength="9">
                <span class="glyphicon glyphicon-exclamation-sign form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" name="password" class="form-control" placeholder="Password">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat loginBtn">
                        <i class="fa fa-sign-in"></i> Login
                    </button>
                </div>
                <!-- /.col -->
            </div>
        </form>
        <!-- /.social-auth-links -->
        <a href="${path}/user/register" class="text-center">Sign Up</a>
    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<%@ include file="../include/plugin_js.jsp" %>
<script>
    $(document).ready(function () {
        var msg = "${msg}";
        if (msg === "REGISTERED") {
            swal("Completed!", "You can enjoy this application", "success");
        } else if (msg === "FAILURE") {
            swal("Sorry", "Please check your ID & Password", "warning");
        }

        var formObj = $("form[role='form']");

        // click Login button
        $(".loginBtn").on("click", function () {
            checkFormValidity();
            formObj.attr("method", "post");
            setTimeout(function() { formObj.submit()}, 1500);
        });
    });
</script>

</body>
</html>
