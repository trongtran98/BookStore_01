<%--
  Created by IntelliJ IDEA.
  User: jocker
  Date: 07/12/2018
  Time: 09:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="inner-wrapper">
    <!-- start: sidebar -->
    <aside id="sidebar-left" class="sidebar-left">

        <div class="sidebar-header">
            <div class="sidebar-title">
                Navigation
            </div>
            <div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed" data-target="html"
                 data-fire-event="sidebar-left-toggle">
                <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
            </div>
        </div>

        <div class="nano has-scrollbar">
            <div class="nano-content" tabindex="0" style="right: -17px;">
                <nav id="menu" class="nav-main" role="navigation">
                    <ul class="nav nav-main">
                        <li class="nav-active">
                            <a href="index.html">
                                <i class="fa fa-home" aria-hidden="true"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>
                        <li class="nav-active">
                            <a href="mailbox-folder.html">
                                <span class="pull-right label label-primary">182</span>
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                                <span>Chat box</span>
                            </a>
                        </li>
                        <li class="nav-parent">
                            <a>
                                <i class="fa fa-copy" aria-hidden="true"></i>
                                <span>Tài khoản</span>
                            </a>
                            <ul class="nav nav-children">
                                <li>
                                    <spring:url value="/admin/add-manager?${_csrf.parameterName}=${_csrf.token}"
                                                var="addManager"/>
                                    <form action="${addManager}" method="post" enctype="multipart/form-data"
                                          accept=".xls, .xlsx">
                                        <div class="box">
                                            <input type="file" name="fileExcel" id="file-1"
                                                   class="inputfile inputfile-1"/>
                                            <label for="file-1">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="17"
                                                     viewBox="0 0 20 17">
                                                    <path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/>
                                                </svg>
                                                <span>Choose a file&hellip;</span></label>
                                        </div>
                                        <button type="submit">ok</button>
                                    </form>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-parent nav-expanded">
                            <a>
                                <i class="fa fa-list-alt" aria-hidden="true"></i>
                                <span>Books</span>
                            </a>
                            <ul class="nav nav-children">
                                <li>
                                    <a href="/admin/books">
                                        Books
                                    </a>
                                </li>
                                <li>
                                    <a href="/admin/authors">
                                        Authors
                                    </a>
                                </li>
                                <li>
                                    <a href="/admin/producers">
                                        Producers
                                    </a>
                                </li>
                                <li>
                                    <a href="/admin/categories">
                                        Categories
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <hr class="separator">
                <div class="sidebar-widget widget-stats">
                    <div class="widget-header">
                        <h6>Company Stats</h6>
                        <div class="widget-toggle">+</div>
                    </div>
                    <div class="widget-content">
                        <ul>
                            <li>
                                <span class="stats-title">Stat 1</span>
                                <span class="stats-complete">85%</span>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-primary progress-without-number"
                                         role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"
                                         style="width: 85%;">
                                        <span class="sr-only">85% Complete</span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <span class="stats-title">Stat 2</span>
                                <span class="stats-complete">70%</span>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-primary progress-without-number"
                                         role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
                                         style="width: 70%;">
                                        <span class="sr-only">70% Complete</span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <span class="stats-title">Stat 3</span>
                                <span class="stats-complete">2%</span>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-primary progress-without-number"
                                         role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="100"
                                         style="width: 2%;">
                                        <span class="sr-only">2% Complete</span>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="nano-pane" style="opacity: 1; visibility: visible;">
                <div class="nano-slider" style="height: 433px; transform: translate(0px, 0px);"></div>
            </div>
        </div>

    </aside>
    <!-- end: sidebar -->
    <section id="section1" role="main" class="content-body">
        <header class="page-header">
            <h2>Editable Tables</h2>

            <div class="right-wrapper pull-right">
                <ol class="breadcrumbs">
                    <li>
                        <a href="index.html">
                            <i class="fa fa-home"></i>
                        </a>
                    </li>
                    <li><span>Tables</span></li>
                    <li><span>Editable</span></li>
                </ol>

                <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
            </div>
        </header>

        <!-- start: page -->
        <section class="panel">
            <header class="panel-heading">
                <h2 class="panel-title">Chat box</h2>
            </header>
            <div class="panel-body">
                <div class="messaging">
                    <div class="inbox_msg">
                        <form id="messageForm" name="messageForm">
                            <div class="mesgs">
                                <div class="msg_history">

                                    <%--CHAT CONTENT HERE--%>

                                </div>
                                <div class="type_msg">
                                    <div class="input_msg_write">
                                        <input type="text" id="status_message" class="write_msg" placeholder="Type a message">
                                        <button class="msg_send_btn" type="submit"><i class="fa fa-paper-plane-o"
                                                                                      aria-hidden="true"></i></button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>


            </div>
        </section>
        <!-- end: page -->
        <aside id="sidebar-right" class="sidebar-right">
            <div class="nano has-scrollbar">
                <div class="nano-content" tabindex="0" style="right: -15px;">
                    <a href="#" class="mobile-close visible-xs">
                        Collapse <i class="fa fa-chevron-right"></i>
                    </a>
                    <div class="sidebar-right-wrapper">
                        <div class="sidebar-widget widget-calendar">
                            <h6>Upcoming Tasks</h6>
                            <div data-plugin-datepicker="" data-plugin-skin="dark">
                                <div class="datepicker datepicker-inline datepicker-dark">
                                    <div class="datepicker-days" style="display: block;">
                                        <table class=" table-condensed">
                                            <thead>
                                            <tr>
                                                <th class="prev" style="visibility: visible;">«</th>
                                                <th colspan="5" class="datepicker-switch">November 2018</th>
                                                <th class="next" style="visibility: visible;">»</th>
                                            </tr>
                                            <tr>
                                                <th class="dow">Su</th>
                                                <th class="dow">Mo</th>
                                                <th class="dow">Tu</th>
                                                <th class="dow">We</th>
                                                <th class="dow">Th</th>
                                                <th class="dow">Fr</th>
                                                <th class="dow">Sa</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td class="old day">28</td>
                                                <td class="old day">29</td>
                                                <td class="old day">30</td>
                                                <td class="old day">31</td>
                                                <td class="day">1</td>
                                                <td class="day">2</td>
                                                <td class="day">3</td>
                                            </tr>
                                            <tr>
                                                <td class="day">4</td>
                                                <td class="day">5</td>
                                                <td class="day">6</td>
                                                <td class="day">7</td>
                                                <td class="day">8</td>
                                                <td class="day">9</td>
                                                <td class="day">10</td>
                                            </tr>
                                            <tr>
                                                <td class="day">11</td>
                                                <td class="day">12</td>
                                                <td class="day">13</td>
                                                <td class="day">14</td>
                                                <td class="day">15</td>
                                                <td class="day">16</td>
                                                <td class="day">17</td>
                                            </tr>
                                            <tr>
                                                <td class="day">18</td>
                                                <td class="day">19</td>
                                                <td class="day">20</td>
                                                <td class="day">21</td>
                                                <td class="day">22</td>
                                                <td class="day">23</td>
                                                <td class="day">24</td>
                                            </tr>
                                            <tr>
                                                <td class="day">25</td>
                                                <td class="day">26</td>
                                                <td class="day">27</td>
                                                <td class="day">28</td>
                                                <td class="day">29</td>
                                                <td class="day">30</td>
                                                <td class="new day">1</td>
                                            </tr>
                                            <tr>
                                                <td class="new day">2</td>
                                                <td class="new day">3</td>
                                                <td class="new day">4</td>
                                                <td class="new day">5</td>
                                                <td class="new day">6</td>
                                                <td class="new day">7</td>
                                                <td class="new day">8</td>
                                            </tr>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <th colspan="7" class="today" style="display: none;">Today</th>
                                            </tr>
                                            <tr>
                                                <th colspan="7" class="clear" style="display: none;">Clear</th>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="datepicker-months" style="display: none;">
                                        <table class="table-condensed">
                                            <thead>
                                            <tr>
                                                <th class="prev" style="visibility: visible;">«</th>
                                                <th colspan="5" class="datepicker-switch">2018</th>
                                                <th class="next" style="visibility: visible;">»</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td colspan="7"><span class="month">Jan</span><span
                                                        class="month">Feb</span><span class="month">Mar</span><span
                                                        class="month">Apr</span><span class="month">May</span><span
                                                        class="month">Jun</span><span class="month">Jul</span><span
                                                        class="month">Aug</span><span class="month">Sep</span><span
                                                        class="month">Oct</span><span class="month">Nov</span><span
                                                        class="month">Dec</span></td>
                                            </tr>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <th colspan="7" class="today" style="display: none;">Today</th>
                                            </tr>
                                            <tr>
                                                <th colspan="7" class="clear" style="display: none;">Clear</th>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="datepicker-years" style="display: none;">
                                        <table class="table-condensed">
                                            <thead>
                                            <tr>
                                                <th class="prev" style="visibility: visible;">«</th>
                                                <th colspan="5" class="datepicker-switch">2010-2019</th>
                                                <th class="next" style="visibility: visible;">»</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td colspan="7"><span class="year old">2009</span><span class="year">2010</span><span
                                                        class="year">2011</span><span class="year">2012</span><span
                                                        class="year">2013</span><span class="year">2014</span><span
                                                        class="year">2015</span><span class="year">2016</span><span
                                                        class="year">2017</span><span class="year">2018</span><span
                                                        class="year">2019</span><span class="year new">2020</span></td>
                                            </tr>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <th colspan="7" class="today" style="display: none;">Today</th>
                                            </tr>
                                            <tr>
                                                <th colspan="7" class="clear" style="display: none;">Clear</th>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <ul>
                                <li>
                                    <time datetime="2014-04-19T00:00+00:00">04/19/2014</time>
                                    <span>Company Meeting</span>
                                </li>
                            </ul>
                        </div>
                        <div class="sidebar-widget widget-friends">
                            <h6>Friends</h6>
                            <ul>
                                <li class="status-online">
                                    <figure class="profile-picture">
                                        <img src="/admin/assets/images/!sample-user.jpg" alt="Joseph Doe"
                                             class="img-circle">
                                    </figure>
                                    <div class="profile-info">
                                        <span class="name">Joseph Doe Junior</span>
                                        <span class="title">Hey, how are you?</span>
                                    </div>
                                </li>
                                <li class="status-online">
                                    <figure class="profile-picture">
                                        <img src="/admin/assets/images/!sample-user.jpg" alt="Joseph Doe"
                                             class="img-circle">
                                    </figure>
                                    <div class="profile-info">
                                        <span class="name">Joseph Doe Junior</span>
                                        <span class="title">Hey, how are you?</span>
                                    </div>
                                </li>
                                <li class="status-offline">
                                    <figure class="profile-picture">
                                        <img src="/admin/assets/images/!sample-user.jpg" alt="Joseph Doe"
                                             class="img-circle">
                                    </figure>
                                    <div class="profile-info">
                                        <span class="name">Joseph Doe Junior</span>
                                        <span class="title">Hey, how are you?</span>
                                    </div>
                                </li>
                                <li class="status-offline">
                                    <figure class="profile-picture">
                                        <img src="/admin/assets/images/!sample-user.jpg" alt="Joseph Doe"
                                             class="img-circle">
                                    </figure>
                                    <div class="profile-info">
                                        <span class="name">Joseph Doe Junior</span>
                                        <span class="title">Hey, how are you?</span>
                                    </div>
                                </li>
                            </ul>
                        </div>

                    </div>
                </div>
                <div class="nano-pane" style="display: none; opacity: 1; visibility: visible;">
                    <div class="nano-slider" style="height: 858px; transform: translate(0px, 0px);"></div>
                </div>
            </div>
        </aside>
    </section>
    <section id="section2" role="main" class="content-body">
        <header class="page-header">
            <h2>Basic Forms</h2>

            <div class="right-wrapper pull-right">
                <ol class="breadcrumbs">
                    <li>
                        <a href="index.html">
                            <i class="fa fa-home"></i>
                        </a>
                    </li>
                    <li><span>Forms</span></li>
                    <li><span>Basic</span></li>
                </ol>

                <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
            </div>
        </header>
        <!-- start: page -->
        <div class="row">
            <div class="col-lg-12">
                <section class="panel">
                    <header class="panel-heading">
                        <h2 class="panel-title">Form Elements</h2>
                    </header>
                    <div class="panel-body">
                        <form id="idForm" class="form-horizontal form-bordered">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input id="id" type="hidden" class="form-control input-rounded" name="id">
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="producerName">Producer name</label>
                                <div class="col-md-6">
                                    <input id="producerName" type="text" class="form-control input-rounded"
                                           name="producerName">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="address">Address</label>
                                <div class="col-md-6">
                                    <textarea id="address" placeholder="Description" name="address"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="description">Description</label>
                                <div class="col-md-6">
                                    <textarea id="description" placeholder="Description" name="description"></textarea>
                                </div>
                            </div>
                            <button id="button-add" type="button">Add</button>
                            <button id="button-edit" type="button">edit</button>
                            <button id="button-close" onclick="cancel()" type="button">cancel</button>
                        </form>
                    </div>
                </section>
            </div>
        </div>
        <!-- end: page -->
    </section>
</div>
<input type="hidden" id="sId" value="${pageContext.session.id}"/>
<head>
    <!-- Specific Page Vendor CSS -->
    <link rel="stylesheet" href="/admin/assets/vendor/select2/select2.css"/>
    <link rel="stylesheet" href="/admin/assets/vendor/jquery-datatables-bs3/assets/css/datatables.css"/>

    <!-- Theme CSS -->
    <link rel="stylesheet" href="/admin/assets/stylesheets/theme.css">

    <!-- Skin CSS -->
    <link rel="stylesheet" href="/admin/assets/stylesheets/skins/default.css">

    <!-- Theme Custom CSS -->
    <link rel="stylesheet" href="/admin/assets/stylesheets/theme-custom.css">

    <!-- Vendor -->
    <script src="/admin/assets/vendor/jquery/jquery.js"></script>
    <script src="/admin/assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
    <script src="/admin/assets/vendor/bootstrap/js/bootstrap.js"></script>
    <script src="/admin/assets/vendor/nanoscroller/nanoscroller.js"></script>
    <script src="/admin/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="/admin/assets/vendor/magnific-popup/magnific-popup.js"></script>
    <script src="/admin/assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>

    <!-- Specific Page Vendor -->
    <script src="/admin/assets/vendor/select2/select2.js"></script>
    <script src="/admin/assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
    <script src="/admin/assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script>
    <%--<script src="/admin/assets/events/button-events.js"/>--%>

    <!-- Theme Base, Components and Settings -->
    <script src="/admin/assets/javascripts/theme.js"></script>

    <!-- Theme Custom -->
    <script src="/admin/assets/javascripts/theme.custom.js"></script>

    <!-- Theme Initialization Files -->
    <script src="/admin/assets/javascripts/theme.init.js"></script>


    <!-- Examples -->
    <script src="/admin/assets/javascripts/tables/examples.datatables.editable.js"></script>

    <link rel="stylesheet" type="text/css" href="/admin/assets/notify/notify.css">
    <link rel="stylesheet" type="text/css" href="/admin/assets/notify/prettify.css">
    <link rel="stylesheet" type="text/css" href="/admin/assets/custom/popup.css">
    <link rel="stylesheet" type="text/css" href="/admin/assets/custom/input-file-excel.css">
    <link rel="stylesheet" type="text/css" href="/admin/assets/custom/chatbox.css">
    <script src="/admin/assets/notify/notify.js"></script>
    <script src="/admin/assets/notify/prettify.js"></script>
    <script src="/admin/assets/custom/popup.js"></script>
    <script src="/admin/assets/custom/input-file-excel.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <!-- https://cdnjs.com/libraries/stomp.js/ -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="/admin/assets/js/socket-admin.js"></script>

</head>
