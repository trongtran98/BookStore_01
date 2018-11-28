<%--
  Created by IntelliJ IDEA.
  User: jocker
  Date: 19/11/2018
  Time: 08:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
                        <li>
                            <a href="mailbox-folder.html">
                                <span class="pull-right label label-primary">182</span>
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                                <span>Mailbox</span>
                            </a>
                        </li>
                        <li class="nav-parent">
                            <a>
                                <i class="fa fa-copy" aria-hidden="true"></i>
                                <span>Tài khoản</span>
                            </a>
                            <ul class="nav nav-children">
                                <li>
                                    <c:url value="/admin/add-manager?${_csrf.parameterName}=${_csrf.token}"
                                           var="addManager"/>
                                    <form action="${addManager}" method="post" enctype="multipart/form-data">
                                        <input type="file" name="fileExcel"/>
                                        <button type="submit">ok</button>
                                    </form>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-parent nav-expanded nav-active">
                            <a>
                                <i class="fa fa-list-alt" aria-hidden="true"></i>
                                <span>Books</span>
                            </a>
                            <ul class="nav nav-children">
                                <li class="nav-active">
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
                <%--<div class="panel-actions">--%>
                    <%--<a href="#" class="fa fa-caret-down"></a>--%>
                    <%--<a href="#" class="fa fa-times"></a>--%>
                <%--</div>--%>
                <h2 class="panel-title">Books</h2>
            </header>
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="mb-md">
                            <button onclick="displayBook(true)" style="width:auto;"
                                    class="btn btn-primary">Add <i class="fa fa-plus"></i></button>
                        </div>
                    </div>
                </div>
                <div id="datatable-editable_wrapper" class="dataTables_wrapper no-footer">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped mb-none dataTable no-footer"
                               id="datatable-editable" role="grid" aria-describedby="datatable-editable_info">
                            <thead>
                            <tr role="row">
                                <th class="sorting_asc" tabindex="0" aria-controls="datatable-editable" rowspan="1"
                                    colspan="1" aria-label="Rendering engine: activate to sort column ascending"
                                    aria-sort="ascending" style="width: 128px;">ID
                                </th>
                                <th class="sorting" tabindex="0" aria-controls="datatable-editable" rowspan="1"
                                    colspan="1" aria-label="Browser: activate to sort column ascending"
                                    style="width: 178px;">Full name
                                </th>
                                <th class="sorting" tabindex="0" aria-controls="datatable-editable" rowspan="1"
                                    colspan="1" aria-label="Platform(s): activate to sort column ascending"
                                    style="width: 160px;">Description
                                </th>
                                <th class="sorting_disabled" rowspan="1" colspan="1" aria-label="Actions"
                                    style="width: 60px;">Actions
                                </th>
                            </tr>
                            </thead>
                            <tbody id="reload">
                            <c:forEach items="${books}" var="item">
                                <tr class="gradeA odd" role="row">
                                    <td class="sorting_1">${item.id}</td>
                                    <td>${item.title}</td>
                                    <td>${item.description}</td>
                                    <td class="actions">
                                        <a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
                                        <a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
                                        <a href="#"
                                            <%--onclick="editbook('${item.id}')"--%>
                                           style="width:auto;" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
                                        <a href="#" bId="${item.id}" class="on-default remove-row"><i
                                                class="fa fa-trash-o"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
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
                        <form id="idForm" class="form-horizontal form-bordered"
                              action="/admin/books/create?${_csrf.parameterName}=${_csrf.token}" method="post"
                              enctype="multipart/form-data">
                            <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
                            <%--<div class="form-group">--%>
                            <%--<label class="col-md-3 control-label" for="id">ID</label>--%>
                            <%--<div class="col-md-6">--%>
                            <%--<input id="id" type="text" class="form-control input-rounded" name="id" >--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Title</label>
                                <div class="col-md-6">
                                    <input id="title" type="text" class="form-control input-rounded" name="title">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="description">Description</label>
                                <div class="col-md-6">
                                    <textarea id="description" placeholder="Description" name="description"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label">File Upload</label>
                                <div class="col-md-6">
                                    <div class="file-upload">
                                        <div class="image-upload-wrap">
                                            <input class="file-upload-input" type='file' onchange="readURL(this);"
                                                   accept="image/*"/>
                                            <div class="drag-text">
                                                <h3>Drag and drop a file or select add Image</h3>
                                            </div>
                                        </div>
                                        <div class="file-upload-content">
                                            <img class="file-upload-image" accept="image/*" src="#" alt="your image" name="image"/>
                                            <div class="image-title-wrap">
                                                <button type="button" onclick="removeUpload()" class="remove-image">
                                                    Remove
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="pages">Pages</label>
                                <div class="col-md-6">
                                    <input id="pages" type="number" class="form-control input-rounded" name="pages"
                                           min="0">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="price">Price</label>
                                <div class="col-md-6">
                                    <input id="price" type="number" class="form-control input-rounded" name="price"
                                           min="0">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="available">Available</label>
                                <div class="col-md-6">
                                    <input id="available" type="number" class="form-control input-rounded"
                                           name="available" min="0">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="status">Status</label>
                                <div class="col-md-6">
                                    <select id="status" name="status">
                                        <option value="true">Yes</option>
                                        <option value="false">No</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="author">Author</label>
                                <div class="col-md-6">
                                    <select id="author" name="author">
                                        <c:forEach items="${authors}" var="item">
                                            <option value="${item.id}">${item.fullName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="categoryDetail">Category detail</label>
                                <div class="col-md-6">
                                    <select id="categoryDetail" name="categoryDetail">
                                        <c:forEach items="${categoryDetails}" var="item">
                                            <option value="${item.id}">${item.categoryDetailName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="producer">Producer</label>
                                <div class="col-md-6">
                                    <select id="producer" name="producer">
                                        <c:forEach items="${producers}" var="item">
                                            <option value="${item.id}">${item.producerName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <button type="submit">Add</button>
                            <button onclick="displayBook(false)" type="button">cancel</button>
                        </form>
                    </div>
                </section>
            </div>
        </div>
        <!-- end: page -->
    </section>
</div>

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
    <script src="/admin/assets/notify/notify.js"></script>
    <script src="/admin/assets/notify/prettify.js"></script>
    <script src="/admin/assets/custom/popup.js"></script>

    <%--<style>--%>


        <%--input[type=text], input[type=password], textarea, input[type=number], select {--%>
            <%--width: 100%;--%>
            <%--padding: 15px;--%>
            <%--margin: 5px 0 22px 0;--%>
            <%--display: inline-block;--%>
            <%--border: none;--%>
            <%--background: #f1f1f1;--%>
        <%--}--%>

        <%--/* Add a background color when the inputs get focus */--%>
        <%--input[type=text]:focus, input[type=password]:focus, textarea:focus, input[type=number]:focus, select:focus {--%>
            <%--background-color: #ddd;--%>
            <%--outline: none;--%>
        <%--}--%>

        <%--/* Set a style for all buttons */--%>
        <%--button {--%>
            <%--background-color: #0090E3;--%>
            <%--color: white;--%>
            <%--padding: 14px 20px;--%>
            <%--margin: 8px 0;--%>
            <%--border: none;--%>
            <%--cursor: pointer;--%>
            <%--width: 100%;--%>
            <%--opacity: 0.9;--%>
        <%--}--%>

        <%--button:hover {--%>
            <%--opacity: 1;--%>
        <%--}--%>


        <%--.file-upload {--%>
            <%--background-color: #ffffff;--%>
            <%--width: 100%;--%>
            <%--padding: 15px;--%>
            <%--margin: 5px 0 22px 0;--%>
        <%--}--%>

        <%--.file-upload-content {--%>
            <%--display: none;--%>
            <%--text-align: center;--%>
        <%--}--%>

        <%--.file-upload-input {--%>
            <%--position: absolute;--%>
            <%--margin: 0;--%>
            <%--padding: 0;--%>
            <%--width: 100%;--%>
            <%--height: 100%;--%>
            <%--outline: none;--%>
            <%--opacity: 0;--%>
            <%--cursor: pointer;--%>
        <%--}--%>

        <%--.image-upload-wrap {--%>
            <%--margin-top: 20px;--%>
            <%--border: 4px dashed #1FB264;--%>
            <%--position: relative;--%>
        <%--}--%>

        <%--.image-dropping,--%>
        <%--.image-upload-wrap:hover {--%>
            <%--background-color: #1FB264;--%>
            <%--border: 4px dashed #ffffff;--%>
        <%--}--%>

        <%--.image-title-wrap {--%>
            <%--padding: 0 15px 15px 15px;--%>
            <%--color: #222;--%>
        <%--}--%>

        <%--.drag-text {--%>
            <%--text-align: center;--%>
        <%--}--%>

        <%--.drag-text h3 {--%>
            <%--font-weight: 100;--%>
            <%--text-transform: uppercase;--%>
            <%--color: #15824B;--%>
            <%--padding: 60px 0;--%>
        <%--}--%>

        <%--.file-upload-image {--%>
            <%--width: 100%;--%>
            <%--padding: 15px;--%>
            <%--margin: 5px 0 22px 0;--%>
        <%--}--%>

        <%--.remove-image {--%>
            <%--width: 200px;--%>
            <%--margin: 0;--%>
            <%--color: #fff;--%>
            <%--background: #cd4535;--%>
            <%--border: none;--%>
            <%--padding: 10px;--%>
            <%--border-radius: 4px;--%>
            <%--border-bottom: 4px solid #b02818;--%>
            <%--transition: all .2s ease;--%>
            <%--outline: none;--%>
            <%--text-transform: uppercase;--%>
            <%--font-weight: 700;--%>
        <%--}--%>

        <%--.remove-image:hover {--%>
            <%--background: #c13b2a;--%>
            <%--color: #ffffff;--%>
            <%--transition: all .2s ease;--%>
            <%--cursor: pointer;--%>
        <%--}--%>

        <%--.remove-image:active {--%>
            <%--border: 0;--%>
            <%--transition: all .2s ease;--%>
        <%--}--%>
    <%--</style>--%>
</head>



