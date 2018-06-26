<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>

<html>

<%--head.jsp--%>
<%@ include file="include/head.jsp" %>
<link rel="stylesheet" href="/dist/css/home.css">
<body class="hold-transition skin-red-light sidebar-mini layout-boxed">
<div class="wrapper">

    <%--main_header.jsp--%>
    <%-- Main Header --%>
    <%@ include file="include/main_header.jsp" %>

    <%--left_column.jsp--%>
    <%-- Left side column. contains the logo and sidebar --%>

    <%-- Content Wrapper. Contains page content --%>
    <div class="content-wrapper" style="margin-left: 0; height: 100%">

        <%-- Content Header (Page header) --%>
        <section class="content-header">
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> home</a></li>
            </ol>
        </section>

        <%-- Main content --%>
        <section class="content container-fluid" style="width: 797px; min-height: 700px; margin: 50px auto;">
            <h3><b>Evaluation System Support Service</b></h3> <br>

            <p>
                This project is a web aplication / service that allows version control of the evaluation sheet by
                allowing the Supervisors and Team-members to <b>input</b>, <b>edit</b> and <b>view</b> the history of
                the evaluation sheet.
            </p><br><br>
            <div class="col-md-4 first" onclick="location.href='/board/sheets'">
                <img src="<c:url value="/resources/dist/img/createEvaluationSheet2.png"/>">
                <p class="menu-title"><b>CREATE EVALUATION SHEET</b></p>
                <p class="menu-description">
                    Provides evaluation sheet form on the web before submitting to REPOC
                </p>
            </div>
            <div class="col-md-4 second" onclick="location.href='/board/sheet-historys'">
                <img src="<c:url value="/resources/dist/img/myHistory1.png"/>">
                <p class="menu-title"><b>MY HISTORY</b></p>
                <p class="menu-description">
                    Provides version control of evaluation sheet
                </p>
            </div>
            <div class="col-md-4 third" onclick="location.href='/user/member-sheet-historys'">
                <img src="<c:url value="/resources/dist/img/membersHistory1.png"/>">
                <p class="menu-title"><b>MEMBER'S HISTORY</b></p>
                <p class="menu-description">
                    Manager can see own member list & member's evaluation sheets
                </p>
            </div>


            <p class="col-md-12">
                <h3><b>Reason for this project</b></h3><br>
                Many of the regular staff felt uncomfortable in the process of writing this evaluation sheet and being
                reviewed by the supervisor.
                This [MUMU] aims to find and solve this inconvenience.
            </p>

        </section>
        <%-- /.content --%>
    </div>
    <%-- /.content-wrapper --%>

    <%--main_footer.jsp--%>
    <%-- Main Footer --%>
    <footer class="main-footer" style="margin-left: 0;">
        <%-- To the right --%>
        <div class="pull-right hidden-xs" style="text-align: right">
            Rmobile | MUMU
        </div>
    </footer>

</div>
<%-- ./wrapper --%>

<%--plugin_js.jsp--%>
<%@ include file="include/plugin_js.jsp" %>
<script>
    $(document).ready(function () {
        var msg = "${msg}";
        if (msg === "UNNATURALNESS"){
            swal("Sorry!", "Unnaturalness access", "error");
        }
        if (msg === "SUCCESS"){
            swal("Complete!", "Edit complete!", "success");
        }
    });
</script>
<script src="/dist/js/homeMouseover.js"></script>
</body>
</html>