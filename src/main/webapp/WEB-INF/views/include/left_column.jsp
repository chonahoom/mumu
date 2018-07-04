<%@ page contentType="text/html;charset=UTF-8"%>
<%--left_column.jsp--%>
<aside class="main-sidebar">
    <%-- sidebar: style can be found in sidebar.less --%>
    <section class="sidebar">
        <%-- Sidebar Menu --%>
        <ul class="sidebar-menu" data-widget="tree">
            <%-- Optionally, you can add icons to the links --%>
            <li class="treeview active">
                <ul class="treeview-menu">
                    <li style="margin-top: 5px;"><a href="<c:url value="/board/sheets"/>" ><i class="fa fa-edit"></i><span style="font-size: 16px"> Creat Evaluation Sheet</span></a></li>
                    <li style="margin-top: 5px;"><a href="<c:url value="/board/sheet-historys"/>"><i class="fa fa-list"></i> <span style="font-size: 16px;"> My History</span></a></li>
                    <li style="margin-top: 5px;"><a href="<c:url value="/user/member-sheet-historys"/>"><i class="fa fa-users"></i> <span style="font-size: 16px;"> Member's History</span></a></li>
                </ul>
            </li>
        </ul>
        <%-- /.sidebar-menu --%>
    </section>
    <%-- /.sidebar --%>
</aside>

