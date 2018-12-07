<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<header class="header">
    <div class="logo-container">
        <a href="../" class="logo">
            <img src="/client/assets/img/logo/logo.png" height="35" alt="JSOFT Admin">
        </a>
        <div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html"
             data-fire-event="sidebar-left-opened">
            <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
        </div>
    </div>
</div>

<!-- start: search & user box -->
<div class="header-right">
<span class="separator"></span>

<div id="userbox" class="userbox">
<spring:url value="/login" var="loginUrl"/>
<spring:url value="/security_logout" var="logoutUrl"/>
<security:authorize access="isAuthenticated()">
    <a href="#" data-toggle="dropdown">
        <div class="profile-info" data-lock-name="John Doe" data-lock-email="johndoe@JSOFT.com">
                    <span class="name"><security:authentication
                            property="principal.username"/></span>
            <span class="role">administrator</span>
        </div>
                    <i class="fa custom-caret"></i>
                </a>

                <div class="dropdown-menu">
                    <ul class="list-unstyled">
                        <li class="divider"></li>
                        <li>
                            <a role="menuitem" tabindex="-1" href="pages-user-profile.html"><i class="fa fa-user"></i>
                                My
                                Profile</a>
                        </li>
                        <li>
                            <a role="menuitem" tabindex="-1" href="#" data-lock-screen="true"><i class="fa fa-lock"></i>
                                Lock Screen</a>
                        </li>
                        <li>
                            <form id="admin-logout-form" action="${logoutUrl}" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" hidden>
                            </form>
                            <a role="menuitem" style="cursor: pointer" id="admin-logout" onclick="adminLogout()"
                               tabindex="-1"><i class="fa fa-power-off"></i> Logout</a>
                        </li>
                    </ul>
                </div>
            </security:authorize>
        </div>
    </div>
    <!-- end: search & user box -->
</header>
<!-- end: header -->
<head>
    <script src="/admin/assets/custom/customize.js">

    </script>
</head>
