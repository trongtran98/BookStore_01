<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="footer-mid ptb-50">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <div class="single-footer br-2 xs-mb">
                            <div class="footer-title mb-20">
                                <h3><spring:message code="label.product"/></h3>
                            </div>
                            <div class="footer-mid-menu">
                                <ul>
                                    <li><a href="about.html"><spring:message code="label.about.us"/></a></li>
                                    <li><a href="#"><spring:message code="label.price.drop"/></a></li>
                                    <li><a href="#"><spring:message code="label.new.product"/></a></li>
                                    <li><a href="#"><spring:message code="label.best.sales"/></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <div class="single-footer br-2 xs-mb">
                            <div class="footer-title mb-20">
                                <h3><spring:message code="label.our.company"/></h3>
                            </div>
                            <div class="footer-mid-menu">
                                <ul>
                                    <li><a href="contact.html"><spring:message code="label.contact"/></a></li>
                                    <li><a href="#">Sitemap</a></li>
                                    <li><a href="#"><spring:message code="label.stores"/></a></li>
                                    <li><a href="register.html"><spring:message code="label.my.account"/></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <div class="single-footer br-2 xs-mb">
                            <div class="footer-title mb-20">
                                <h3><spring:message code="label.your.account"/></h3>
                            </div>
                            <div class="footer-mid-menu">
                                <ul>
                                    <li><a href="contact.html"><spring:message code="label.address"/></a></li>
                                    <li><a href="#"><spring:message code="label.credit"/></a></li>
                                    <li><a href="#"><spring:message code="label.order"/></a></li>
                                    <li><a href="#"><spring:message code="label.personal.info"/></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="single-footer mrg-sm">
                    <div class="footer-title mb-20">
                        <h3><spring:message code="label.store.info"/></h3>
                    </div>
                    <div class="footer-contact">
                        <p class="adress">
                            <span><spring:message code="label.my.company"/></span>
                            42 avenue des Champs Elysées 75000 Paris France
                        </p>
                        <p><span>Call us now:</span> (+1)866-540-3229</p>
                        <p><span>Email:</span> support@hastech.com</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- footer-mid-end -->
<!-- footer-bottom-start -->
<div class="footer-bottom">
    <div class="container">
        <div class="row bt-2">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="copy-right-area">
                    <p>Copyright ©<a href="#">Koparion</a>. All Right Reserved.</p>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="payment-img text-right">
                    <a href="#"><img src="/client/assets/img/1.png" alt="payment"/></a>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- box chat -->
<form id="messageForm" name="messageForm">

    <div class="popup-box chat-popup" id="qnimate">
        <div class="popup-head">
            <div class="popup-head-left pull-left">Support</div>
            <div class="popup-head-right pull-right">
                <a data-widget="remove" id="removeClass" class="pull-right" type="button"><i
                        class="fas fa-angle-down"></i></a>
            </div>
        </div>
        <div class="popup-messages">
            <div class="direct-chat-messages">
                <!-- Message. Default to the left -->

                <!-- /.direct-chat-msg -->

            </div>

        </div>
        <div class="popup-messages-footer">
            <textarea id="status_message" placeholder="Type a message..." rows="10" cols="40" name="message"></textarea>
            <button type="submit">chat</button>
        </div>
    </div>
</form>

<a id="addClass" class="button-message"><i class="fas fa-comments"></i></a>
<head>
    <link rel="stylesheet" href="/client/assets/css/box.chat.css">
    <!-- https://cdnjs.com/libraries/sockjs-client -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <!-- https://cdnjs.com/libraries/stomp.js/ -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="/client/assets/js/socket-client.js"></script>

</head>