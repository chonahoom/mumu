<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%--head.jsp--%>
<%@ include file="../include/head.jsp" %>
<script>
    window.onload = function(){
        if("${sessionScope.userLoginInfo.name}" === '')
            location.href="/user/login";
    }
    function sheetClick(a, b) {
        var rsa = new RSAKey();
        var path;
        rsa.setPublic("${modulus}", "${exponent}");
        path = rsa.encrypt(b);
        location.href = a + path;
    }
</script>
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
            <c:choose>
                <c:when test="${memberStory.memberName != NULL}">
                    <h1>
                            ${memberStory.memberName}'s History
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="<c:url value="/"/>"><i class="fa fa-dashboard"></i> home</a></li>
                        <li class="active">${memberStory.memberName}'s history</li>
                    </ol>
                </c:when>
                <c:otherwise>
                    <h1>
                        My History
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="<c:url value="/"/>"><i class="fa fa-dashboard"></i> home</a></li>
                        <li class="active">my history</li>
                    </ol>
                </c:otherwise>
            </c:choose>
        </section>
        <%-- Main content --%>
        <section class="content container-fluid">
            <div class="col-lg-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">History List</h3>
                    </div>
                    <div class="box-body">
                        <%--Article list area--%>
                        <div>
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <th style="width: 10px">NO</th>
                                    <th>Subject</th>
                                    <th style="width: 100px">Writer</th>
                                    <th style="width: 150px">Create date</th>
                                </tr>
                                <c:choose>
                                    <c:when test="${list != NULL && list != '[]'}">
                                        <c:forEach var="boardVO" varStatus="i" items="${list}">
                                            <tr>
                                                <td>${boardVO.historyNumber}</td>
                                                <td>
                                                    <a href="#"
                                                       onclick="sheetClick('/board/views${pageMaker.makePage(pageMaker.criteria.page)}&historyNumber=','${boardVO.historyNumber}')">${boardVO.historyTitle}</a>
                                                </td>
                                                <td>${boardVO.historyWriter}</td>
                                                <td><fmt:formatDate pattern="yyyy-MM-dd"
                                                                    value="${boardVO.historyUpdatedDate}"/></td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="4">you don't have evaluation sheet. please push create
                                                button.
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>
                        <%--paging processing area--%>
                        <div class="text-center">
                            <ul class="pagination">
                                <c:if test="${pageMaker.prev}">
                                    <li>
                                        <a href="/board/sheet-historys${pageMaker.makePage(pageMaker.startPage - 1)}">&laquo;</a>
                                    </li>
                                </c:if>
                                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                                    <li <c:out value="${pageMaker.criteria.page == idx? 'class=active':''}"/>>
                                        <a href="/board/sheet-historys${pageMaker.makePage(idx)}">${idx}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                    <li>
                                        <a href="/board/sheet-historys${pageMaker.makePage(pageMaker.endPage + 1)}">&raquo;</a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>

                    </div>
                </div>
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
        var result = "${msg}";
        // create sheet
        if (result === "INSERTED") {
            swal("Completed!", "Created evaluation sheet", "success");
        }
        // remove sheet
        if (result === "REMOVED") {
            swal("Completed!", "Removed evaluation sheet", "success");
        }
        // modified sheet
        if (result === "MODIFIED") {
            swal("Completed!", "Modified evaluation sheet", "success");
        }
    });
</script>
</body>
</html>