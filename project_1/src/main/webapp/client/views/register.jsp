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
            <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                <div class="billing-fields">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="single-register">
                                <form action="#">
                                    <label>First Name<span>*</span></label>
                                    <input type="text">
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="single-register">
                                <form action="#">
                                    <label>Last Name<span>*</span></label>
                                    <input type="text">
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="single-register">
                                <form action="#">
                                    <label>Email Address<span>*</span></label>
                                    <input type="text">
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="single-register">
                                <form action="#">
                                    <label>Phone<span>*</span></label>
                                    <input type="text">
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="single-register">
                        <form action="#">
                            <label>Account password<span>*</span></label>
                            <input type="text" placeholder="Password">
                        </form>
                    </div>
                    <div class="single-register">
                        <form action="#">
                            <label>Confirm password<span>*</span></label>
                            <input type="text" placeholder="Password">
                        </form>
                    </div>
                    <div class="single-register single-register-3">
                        <input id="rememberme" type="checkbox" name="rememberme" value="forever">
                        <label class="inline">I agree <a href="#">Terms &amp; Condition</a></label>
                    </div>
                    <div class="single-register">
                        <a href="#">Register</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
