<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<%--head.jsp--%>
<%@ include file="../include/head.jsp" %>
<script src="/dist/js/sessionCheck.js"></script>
<script>
    function memberClick(a, b) {
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
            <h1>
                Member's History
                <small></small>
            </h1>
        </section>
        <%-- Main content --%>
        <section class="content container-fluid">
            <div class="col-lg-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Member List</h3>
                    </div>
                    <div class="box-body">
                        <%--Article list area--%>
                        <div>
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <th style="width: 20px;">Number</th>
                                    <th>Member's Name</th>
                                </tr>
                                <c:choose>
                                    <c:when test="${memberVO.members != NULL && memberVO.members != '[]'}">
                                        <c:forEach var="memberVODev1" varStatus="i" items="${memberVO.members}">
                                            <tr>
                                                <td>${memberVODev1.employeeNumber}</td>
                                                <td><a href="#"
                                                       onclick="memberClick('/board/member-sheet-view?memberName=','${memberVODev1.name}')">${memberVODev1.name}</a>
                                                </td>
                                            </tr>
                                            <c:forEach var="memberVODev2" varStatus="i" items="${memberVODev1.members}">
                                                <tr>
                                                    <td>${memberVODev2.employeeNumber}</td>
                                                    <td><a href="#"
                                                           onclick="memberClick('/board/member-sheet-view?memberName=','${memberVODev2.name}')">${memberVODev2.name}</a>
                                                    </td>
                                                </tr>
                                                <c:forEach var="memberVODev3" varStatus="i"
                                                           items="${memberVODev2.members}">
                                                    <tr>
                                                        <td>${memberVODev3.employeeNumber}</td>
                                                        <td><a href="#"
                                                               onclick="memberClick('/board/member-sheet-view?memberName=','${memberVODev3.name}')">${memberVODev3.name}</a>
                                                        </td>
                                                    </tr>
                                                    <c:forEach var="memberVODev4" varStatus="i"
                                                               items="${memberVODev3.members}">
                                                        <tr>
                                                            <td>${memberVODev4.employeeNumber}</td>
                                                            <td><a href="#"
                                                                   onclick="memberClick('/board/member-sheet-view?memberName=','${memberVODev4.name}')">${memberVODev4.name}</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:forEach>
                                            </c:forEach>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="4">you don't have members. this tab is for supervisor.</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>

                                </tbody>
                            </table>
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
</body>
</html>