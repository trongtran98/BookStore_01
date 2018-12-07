<%--
  Created by IntelliJ IDEA.
  User: jocker
  Date: 09/11/2018
  Time: 14:13
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
                        <li><a href="#" class="active">shop</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="shop-main-area mb-70">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                <div class="shop-left">
                    <div class="section-title-5 mb-30">
                        <h2>Shopping Options</h2>
                    </div>
                    <div class="left-title mb-20">
                        <h4>Category</h4>
                    </div>
                    <div class="left-menu mb-30">
                        <ul>
                            <li><a href="#">Jackets<span>(15)</span></a></li>
                            <li><a href="#">weaters<span>(9)</span></a></li>
                            <li><a href="#">Bottoms<span>(12)</span></a></li>
                            <li><a href="#">Jeans Pants<span>(6)</span></a></li>
                        </ul>
                    </div>
                    <div class="left-title mb-20">
                        <h4>Manufacturer</h4>
                    </div>
                    <div class="left-menu mb-30">
                        <ul>
                            <li><a href="#">Adidas<span>(4)</span></a></li>
                            <li><a href="#">Chanel<span>(7)</span></a></li>
                            <li><a href="#">DKNY <span>(3)</span></a></li>
                            <li><a href="#">Dolce<span>(3)</span></a></li>
                            <li><a href="#">Gabbana<span>(2)</span></a></li>
                            <li><a href="#">Nike<span>(3)</span></a></li>
                            <li><a href="#">Other <span>(1)</span></a></li>
                        </ul>
                    </div>
                    <div class="left-title mb-20">
                        <h4>Price</h4>
                    </div>
                    <div class="left-menu mb-30">
                        <ul>
                            <li><a href="#">$0.00-$9.99<span>(1)</span></a></li>
                            <li><a href="#">$30.00-$39.99<span>(11)</span></a></li>
                            <li><a href="#">$40.00-$49.99<span>(2)</span></a></li>
                            <li><a href="#">$50.00-$59.99<span>(3)</span></a></li>
                            <li><a href="#">$70.00-and above<span>(1)</span></a></li>
                        </ul>
                    </div>
                    <div class="left-title mb-20">
                        <h4><spring:message code="label.random"/></h4>
                    </div>
                    <div class="random-area mb-30">
                        <div class="product-active-2 owl-carousel owl-loaded owl-drag">
                            <div class="owl-stage-outer">
                                <div class="owl-stage"
                                     style="transform: translate3d(-860px, 0px, 0px); transition: all 0s ease 0s; width: 2580px;">
                                    <div class="owl-item active" style="width: 430px;">
                                        <div class="product-total-2">
                                            <c:forEach items="${randomBooks}" var="rb">
                                                <div class="single-most-product bd mb-18">
                                                    <div class="most-product-img">
                                                        <a href="/info/${rb.id}"><img src="/img-book/${rb.avatar}" alt="book"></a>
                                                    </div>
                                                    <div class="most-product-content">
                                                        <h4><a href="/info/${rb.id}">${rb.title}</a></h4>
                                                        <div class="product-price">
                                                            <ul>
                                                                <li>$${rb.price}</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="banner-area mb-30">
                        <div class="banner-img-2">
                            <a href="#"><img src="/client/assets/img/banner/31.jpg" alt="banner"></a>
                        </div>
                    </div>
                    <div class="left-title-2 mb-30">
                        <h2>Compare Products</h2>
                        <p>You have no items to compare.</p>
                    </div>
                    <div class="left-title-2">
                        <h2>My Wish List</h2>
                        <p>You have no items in your wish list.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
                <div class="category-image mb-30">
                    <a href="#"><img src="/client/assets/img/banner/32.jpg" alt="banner"></a>
                </div>
                <div class="section-title-5 mb-30">
                    <h2>Book</h2>
                </div>
                <div class="toolbar mb-30">
                    <div class="shop-tab">
                        <div class="tab-3">
                            <ul>
                                <li class="active"><a href="#th" data-toggle="tab"><i
                                        class="fa fa-th-large"></i>Grid</a></li>
                                <li><a href="#list" data-toggle="tab"><i class="fa fa-bars"></i>List</a></li>
                            </ul>
                        </div>
                        <div class="list-page">
                            <p>Items 1-9 of 11</p>
                        </div>
                    </div>
                    <div class="ui-widget toolbar-sorter">
                        <label for="tags"><spring:message code="label.search.in.list"/>: </label>
                        <input id="tags"/>
                        <a  id="on-search" href="#"><i class="fa fa-search"></i></a>
                    </div>
                </div>
                <!-- tab-area-start -->
                <div class="tab-content">
                    <div class="tab-pane active" id="th">
                        <div class="row">
                            <c:forEach items="${books}" var="b">
                                <div class="col-lg-3 col-md-4 col-sm-6">
                                    <!-- single-product-start -->
                                    <div class="product-wrapper mb-40">
                                        <div class="product-img">
                                            <a href="#">
                                                <img src="/img-book/${b.avatar}" alt="book" class="primary">
                                            </a>
                                            <div class="quick-view">
                                                <a class="action-view" href="#" data-target="#productModal"
                                                   data-toggle="modal" title="Quick View">
                                                    <i class="fa fa-search-plus"></i>
                                                </a>
                                            </div>
                                            <div class="product-flag">
                                                <ul>
                                                    <li><span class="sale">new</span></li>
                                                    <li><span class="discount-percentage">-5%</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product-details text-center">
                                            <h4><a href="/books/info/${b.id}">${b.title}</a></h4>
                                            <div class="product-price">
                                                <ul>
                                                    <li>$${b.price}</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product-link">
                                            <div class="product-button">
                                                <a class="add-to-cart" bId="${b.id}" ><i
                                                        class="fa fa-shopping-cart"></i><spring:message code="add.to.cart"/></a>
                                            </div>
                                            <div class="add-to-link">
                                                <ul>
                                                    <li><a href="product-details.html" title="Details"><i
                                                            class="fa fa-external-link"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- single-product-end -->
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="list">
                        <!-- single-shop-start -->
                        <c:forEach items="${books}" var="b">
                            <div class="single-shop mb-30">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                        <div class="product-wrapper-2">
                                            <div class="product-img">
                                                <a href="#">
                                                    <img src="/img-book/${b.avatar}" alt="book" class="primary">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                        <div class="product-wrapper-content">
                                            <div class="product-details">
                                                <h4><a href="/books/info/${b.id}">${b.title}</a></h4>
                                                <div class="product-price">
                                                    <ul>
                                                        <li>$${b.price}</li>
                                                    </ul>
                                                </div>
                                                <p>${b.description}</p>
                                            </div>
                                            <div class="product-link">
                                                <div class="product-button">
                                                    <a href="#" class="add-to-cart" bId="${b.id}" ><i
                                                            class="fa fa-shopping-cart"></i><spring:message code="add.to.cart"/></a>
                                                </div>
                                                <div class="add-to-link">
                                                    <ul>
                                                        <li><a href="product-details.html" title="Details"><i
                                                                class="fa fa-external-link"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- single-shop-end -->
                    </div>
                </div>
                <!-- tab-area-end -->
                <!-- pagination-area-start -->
                <div class="pagination-area mt-50">

                    <div class="wrapper">
                        <div class="container">

                            <div class="row">
                                <div class="col-sm-12">
                                    <ul id="pagination-demo" class="pagination-sm"></ul>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
                <!-- pagination-area-end -->
            </div>
        </div>
    </div>
</div>

<input id="pages" hidden value="${pages}"/>

<link href = "/client/assets/css/search.css"
      rel = "stylesheet"/>
<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
      rel = "stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.1/jquery.twbsPagination.min.js"></script>
<script src="/client/assets/js/client-search.js"></script>

