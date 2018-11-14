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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="breadcrumbs-area mb-70">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumbs-menu">
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#" class="active">register</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="user-login-area mb-70">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="login-title text-center mb-30">
                    <h2>Sign Up</h2>
                    <p>doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo<br>inventore veritatis et quasi
                        architecto beat</p>
                </div>
            </div>
            <form id="idForm" action="/register" method="POST">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-12 col-xs-12">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="login-form">
                        <div class="single-login">
                            <label>Full name <span>*</span></label>
                            <input name="fullName" type="text" required/>
                        </div>

                        <div class="single-login">
                            <label>Email Address <span>*</span></label>
                            <input name="email" type="email" required/>
                        </div>

                        <div class="single-login" style="margin-bottom: 0">
                            <label>Account password <span>*</span></label>
                            <input type="password" name="password"required/>
                        </div>

                        <div class="single-login" style="margin-bottom: 0">
                            <label>Confirm password <span>*</span></label>
                            <input type="password" required/>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="single-register">
                                    <label>Phone <span>*</span></label>
                                    <input type="tel" name="phone" required/>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="single-register">
                                    <label>Gender <span>*</span></label>
                                    <select name="gender" class="chosen-select">
                                        <option value="true">Male</option>
                                        <option value="false">Female</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="single-login single-login-2">
                            <%--<input id="rememberme" type="checkbox" name="remember-me">--%>
                            <span>I agree Terms &amp; Condition</span>
                            <input type="submit" value="Register"
                                   style="margin-top: 15px; background-color: #FF742D; color: white">
                        </div>
                        <br/>

                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<head>

</head>