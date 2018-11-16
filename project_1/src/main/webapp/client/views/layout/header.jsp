<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- header-top-area-start -->
<div class="header-top-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="language-area">
                    <ul id="language-ul-tag" style="cursor: pointer">
                    </ul>
                </div>
            </div>
            <div class="pull-right">
                <spring:url value="/login" var="loginUrl"/>
                <spring:url value="/security_logout" var="logoutUrl"/>
                <ul class="nav pull-right">
                    <security:authorize access="isAuthenticated()">

                    <li class="dropdown"><a href="#" class="dropdown-toggle" style="color: #363636"
                                            data-toggle="dropdown"><security:authentication
                            property="principal.username"/><b class="caret"></b></a>
                        <ul class="dropdown-menu" style="right: 0; left: revert">
                            <li><a href="#"><i class="icon-cog"></i> Preferences</a></li>
                            <li><a href="#"><i class="icon-envelope"></i> Contact Support</a></li>
                            <li class="divider"></li>
                            <li><a id="logout-button" style="cursor: pointer"><i class="icon-off"></i> Logout</a></li>
                            <li style="display: none">
                                <form id="logout-form" action="${logoutUrl}" method="post">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <input type="submit"></input>
                                </form>
                            </li>
                        </ul>
                        </security:authorize>
                        <security:authorize access="isAnonymous()">
                    <li><a style="color: #363636" href="${loginUrl}"> <spring:message code="label.login"/></a></li>
                    </security:authorize>
                    </li>

                </ul>
            </div>
        </div>
    </div>
</div>
<!-- header-top-area-end -->
<!-- header-mid-area-start -->
<div class="header-mid-area ptb-40">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-5 col-xs-12">
                <div class="header-search">
                    <form id="search-form" method="get" action="/books/search">
                        <input name="bookName" type="text"
                               placeholder="<spring:message code="label.search.placeholder"/>"/>
                        <a id="btn-search" href="#"><i class="fa fa-search"></i></a>
                    </form>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-4 col-xs-12">
                <div class="logo-area text-center logo-xs-mrg">
                    <a href="/"><img src="/client/assets/img/logo/logo.png" alt="logo"/></a>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">

                <div class="my-cart">
                    <ul>
                        <li><a href="#"><i class="fa fa-shopping-cart"></i><spring:message code="label.cart"/></a>
                            <c:set var="number" value="0"/>
                            <c:if test="${cart != null}">
                                <c:forEach items="${cart.getCartDetails()}" var="cd">
                                    <c:set var="number" value="${number + cd.amount}"/>
                                </c:forEach>
                            </c:if>
                            <span id="number-in-cart">${number}</span>
                            <div class="mini-cart-sub">
                                <c:forEach items="${myCart.cartDetails}" var="c">
                                    <div class="cart-product">
                                        <div class="single-cart">
                                            <div class="cart-img">
                                                <a href="#"><img src="/img-book/${c.book.avatar}" alt="book"/></a>
                                            </div>
                                            <div class="cart-info">
                                                <h5><a href="#">${c.book.title}</a></h5>
                                                <p>${c.amount} x $${c.book.price}</p>
                                                <c:set var="number" value="${number + c.amount}"/>
                                            </div>
                                            <div class="cart-icon">
                                                <a href="#"><i class="fa fa-remove"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <div class="cart-bottom">

                                    <a id="view-cart" class="view-cart" href="/carts/${myCart.id}"><spring:message code="label.view.cart"/></a>

                                    <a href="checkout.html"><spring:message code="label.checkout"/></a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- header-mid-area-end -->
<!-- main-menu-area-start -->
<div class="main-menu-area hidden-sm hidden-xs" id="header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="menu-area">
                    <nav>
                        <ul>
                            <li class="active"><a href="/"><spring:message code="label.home"/> <i
                                    class="fa fa-angle-down"></i></a>

                            </li>
                            <li><a href="product-details.html"><spring:message code="label.book"/> <i
                                    class="fa fa-angle-down"></i></a>
                                <div class="mega-menu">
                                    <c:forEach items="${categories}" var="cate">
                                        <c:if test="${not empty cate}">
                                            <span>
                                            <a href="#" class="title">${cate.categoryName}</a>
                                            <c:forEach items="${cate.categoryDetails}" var="cateDetail">
                                                <a href="shop.html">${cateDetail.categoryDetailName}</a>
                                            </c:forEach>
                                        </span>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </li>
                            <li><a href="product-details.html"><spring:message code="label.audio.book"/> <i
                                    class="fa fa-angle-down"></i></a>
                                <div class="mega-menu">
    <span>
    <a href="#" class="title">Shirts</a>
    <a href="shop.html">Tops & Tees</a>
    <a href="shop.html">Sweaters </a>
    <a href="shop.html">Hoodies</a>
    <a href="shop.html">Jackets & Coats</a>
    </span>
                                    <span>
    <a href="#" class="title">Tops & Tees</a>
    <a href="shop.html">Long Sleeve </a>
    <a href="shop.html">Short Sleeve</a>
    <a href="shop.html">Polo Short Sleeve</a>
    <a href="shop.html">Sleeveless</a>
    </span>
                                    <span>
    <a href="#" class="title">Jackets</a>
    <a href="shop.html">Sweaters</a>
    <a href="shop.html">Hoodies</a>
    <a href="shop.html">Wedges</a>
    <a href="shop.html">Vests</a>
    </span>
                                    <span>
    <a href="#" class="title">Jeans Pants</a>
    <a href="shop.html">Polo Short Sleeve</a>
    <a href="shop.html">Sleeveless</a>
    <a href="shop.html">Graphic T-Shirts</a>
    <a href="shop.html">Hoodies</a>
    </span>
                                </div>
                            </li>
                            <li><a href="product-details.html"><spring:message code="label.children.book"/> <i
                                    class="fa fa-angle-down"></i></a>
                                <div class="mega-menu mega-menu-2">
    <span>
    <a href="#" class="title">Tops</a>
    <a href="shop.html">Shirts</a>
    <a href="shop.html">Florals</a>
    <a href="shop.html">Crochet</a>
    <a href="shop.html">Stripes</a>
    </span>
                                    <span>
    <a href="#" class="title">Bottoms</a>
    <a href="shop.html">Shorts</a>
    <a href="shop.html">Dresses</a>
    <a href="shop.html">Trousers</a>
    <a href="shop.html">Jeans</a>
    </span>
                                    <span>
    <a href="#" class="title">Shoes</a>
    <a href="shop.html">Heeled sandals</a>
    <a href="shop.html">Flat sandals</a>
    <a href="shop.html">Wedges</a>
    <a href="shop.html">Ankle boots</a>
    </span>
                                </div>
                            </li>
                            <li><a href="#">blog<i class="fa fa-angle-down"></i></a>
                                <div class="sub-menu sub-menu-2">
                                    <ul>
                                        <li><a href="blog.html">blog</a></li>
                                        <li><a href="blog-details.html">blog-details</a></li>
                                    </ul>
                                </div>
                            </li>

                        </ul>
                    </nav>
                </div>
                <div class="safe-area">
                    <a href="product-details.html">sales off</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- main-menu-area-end -->
<!-- mobile-menu-area-start -->

<div class="mobile-menu-area hidden-md hidden-lg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="mobile-menu">
                    <nav id="mobile-menu-active">
                        <ul id="nav">
                            <li><a href="/">Home</a>
                            </li>
                            <li><a href="product-details.html">Book</a>
                                <ul>
                                    <li><a href="shop.html">Tops & Tees</a></li>
                                    <li><a href="shop.html">Polo Short Sleeve</a></li>
                                    <li><a href="shop.html">Graphic T-Shirts</a></li>
                                    <li><a href="shop.html">Jackets & Coats</a></li>
                                    <li><a href="shop.html">Fashion Jackets</a></li>
                                    <li><a href="shop.html">Crochet</a></li>
                                    <li><a href="shop.html">Sleeveless</a></li>
                                    <li><a href="shop.html">Stripes</a></li>
                                    <li><a href="shop.html">Sweaters</a></li>
                                    <li><a href="shop.html">hoodies</a></li>
                                    <li><a href="shop.html">Heeled sandals</a></li>
                                    <li><a href="shop.html">Polo Short Sleeve</a></li>
                                    <li><a href="shop.html">Flat sandals</a></li>
                                    <li><a href="shop.html">Short Sleeve</a></li>
                                    <li><a href="shop.html">Long Sleeve</a></li>
                                    <li><a href="shop.html">Polo Short Sleeve</a></li>
                                    <li><a href="shop.html">Sleeveless</a></li>
                                    <li><a href="shop.html">Graphic T-Shirts</a></li>
                                    <li><a href="shop.html">Hoodies</a></li>
                                    <li><a href="shop.html">Jackets</a></li>
                                </ul>
                            </li>
                            <li><a href="product-details.html">Audio books</a>
                                <ul>
                                    <li><a href="shop.html">Tops & Tees</a></li>
                                    <li><a href="shop.html">Sweaters</a></li>
                                    <li><a href="shop.html">Hoodies</a></li>
                                    <li><a href="shop.html">Jackets & Coats</a></li>
                                    <li><a href="shop.html">Long Sleeve</a></li>
                                    <li><a href="shop.html">Short Sleeve</a></li>
                                    <li><a href="shop.html">Polo Short Sleeve</a></li>
                                    <li><a href="shop.html">Sleeveless</a></li>
                                    <li><a href="shop.html">Sweaters</a></li>
                                    <li><a href="shop.html">Hoodies</a></li>
                                    <li><a href="shop.html">Wedges</a></li>
                                    <li><a href="shop.html">Vests</a></li>
                                    <li><a href="shop.html">Polo Short Sleeve</a></li>
                                    <li><a href="shop.html">Sleeveless</a></li>
                                    <li><a href="shop.html">Graphic T-Shirts</a></li>
                                    <li><a href="shop.html">Hoodies</a></li>
                                </ul>
                            </li>
                            <li><a href="product-details.html">childrenís books</a>
                                <ul>
                                    <li><a href="shop.html">Shirts</a></li>
                                    <li><a href="shop.html">Florals</a></li>
                                    <li><a href="shop.html">Crochet</a></li>
                                    <li><a href="shop.html">Stripes</a></li>
                                    <li><a href="shop.html">Shorts</a></li>
                                    <li><a href="shop.html">Dresses</a></li>
                                    <li><a href="shop.html">Trousers</a></li>
                                    <li><a href="shop.html">Jeans</a></li>
                                    <li><a href="shop.html">Heeled sandals</a></li>
                                    <li><a href="shop.html">Flat sandals</a></li>
                                    <li><a href="shop.html">Wedges</a></li>
                                    <li><a href="shop.html">Ankle boots</a></li>
                                </ul>
                            </li>
                            <li><a href="#">blog</a>
                                <ul>
                                    <li><a href="blog.html">Blog</a></li>
                                    <li><a href="blog-details.html">blog-details</a></li>
                                </ul>
                            </li>

                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- mobile-menu-area-end -->
<head>
    <script>
        document.getElementById("logout-button").onclick = function () {
            document.getElementById("logout-form").submit();
        }
    </script>
</head>