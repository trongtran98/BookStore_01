<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: TrongTran
  Date: 11/19/2018
  Time: 8:25 PM
  To change this template use File | Settings | File Templates.
--%>


<!-- breadcrumbs-area-start -->
<div class="breadcrumbs-area mb-70">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumbs-menu">
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#" class="active">product-details</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- breadcrumbs-area-end -->
<!-- product-main-area-start -->
<div class="product-main-area mb-70">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
                <!-- product-main-area-start -->
                <div class="product-main-area">
                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-sm-6 col-xs-12">
                            <div class="flexslider">
                                <ul class="slides">
                                    <li data-thumb="/img-book/${book.avatar}">
                                        <img src="/img-book/${book.avatar}" alt="woman"/>
                                    </li>
                                    <li data-thumb="/client/assets/img/thum-2/4.jpg">
                                        <img src="/client/assets/img/flex/5.jpg" alt="woman"/>
                                    </li>
                                    <li data-thumb="/client/assets/img/thum-2/2.jpg">
                                        <img src="/client/assets/img/flex/2.jpg" alt="woman"/>
                                    </li>
                                    <li data-thumb="/client/assets/img/thum-2/5.jpg">
                                        <img src="/client/assets/img/flex/5.jpg" alt="woman"/>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-7 col-sm-6 col-xs-12">
                            <div class="product-info-main">
                                <div class="page-title">
                                    <h1>${book.title}</h1>
                                </div>
                                <div class="product-info-stock-sku">
                                    <span>In stock</span>
                                    <div class="product-attribute">
                                        <span>SKU</span>
                                        <span class="value">${book.categoryDetail.categoryDetailName}</span>
                                    </div>
                                </div>
                                <div class="product-reviews-summary">
                                    <div class="rating-summary">
                                        <a href="#"><i class="fa fa-star"></i></a>
                                        <a href="#"><i class="fa fa-star"></i></a>
                                        <a href="#"><i class="fa fa-star"></i></a>
                                        <a href="#"><i class="fa fa-star"></i></a>
                                        <a href="#"><i class="fa fa-star"></i></a>
                                    </div>
                                    <div class="reviews-actions">
                                        <a href="#">3 Reviews</a>
                                        <a href="#" class="view">Add Your Review</a>
                                    </div>
                                </div>
                                <div class="product-info-price">
                                    <div class="price-final">
                                        <span>$${book.price}</span>
                                        <span class="old-price">$40.00</span>
                                    </div>
                                </div>
                                <div class="product-add-form">
                                    <form action="#">
                                        <div class="quality-button">
                                            <input class="qty" type="number" value="1">
                                        </div>
                                        <a href="#">Add to cart</a>
                                    </form>
                                </div>
                                <div class="product-social-links">
                                    <div class="product-addto-links">
                                        <a href="#"><i class="fa fa-heart"></i></a>
                                        <a href="#"><i class="fa fa-pie-chart"></i></a>
                                        <a href="#"><i class="fa fa-envelope-o"></i></a>
                                    </div>
                                    <div class="product-addto-links-text">
                                        <p>${book.description}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- product-main-area-end -->
                <!-- product-info-area-start -->
                <div class="product-info-area mt-80">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="active"><a href="#Details" data-toggle="tab">Details</a></li>
                        <li><a href="#Reviews" data-toggle="tab">Reviews ${reviews.size()}</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="Details">
                            <div class="valu">
                                <p>The sporty Joust Duffle Bag can't be beat - not in the gym, not on the luggage
                                    carousel, not anywhere. Big enough to haul a basketball or soccer ball and some
                                    sneakers with plenty of room to spare, it's ideal for athletes with places to
                                    go.</p>
                                <ul>
                                    <li><i class="fa fa-circle"></i>Dual top handles.</li>
                                    <li><i class="fa fa-circle"></i>Adjustable shoulder strap.</li>
                                    <li><i class="fa fa-circle"></i>Full-length zipper.</li>
                                    <li><i class="fa fa-circle"></i>L 29" x W 13" x H 11".</li>
                                </ul>
                            </div>
                        </div>
                        <div class="tab-pane" id="Reviews">
                            <div class="valu valu-2">
                                <div class="section-title mb-60 mt-60">
                                    <h2>Customer Reviews</h2>
                                </div>
                                <ul>
                                    <li class="list-review">
                                        <c:forEach items="${reviews}" var="rv">
                                            <div class="review-title">
                                                <p><b>${rv.user.fullName}: </b>${rv.content}<span
                                                        style="float:right; padding-right: 50px;"><fmt:formatDate
                                                        pattern="dd/MM/yyyy" value="${rv.time}"/></span></p>
                                            </div>
                                        </c:forEach>
                                    </li>
                                </ul>
                                <security:authorize access="isAuthenticated()">

                                    <div class="review-add">
                                        <h3>You're reviewing:</h3>
                                        <h4>Joust Duffle Bag</h4>
                                    </div>
                                    <form id="review-form" method="post">
                                        <div class="review-form">
                                            <div class="single-form">
                                                <label>Review <sup>*</sup></label>
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                       value="${_csrf.token}"/>
                                                <input type="hidden" name="bookId" value="${book.id}"/>
                                                <input id="email" type="hidden" name="email"
                                                       value="<security:authentication property="principal.username"/>"/>
                                                <textarea id="content" name="content" cols="20" rows="4"></textarea>
                                            </div>
                                        </div>
                                        <div class="review-form-button">
                                            <a id="review-submit" href="#">
                                                Submit Review
                                            </a>
                                        </div>
                                    </form>

                                </security:authorize>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- product-info-area-end -->
                <!-- new-book-area-start -->
                <div class="new-book-area mt-60">
                    <div class="section-title text-center mb-30">
                        <h3>upsell products</h3>
                    </div>
                    <div class="tab-active-2 owl-carousel">
                        <!-- single-product-start -->
                        <div class="product-wrapper">
                            <div class="product-img">
                                <a href="#">
                                    <img src="/client/assets/img/product/1.jpg" alt="book" class="primary"/>
                                </a>
                                <div class="quick-view">
                                    <a class="action-view" href="#" data-target="#productModal" data-toggle="modal"
                                       title="Quick View">
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
                                <div class="product-rating">
                                    <ul>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                    </ul>
                                </div>
                                <h4><a href="#">Joust Duffle Bag</a></h4>
                                <div class="product-price">
                                    <ul>
                                        <li>$60.00</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="product-link">
                                <div class="product-button">
                                    <a href="#" title="Add to cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
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
                        <!-- single-product-start -->
                        <div class="product-wrapper">
                            <div class="product-img">
                                <a href="#">
                                    <img src="/client/assets/img/product/3.jpg" alt="book" class="primary"/>
                                </a>
                                <div class="quick-view">
                                    <a class="action-view" href="#" data-target="#productModal" data-toggle="modal"
                                       title="Quick View">
                                        <i class="fa fa-search-plus"></i>
                                    </a>
                                </div>
                                <div class="product-flag">
                                    <ul>
                                        <li><span class="sale">new</span></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="product-details text-center">
                                <div class="product-rating">
                                    <ul>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                    </ul>
                                </div>
                                <h4><a href="#">Chaz Kangeroo Hoodie</a></h4>
                                <div class="product-price">
                                    <ul>
                                        <li>$52.00</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="product-link">
                                <div class="product-button">
                                    <a href="#" title="Add to cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
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
                        <!-- single-product-start -->
                        <div class="product-wrapper">
                            <div class="product-img">
                                <a href="#">
                                    <img src="/client/assets/img/product/5.jpg" alt="book" class="primary"/>
                                </a>
                                <div class="quick-view">
                                    <a class="action-view" href="#" data-target="#productModal" data-toggle="modal"
                                       title="Quick View">
                                        <i class="fa fa-search-plus"></i>
                                    </a>
                                </div>
                                <div class="product-flag">
                                    <ul>
                                        <li><span class="discount-percentage">-5%</span></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="product-details text-center">
                                <div class="product-rating">
                                    <ul>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                    </ul>
                                </div>
                                <h4><a href="#">Set of Sprite Yoga Straps</a></h4>
                                <div class="product-price">
                                    <ul>
                                        <li><span>Starting at</span>$34.00</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="product-link">
                                <div class="product-button">
                                    <a href="#" title="Add to cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
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
                        <!-- single-product-start -->
                        <div class="product-wrapper">
                            <div class="product-img">
                                <a href="#">
                                    <img src="/client/assets/img/product/7.jpg" alt="book" class="primary"/>
                                </a>
                                <div class="quick-view">
                                    <a class="action-view" href="#" data-target="#productModal" data-toggle="modal"
                                       title="Quick View">
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
                                <div class="product-rating">
                                    <ul>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                    </ul>
                                </div>
                                <h4><a href="#">Strive Shoulder Pack</a></h4>
                                <div class="product-price">
                                    <ul>
                                        <li>$30.00</li>
                                        <li class="old-price">$32.00</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="product-link">
                                <div class="product-button">
                                    <a href="#" title="Add to cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
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
                </div>
                <!-- new-book-area-start -->
            </div>
            <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                <div class="shop-left">
                    <div class="left-title mb-20">
                        <h4>Related Products</h4>
                    </div>
                    <div class="random-area mb-30">
                        <div class="product-active-2 owl-carousel">
                            <div class="product-total-2">
                                <div class="single-most-product bd mb-18">
                                    <div class="most-product-img">
                                        <a href="#"><img src="/client/assets/img/product/20.jpg" alt="book"/></a>
                                    </div>
                                    <div class="most-product-content">
                                        <div class="product-rating">
                                            <ul>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4><a href="#">Endeavor Daytrip</a></h4>
                                        <div class="product-price">
                                            <ul>
                                                <li>$30.00</li>
                                                <li class="old-price">$33.00</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="single-most-product bd mb-18">
                                    <div class="most-product-img">
                                        <a href="#"><img src="/client/assets/img/product/21.jpg" alt="book"/></a>
                                    </div>
                                    <div class="most-product-content">
                                        <div class="product-rating">
                                            <ul>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4><a href="#">Savvy Shoulder Tote</a></h4>
                                        <div class="product-price">
                                            <ul>
                                                <li>$30.00</li>
                                                <li class="old-price">$35.00</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="single-most-product">
                                    <div class="most-product-img">
                                        <a href="#"><img src="/client/assets/img/product/22.jpg" alt="book"/></a>
                                    </div>
                                    <div class="most-product-content">
                                        <div class="product-rating">
                                            <ul>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4><a href="#">Compete Track Tote</a></h4>
                                        <div class="product-price">
                                            <ul>
                                                <li>$35.00</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="product-total-2">
                                <div class="single-most-product bd mb-18">
                                    <div class="most-product-img">
                                        <a href="#"><img src="/client/assets/img/product/23.jpg" alt="book"/></a>
                                    </div>
                                    <div class="most-product-content">
                                        <div class="product-rating">
                                            <ul>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4><a href="#">Voyage Yoga Bag</a></h4>
                                        <div class="product-price">
                                            <ul>
                                                <li>$30.00</li>
                                                <li class="old-price">$33.00</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="single-most-product bd mb-18">
                                    <div class="most-product-img">
                                        <a href="#"><img src="/client/assets/img/product/24.jpg" alt="book"/></a>
                                    </div>
                                    <div class="most-product-content">
                                        <div class="product-rating">
                                            <ul>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4><a href="#">Impulse Duffle</a></h4>
                                        <div class="product-price">
                                            <ul>
                                                <li>$70.00</li>
                                                <li class="old-price">$74.00</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="single-most-product">
                                    <div class="most-product-img">
                                        <a href="#"><img src="/client/assets/img/product/22.jpg" alt="book"/></a>
                                    </div>
                                    <div class="most-product-content">
                                        <div class="product-rating">
                                            <ul>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4><a href="#">Fusion Backpack</a></h4>
                                        <div class="product-price">
                                            <ul>
                                                <li>$59.00</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="banner-area mb-30">
                        <div class="banner-img-2">
                            <a href="#"><img src="/client/assets/img/banner/33.jpg" alt="banner"/></a>
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
        </div>
    </div>
</div>
<!-- product-main-area-end -->
