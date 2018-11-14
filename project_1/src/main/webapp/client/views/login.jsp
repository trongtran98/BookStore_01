<%--
  Created by IntelliJ IDEA.
  User: jocker
  Date: 09/11/2018
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header-area-end -->
<!-- breadcrumbs-area-start -->


<div class="breadcrumbs-area mb-70">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumbs-menu">
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#" class="active">login</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- breadcrumbs-area-end -->
<!-- user-login-area-start -->
<div class="user-login-area mb-70">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="login-title text-center mb-30">
                    <h2>Login</h2>
                    <p>doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo<br>inventore veritatis et quasi
                        architecto beat</p>
                </div>
            </div>
            <spring:url var="securityLogin" value="/security_login"/>
            <form action="${securityLogin}" method="POST">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-12 col-xs-12">
                    <div class="login-form">
                        <div class="single-login">
                            <label>Username or email<span>*</span></label>
                            <input name="email" type="text"/>
                        </div>
                        <div class="single-login" style="margin-bottom: 0">
                            <label>Passwords <span>*</span></label>
                            <input type="password" name="password"/>
                        </div>
                        <div class="single-login single-login-2">
                            <input id="rememberme" type="checkbox" name="remember-me">
                            <span>Remember me</span><br>
                            <input type="submit" value="Login"
                                   style="margin-top: 15px; background-color: #FF742D; color: white">
                        </div>
                        <a href="#"><span style="text-indent: 20px">Lost your password?</span></a>
                        <hr>
                        <div style="display: flex;
  align-items: center;
  justify-content: center;">
                            <button class="loginBtn loginBtn--facebook">
                                Login with Facebook
                            </button>
                            <spring:message code="google.request.url" var="googleReqUrl"/>
                            <a href="${googleReqUrl}">
                                <button type="button" class="loginBtn loginBtn--google">
                                    Login with Google
                                </button>

                            </a>

                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <p class="error">
                            <c:if test="${not empty errorMessage}">
                                <spring:message code="${errorMessage}"/>
                            </c:if>
                        </p
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
