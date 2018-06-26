<%@ page contentType="text/html;charset=UTF-8"%>
<%--left_column.jsp--%>
<aside class="main-sidebar">
    <%-- sidebar: style can be found in sidebar.less --%>
    <section class="sidebar">
        <%-- Sidebar Menu --%>
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">MENU</li>
            <%-- Optionally, you can add icons to the links --%>
            <li class="treeview active">
                <a href="#">
                    <i class="fa fa-certificate"></i>
                    <span>Evaluation System</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="<c:url value="/board/sheets"/>"><i class="fa fa-edit"></i>
                        <span> Creat Evaluation Sheet</span></a></li>
                    <li><a href="<c:url value="/board/sheet-historys"/>"><i class="fa fa-list"></i> <span> My History</span></a></li>
                    <li><a href="<c:url value="/user/member-sheet-historys"/>"><i class="fa fa-users"></i> <span> Member's History</span></a></li>
                </ul>
            </li>
        </ul>
        <%-- /.sidebar-menu --%>
    </section>
    <%-- /.sidebar --%>
</aside>
