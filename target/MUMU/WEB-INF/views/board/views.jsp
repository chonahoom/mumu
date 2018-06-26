<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<!DOCTYPE html>
<html>
<%--head.jsp--%>
<%@ include file="../include/head.jsp" %>
<%--Handlebars.js 추가--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
<script>
    window.onload = function(){
        if("${sessionScope.userLoginInfo.name}" === '')
            location.href="/user/login";
    }
    function articleClick() {
        var rsa = new RSAKey();
        var passValue;
        rsa.setPublic("${modulus}", "${exponent}");
        passValue = rsa.encrypt($('input[name="historyNumber"]').val());
        $('input[name="historyNumber"]').val(passValue);
    }
    function listClick(referrer) {
        var rsa = new RSAKey();
        var passValue;
        var getValue;
        if(referrer === "http://localhost:8088/board/sheet-historys" || referrer ==="http://rmb-evaluation.japaneast.cloudapp.azure.com:8080/board/sheet-historys"){
            location.href="/board/sheet-historys";
        }else{
            if(referrer.length === 313){
                passValue = referrer.substring(0,57);//local
            }else{
                passValue = referrer.substring(0,91);//server
            }
            rsa.setPublic("${modulus}", "${exponent}");
            getValue = rsa.encrypt("${boardVO.historyWriter}");
            location.href=passValue +getValue;
        }
    }
</script>
<link rel="stylesheet" href="/dist/css/board/views.css">
<body class="hold-transition skin-red-light sidebar-mini layout-boxed">
<div class="wrapper">
    <%-- Main Header --%>
    <%@ include file="../include/main_header.jsp" %>
    <%-- Left side column. contains the logo and sidebar --%>
    <%@ include file="../include/left_column.jsp" %>
    <%-- Content Wrapper. Contains page content --%>
    <div class="content-wrapper">
        <%-- Content Header (Page header) --%>
        <section class="content-header">
            <h1>View</h1>
            <ol class="breadcrumb">
                <li><a href="<c:url value="/board/sheet-historys"/>"><i class="fa fa-dashboard"></i>history</a></li>
                <li class="active">read</li>
            </ol>
        </section>
        <%-- Main content --%>
        <section class="content container-fluid">
            <div class="col-lg-12">
                <%--Article area--%>
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">${boardVO.historyTitle}</h3>
                    </div>
                    <c:forEach var="contentVO" varStatus="i" items="${contentVO}">
                        <%--Task area--%>
                        <div class="box-body" style="max-height: 10000px; min-height:600px; padding-left: 20px">
                            <span style="background-color: #9cc2cb; width: 90%; padding-right: 90%">TASK  <b>${contentVO.taskNumber+1}</b></span><br><br>
                            <span style="display: inline-block; text-align: center"><b>Task Type</b><br>${matchingVO.taskType[i.index]}<br><br></span>
                            <span style="display: inline-block; margin-left: 40px; text-align: center"><b>Start date ~ End date</b><br>${contentVO.taskDate}<br><br></span>
                            <span style="display: inline-block; margin-left: 40px; text-align: center"><b>Weight</b><br>${contentVO.taskWeight} % <br><br></span><br>
                            <b>Goal Title</b><br>
                            <div class="contents">${contentVO.taskGoalTitle}</div><br><br>
                            <b>Goal Description</b><br>
                            <div class="contents">${fn:replace(fn:replace(fn:escapeXml(contentVO.taskGoalDescription), newLine, "<br/>") , " ", "&nbsp;")}</div><br><br>
                            <b>Evaluation comments by Self</b><br>
                            <div class="contents">${fn:replace(fn:replace(fn:escapeXml(contentVO.taskEvaluationComment), newLine, "<br/>") , " ", "&nbsp;")}</div><br><br>
                            <b>Rating by Self</b>
                            <div class="contents">${matchingVO.taskRate[i.index]}</div>
                            <hr>
                        </div>
                    </c:forEach>
                    <%--------------------------------------------------------------COMPETENCY--------------------------------------------------------------%>
                    <div class="competency" style="padding-left: 20px">
                        <span style="background-color: #DC143C; width: 90%; padding-right: 83.5%">COMPETENCY</span><br><br>
                        <b>Goal Setting Comments for competencies</b><br>
                        <div class="contents">${fn:replace(fn:replace(fn:escapeXml(contentVO[0].taskCompetency), newLine, "<br/>") , " ", "&nbsp;")}</div><br><br>
                        <span><b>Five Principles</b><br>
                            <div class="contents">${matchingVO.competencyTitle}</div><br><br></span>
                        <span><b>Rating by Self (principle)</b><br>
                            <div class="contents">${matchingVO.competencyRate}</div><br><br></span>
                        <b>Overall performance Comments</b><br>
                        <div class="contents">${fn:replace(fn:replace(fn:escapeXml(competencyVO.overallPerformanceComment), newLine, "<br/>") , " ", "&nbsp;")}</div><br><br>
                    </div>
                    <div class="box-footer">
                        <div class="user-block">
                            <span class="username">
                                <a href="#">${boardVO.historyWriter}</a>
                            </span>
                            <span class="description"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.historyUpdatedDate}"/></span>
                        </div>
                    </div>
                </div>
                <%--Article area end--%>
                <div>
                    <%--for keeping page information--%>
                    <form role="form" method="post">
                        <input type="hidden" name="historyNumber" value="${boardVO.historyNumber}">
                        <input type="hidden" name="page" value="${criteria.page}">
                        <input type="hidden" name="perPageNum" value="${criteria.perPageNum}">
                    </form>
                    <button type="submit" class="btn btn-warning modBtn"><i class="fa fa-edit"></i> modify</button>
                    <button type="submit" class="btn btn-danger delBtn"><i class="fa fa-trash"></i> delete</button>
                    <button type="submit" class="btn btn-primary listBtn pull-right"><i class="fa fa-list"></i> list
                    </button>
                </div>
                <br/>
            </div>
        </section>
        <%-- /.content --%>
    </div>
    <%-- /.content-wrapper --%>
    <%-- Main Footer --%>
    <%@ include file="../include/main_footer.jsp" %>
</div>
<%-- ./wrapper --%>
<%@ include file="../include/plugin_js.jsp" %>
<script>
    $(document).ready(function () {
        var formObj = $("form[role='form']");
        // click modify button
        $(".modBtn").on("click", function () {
            articleClick();
            formObj.attr("action", "/board/modify");
            formObj.attr("method", "get");
            formObj.submit();
        });

        // click delete button
        $(".delBtn").on("click", function () {
            swal({
                title: "Are you sure?",
                text: "Once deleted, you will not be able to recover this sheet!",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
                .then((willDelete) => {
                if (willDelete) {
                    formObj.attr("action", "/board/remove");
                    formObj.submit();
                }
            });
        });
        // click list button
        $(".listBtn").on("click", function () {
            $("input[name=historyNumber]").remove();
            formObj.attr("method", "get");
            listClick(document.referrer);
        });
    });
</script>
</body>
</html>