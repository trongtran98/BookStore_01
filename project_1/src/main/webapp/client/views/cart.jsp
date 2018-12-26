<%--
  Created by IntelliJ IDEA.
  User: jocker
  Date: 09/11/2018
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="breadcrumbs-area mb-70">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumbs-menu">
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#" class="active">cart</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="entry-header-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="entry-header-title">
                    <h2>Cart</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="cart-main-area mb-70">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <form:form name="cart-form" id="cart-form" method="POST"
                           action="/carts/update" modelAttribute="cart">
                    <div class="table-content table-responsive">
                        <table>
                            <thead>
                            <tr>
                                <th class="product-thumbnail">Image</th>
                                <th class="product-name">Product</th>
                                <th class="product-price">Price</th>
                                <th class="product-quantity">Quantity</th>
                                <th class="product-subtotal">Total</th>
                                <th class="product-remove">Remove</th>
                            </tr>
                            </thead>
                            <tbody>
                            <form:input path="id" type="hidden"/>
                            <c:set var="total" value="0"/>
                            <c:if test="${not empty cart}">
                                <c:forEach items="${cart.cartDetails}" var="cd" varStatus="status">
                                    <tr>
                                        <form:input path="cartDetails[${status.index}].id" type="hidden"/>
                                        <td class="product-thumbnail"><a href="#">
                                            <c:set var = "imageBook" value = "${fn:split(cd.book.avatar, '#')}" />
                                            <img src="${imageBook[0]}"  alt="man"/>
                                        </td>
                                        <td class="product-name"><a href="#">${cd.book.title}</a></td>
                                        <td class="product-price"><span class="amount">$${cd.book.price}</span></td>
                                        <td><form:input path="cartDetails[${status.index}].amount" type="number" min="0"
                                                        max="10" cssClass="product-quantity"/></td>
                                        <td class="product-subtotal">$${cd.amount * cd.book.price}</td>
                                        <c:set var="total" value="${total + (cd.amount * cd.book.price)}"/>
                                        <td class="product-remove"><a href="/carts/remove-from-cart/${cd.id}"><i
                                                class="fa fa-times"></i></a></td>
                                    </tr>
                                </c:forEach>
                            </c:if>

                            </tbody>
                        </table>
                    </div>
                </form:form>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12">
                <div class="buttons-cart mb-30">
                    <ul>
                        <li><a id="update-cart" href="#">Update Cart</a></li>
                        <li><a href="#">Continue Shopping</a></li>
                    </ul>
                </div>
                <div class="coupon">
                    <h3>Coupon</h3>
                    <p>Enter your coupon code if you have one.</p>
                    <form action="#">
                        <input type="text" placeholder="Coupon code">
                        <a href="#">Apply Coupon</a>
                    </form>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="cart_totals">
                    <h2>Cart Totals</h2>
                    <table>
                        <tbody>
                        <tr class="cart-subtotal">
                            <th>Subtotal</th>
                            <td>
                                <span class="amount">$${total}</span>
                            </td>
                        </tr>
                        <tr class="shipping">
                            <th>Shipping</th>
                            <td>
                                <ul id="shipping_method">
                                    <li>
                                        <input checked type="radio">
                                        <label> Free Shipping </label>
                                    </li>
                                </ul>
                                <a href="#">Calculate Shipping</a>
                            </td>
                        </tr>
                        <tr class="order-total">
                            <th>Total</th>
                            <td>
                                <strong>
                                    <span class="amount">$${total}</span>
                                </strong>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="wc-proceed-to-checkout">
                        <a href="/orders/${cart.id}">Proceed to Checkout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>