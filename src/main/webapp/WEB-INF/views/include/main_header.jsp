<%@ page contentType="text/html;charset=UTF-8" %>
<%-- Main Header --%>
<header class="main-header">
    <%-- Logo --%>
    <a href="<c:url value="/"/>" class="logo">
        <%-- logo for regular state and mobile devices --%>
        <span class="logo-lg"><b>MUMU</b></span>
    </a>
    <%-- Header Navbar --%>
    <nav class="navbar navbar-static-top" role="navigation">
        <%-- Navbar Right Menu --%>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <%-- User Account Menu --%>
                <li class="dropdown user user-menu">
                    <%-- Menu Toggle Button --%>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <%-- hidden-xs hides the username on small devices so only the image appears. --%>
                        <span class="hidden-xs">
                            <i class="fa fa-user-circle-o">
                                ${sessionScope.userLoginInfo.name}
                            </i>
                        </span>
                    </a>
                    <ul class="dropdown-menu">
                        <%-- The user image in the menu --%>
                        <li class="user-header">
                            <p>
                                <b>${sessionScope.userLoginInfo.name}</b>
                                <small>${sessionScope.userLoginInfo.employeeNumber}</small>
                            </p>
                        </li>
                        <%-- Menu Body --%>
                        <%-- Menu Footer--%>
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="<c:url value="/user/edit"/>" class="btn btn-default btn-flat"><i class="fa fa-edit">
                                    edit</i></a>
                            </div>
                            <div class="pull-right">
                                <a href="<c:url value="/user/logout"/>" class="btn btn-default btn-flat"><i class="fa fa-sign-out">
                                    logout</i></a>
                            </div>
                        </li>
                    </ul>
                </li>
                <%-- Control Sidebar Toggle Button --%>
            </ul>
        </div>
    </nav>
</header>