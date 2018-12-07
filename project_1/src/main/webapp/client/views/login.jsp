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
                        <li><a href="#"><spring:message code="label.home"/></a></li>
                        <li><a href="#" class="active"><spring:message code="label.login"/></a></li>
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
                    <h2><spring:message code="label.login"/></h2>
                </div>
            </div>
            <spring:url var="securityLogin" value="/security_login"/>
            <form action="${securityLogin}" method="POST">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-12 col-xs-12">
                    <div class="login-form">
                        <div class="single-login">
                            <label><spring:message code="label.username.or.email"/> <span>*</span></label>
                            <input name="email" type="text"/>
                        </div>
                        <div class="single-login" style="margin-bottom: 0">
                            <label><spring:message code="label.password"/> <span>*</span></label>
                            <input type="password" name="password"/>
                        </div>
                        <div class="single-login single-login-2">
                            <input id="rememberme" type="checkbox" name="remember-me">
                            <span><spring:message code="label.remember"/></span><br>
                            <input type="submit" value="<spring:message code="label.login"/>"
                                   style="margin-top: 15px; background-color: #FF742D; color: white">
                        </div>
                        <a href="/register"><span style="text-indent: 20px"><spring:message code="label.register"/></span></a>
                        <br/>
                        <a href="#"><span style="text-indent: 20px"><spring:message code="label.lost.password"/> </span></a>
                        <div style="text-align: center">
                            <scan id="message-error-login">
                                <c:if test="${not empty errorMessage}">
                                    <spring:message code="${errorMessage}"/>
                                </c:if>
                            </scan>
                        </div>
                        <hr>
                        <div style="display: flex;
  align-items: center;
  justify-content: center;">
                            <button class="loginBtn loginBtn--facebook">
                                <spring:message code="label.with.facebook"/>
                            </button>
                            <spring:message code="google.request.url" var="googleReqUrl"/>
                            <a href="${googleReqUrl}">
                                <button type="button" class="loginBtn loginBtn--google">
                                    <spring:message code="label.with.google"/>
                                </button>
                            </a>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
