<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: TrongTran
  Date: 11/9/2018
  Time: 10:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                                    <spring:url value="/admin/add-manager?${_csrf.parameterName}=${_csrf.token}"
                                                var="addManager"/>
                                    <form action="${addManager}" method="post" enctype="multipart/form-data">
                                        <div class="box">
                                            <input type="file" name="fileExcel" id="file-1" accept=".xls, .xlsx"
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
                        <li class="nav-parent">
                            <a>
                                <i class="fa fa-list-alt" aria-hidden="true"></i>
                                <span>Books</span>
                            </a>
                            <ul class="nav nav-children">
                                <li>
                                    <a href="forms-basic.html">
                                        Books
                                    </a>
                                </li>
                                <li>
                                    <a href="/admin/authors">
                                        Authors
                                    </a>
                                </li>
                                <li>
                                    <a href="forms-validation.html">
                                        Producers
                                    </a>
                                </li>
                                <li>
                                    <a href="forms-layouts.html">
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

    <section role="main" class="content-body">
        <header class="page-header">
            <h2>Dashboard</h2>

            <div class="right-wrapper pull-right">
                <ol class="breadcrumbs">
                    <li>
                        <a href="index.html">
                            <i class="fa fa-home"></i>
                        </a>
                    </li>
                    <li><span>Dashboard</span></li>
                </ol>

                <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
            </div>
        </header>
        <!-- start: page -->
        <div class="row">

            <div class="col-md-6 col-lg-12 col-xl-6">
                <div class="row">
                    <div class="col-md-12 col-lg-6 col-xl-6">
                        <section class="panel panel-featured-left panel-featured-primary">
                            <div class="panel-body">
                                <div class="widget-summary">
                                    <div class="widget-summary-col widget-summary-col-icon">
                                        <div class="summary-icon bg-primary">
                                            <i class="fa fa-life-ring"></i>
                                        </div>
                                    </div>
                                    <div class="widget-summary-col">
                                        <div class="summary">
                                            <h4 class="title">Support Questions</h4>
                                            <div class="info">
                                                <strong class="amount">1281</strong>
                                                <span class="text-primary">(14 unread)</span>
                                            </div>
                                        </div>
                                        <div class="summary-footer">
                                            <a class="text-muted text-uppercase">(view all)</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                    <div class="col-md-12 col-lg-6 col-xl-6">
                        <section class="panel panel-featured-left panel-featured-secondary">
                            <div class="panel-body">
                                <div class="widget-summary">
                                    <div class="widget-summary-col widget-summary-col-icon">
                                        <div class="summary-icon bg-secondary">
                                            <i class="fa fa-usd"></i>
                                        </div>
                                    </div>
                                    <div class="widget-summary-col">
                                        <div class="summary">
                                            <h4 class="title">Total Profit</h4>
                                            <div class="info">
                                                <strong class="amount">$ ${totalProfit}</strong>
                                            </div>
                                        </div>
                                        <div class="summary-footer">
                                            <a class="text-muted text-uppercase">(withdraw)</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                    <div class="col-md-12 col-lg-6 col-xl-6">
                        <section class="panel panel-featured-left panel-featured-tertiary">
                            <div class="panel-body">
                                <div class="widget-summary">
                                    <div class="widget-summary-col widget-summary-col-icon">
                                        <div class="summary-icon bg-tertiary">
                                            <i class="fa fa-shopping-cart"></i>
                                        </div>
                                    </div>
                                    <div class="widget-summary-col">
                                        <div class="summary">
                                            <h4 class="title">Today's Orders</h4>
                                            <div class="info">
                                                <strong class="amount">${totalOrder}</strong>
                                            </div>
                                        </div>
                                        <div class="summary-footer">
                                            <a class="text-muted text-uppercase">(statement)</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                    <div class="col-md-12 col-lg-6 col-xl-6">
                        <section class="panel panel-featured-left panel-featured-quartenary">
                            <div class="panel-body">
                                <div class="widget-summary">
                                    <div class="widget-summary-col widget-summary-col-icon">
                                        <div class="summary-icon bg-quartenary">
                                            <i class="fa fa-user"></i>
                                        </div>
                                    </div>
                                    <div class="widget-summary-col">
                                        <div class="summary">
                                            <h4 class="title">Today's Visitors</h4>
                                            <div class="info">
                                                <strong class="amount">${pageContext.response.locale}</strong>
                                            </div>
                                        </div>
                                        <div class="summary-footer">
                                            <a class="text-muted text-uppercase">(report)</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-12 col-xl-6">
                <section class="panel">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="chart-data-selector ready" id="salesSelectorWrapper">
                                    <h2>
                                        Total order:
                                        <strong>
                                            <select class="form-control" id="salesSelector" style="display: none;">
                                                <option value="JSOFT Admin" selected="">Day</option>
                                                <option value="JSOFT Drupal">Month</option>
                                                <option value="JSOFT Wordpress">Year</option>
                                            </select>
                                        </strong>
                                    </h2>

                                    <div id="salesSelectorItems" class="chart-data-selector-items mt-sm">
                                        <!-- Flot: Sales JSOFT Admin -->
                                        <div class="chart chart-sm chart-active" data-sales-rel="JSOFT Admin"
                                             id="flotDashSales1" style="padding: 0px;">
                                            <canvas class="flot-base" width="599" height="184"
                                                    style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 599px; height: 184px;"></canvas>
                                            <div class="flot-text"
                                                 style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);">
                                                <div class="flot-x-axis flot-x1-axis xAxis x1Axis"
                                                     style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;">
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 27px; text-align: center;">
                                                        Jan
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 105px; text-align: center;">
                                                        Feb
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 183px; text-align: center;">
                                                        Mar
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 263px; text-align: center;">
                                                        Apr
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 341px; text-align: center;">
                                                        May
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 422px; text-align: center;">
                                                        Jun
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 503px; text-align: center;">
                                                        Jul
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 579px; text-align: center;">
                                                        Aug
                                                    </div>
                                                </div>
                                                <div class="flot-y-axis flot-y1-axis yAxis y1Axis"
                                                     style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;">
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; top: 135px; left: 14px; text-align: right;">
                                                        0
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; top: 101px; left: 1px; text-align: right;">
                                                        100
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; top: 68px; left: 1px; text-align: right;">
                                                        200
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; top: 34px; left: 1px; text-align: right;">
                                                        300
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; top: 0px; left: 1px; text-align: right;">
                                                        400
                                                    </div>
                                                </div>
                                            </div>
                                            <canvas class="flot-overlay" width="599" height="184"
                                                    style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 599px; height: 184px;"></canvas>
                                        </div>
                                        <script>
                                            var flotDashSales1Data = [{
                                                data: [
                                                    <c:forEach var="type" items="${ordersOfTheMonth}">
                                                    ["${type.key}", ${type.value}],
                                                    </c:forEach>
                                                ],
                                                color: "#0088cc"
                                            }];
                                            // See: /admin/assets/javascripts/dashboard/examples.dashboard.js for more settings.
                                        </script>

                                        <!-- Flot: Sales JSOFT Drupal -->
                                        <div class="chart chart-sm chart-hidden" data-sales-rel="JSOFT Drupal"
                                             id="flotDashSales2" style="padding: 0px;">
                                            <canvas class="flot-base" width="599" height="184"
                                                    style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 599px; height: 184px;"></canvas>
                                            <div class="flot-text"
                                                 style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);">
                                                <div class="flot-x-axis flot-x1-axis xAxis x1Axis"
                                                     style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;">
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 27px; text-align: center;">
                                                        Jan
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 105px; text-align: center;">
                                                        Feb
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 183px; text-align: center;">
                                                        Mar
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 263px; text-align: center;">
                                                        Apr
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 341px; text-align: center;">
                                                        May
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 422px; text-align: center;">
                                                        Jun
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 503px; text-align: center;">
                                                        Jul
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 579px; text-align: center;">
                                                        Aug
                                                    </div>
                                                </div>
                                                <div class="flot-y-axis flot-y1-axis yAxis y1Axis"
                                                     style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;">
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; top: 135px; left: 14px; text-align: right;">
                                                        0
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; top: 113px; left: 1px; text-align: right;">
                                                        100
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; top: 90px; left: 1px; text-align: right;">
                                                        200
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; top: 68px; left: 1px; text-align: right;">
                                                        300
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; top: 45px; left: 1px; text-align: right;">
                                                        400
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; top: 23px; left: 1px; text-align: right;">
                                                        500
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; top: 0px; left: 1px; text-align: right;">
                                                        600
                                                    </div>
                                                </div>
                                            </div>
                                            <canvas class="flot-overlay" width="599" height="184"
                                                    style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 599px; height: 184px;"></canvas>
                                        </div>
                                        <script>
                                            var flotDashSales2Data = [{
                                                data: [
                                                    <c:forEach var="type" items="${ordersOfTheYear}">
                                                    ["${type.key}", ${type.value}],
                                                    </c:forEach>
                                                ],
                                                color: "#2baab1"
                                            }];
                                            // See: /admin/assets/javascripts/dashboard/examples.dashboard.js for more settings.
                                        </script>

                                        <!-- Flot: Sales JSOFT Wordpress -->
                                        <div class="chart chart-sm chart-hidden" data-sales-rel="JSOFT Wordpress"
                                             id="flotDashSales3" style="padding: 0px;">
                                            <canvas class="flot-base" width="599" height="184"
                                                    style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 599px; height: 184px;"></canvas>
                                            <div class="flot-text"
                                                 style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);">
                                                <div class="flot-x-axis flot-x1-axis xAxis x1Axis"
                                                     style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;">
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 33px; text-align: center;">
                                                        Jan
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 110px; text-align: center;">
                                                        Feb
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 187px; text-align: center;">
                                                        Mar
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 266px; text-align: center;">
                                                        Apr
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 343px; text-align: center;">
                                                        May
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 424px; text-align: center;">
                                                        Jun
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 504px; text-align: center;">
                                                        Jul
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; max-width: 43px; top: 161px; left: 579px; text-align: center;">
                                                        Aug
                                                    </div>
                                                </div>
                                                <div class="flot-y-axis flot-y1-axis yAxis y1Axis"
                                                     style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;">
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; top: 135px; left: 20px; text-align: right;">
                                                        0
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; top: 108px; left: 7px; text-align: right;">
                                                        250
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; top: 81px; left: 7px; text-align: right;">
                                                        500
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; top: 54px; left: 7px; text-align: right;">
                                                        750
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; top: 27px; left: 1px; text-align: right;">
                                                        1000
                                                    </div>
                                                    <div class="flot-tick-label tickLabel"
                                                         style="position: absolute; top: 0px; left: 1px; text-align: right;">
                                                        1250
                                                    </div>
                                                </div>
                                            </div>
                                            <canvas class="flot-overlay" width="599" height="184"
                                                    style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 599px; height: 184px;"></canvas>
                                        </div>
                                        <script>

                                            var flotDashSales3Data = [{
                                                data: [
                                                    <c:forEach var="type" items="${ordersOfTheYears}">
                                                    ["${type.key}", ${type.value}],
                                                    </c:forEach>
                                                ],
                                                color: "#734ba9"
                                            }];

                                            // See: /admin/assets/javascripts/dashboard/examples.dashboard.js for more settings.

                                        </script>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>

        <!-- end: page -->
    </section>
</div>


<aside id="sidebar-right" class="sidebar-right">
    <div class="nano has-scrollbar">
        <div class="nano-content" tabindex="0" style="right: -17px;">
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
                                <img src="/admin/assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
                            </figure>
                            <div class="profile-info">
                                <span class="name">Joseph Doe Junior</span>
                                <span class="title">Hey, how are you?</span>
                            </div>
                        </li>
                        <li class="status-online">
                            <figure class="profile-picture">
                                <img src="/admin/assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
                            </figure>
                            <div class="profile-info">
                                <span class="name">Joseph Doe Junior</span>
                                <span class="title">Hey, how are you?</span>
                            </div>
                        </li>
                        <li class="status-offline">
                            <figure class="profile-picture">
                                <img src="/admin/assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
                            </figure>
                            <div class="profile-info">
                                <span class="name">Joseph Doe Junior</span>
                                <span class="title">Hey, how are you?</span>
                            </div>
                        </li>
                        <li class="status-offline">
                            <figure class="profile-picture">
                                <img src="/admin/assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
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
            <div class="nano-slider" style="height: 741px; transform: translate(0px, 0px);"></div>
        </div>
    </div>
</aside>
<head>
    <!-- Specific Page Vendor CSS -->
    <link rel="stylesheet" href="/admin/assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css">
    <link rel="stylesheet" href="/admin/assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css">
    <link rel="stylesheet" href="/admin/assets/vendor/morris/morris.css">

    <!-- Theme CSS -->
    <link rel="stylesheet" href="/admin/assets/stylesheets/theme.css">

    <!-- Skin CSS -->
    <link rel="stylesheet" href="/admin/assets/stylesheets/skins/default.css">

    <!-- Theme Custom CSS -->
    <link rel="stylesheet" href="/admin/assets/stylesheets/theme-custom.css">

    <link rel="stylesheet" href="/admin/assets/stylesheets/tooltip.css">
    <link rel="stylesheet" type="text/css" href="/admin/assets/custom/popup.css">
    <link rel="stylesheet" type="text/css" href="/admin/assets/custom/input-file-excel.css">
    <link rel="stylesheet" type="text/css" href="/admin/assets/notify/notify.css">


    <!-- Vendor -->
    <script src="/admin/assets/vendor/jquery/jquery.js"></script>
    <script src="/admin/assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
    <script src="/admin/assets/vendor/bootstrap/js/bootstrap.js"></script>
    <script src="/admin/assets/vendor/nanoscroller/nanoscroller.js"></script>
    <script src="/admin/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="/admin/assets/vendor/magnific-popup/magnific-popup.js"></script>
    <script src="/admin/assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>


    <!-- Specific Page Vendor -->
    <script src="/admin/assets/vendor/jquery-ui/js/jquery-ui-1.10.4.custom.js"></script>
    <script src="/admin/assets/vendor/jquery-ui-touch-punch/jquery.ui.touch-punch.js"></script>
    <script src="/admin/assets/vendor/jquery-appear/jquery.appear.js"></script>
    <script src="/admin/assets/vendor/bootstrap-multiselect/bootstrap-multiselect.js"></script>
    <script src="/admin/assets/vendor/jquery-easypiechart/jquery.easypiechart.js"></script>
    <script src="/admin/assets/vendor/flot/jquery.flot.js"></script>
    <script src="/admin/assets/vendor/flot-tooltip/jquery.flot.tooltip.js"></script>
    <script src="/admin/assets/vendor/flot/jquery.flot.pie.js"></script>
    <script src="/admin/assets/vendor/flot/jquery.flot.categories.js"></script>
    <script src="/admin/assets/vendor/flot/jquery.flot.resize.js"></script>
    <script src="/admin/assets/vendor/jquery-sparkline/jquery.sparkline.js"></script>
    <script src="/admin/assets/vendor/raphael/raphael.js"></script>
    <script src="/admin/assets/vendor/morris/morris.js"></script>
    <script src="/admin/assets/vendor/gauge/gauge.js"></script>
    <script src="/admin/assets/vendor/snap-svg/snap.svg.js"></script>
    <script src="/admin/assets/vendor/liquid-meter/liquid.meter.js"></script>
    <script src="/admin/assets/vendor/jqvmap/jquery.vmap.js"></script>
    <script src="/admin/assets/vendor/jqvmap/data/jquery.vmap.sampledata.js"></script>
    <script src="/admin/assets/vendor/jqvmap/maps/jquery.vmap.world.js"></script>
    <script src="/admin/assets/vendor/jqvmap/maps/continents/jquery.vmap.africa.js"></script>
    <script src="/admin/assets/vendor/jqvmap/maps/continents/jquery.vmap.asia.js"></script>
    <script src="/admin/assets/vendor/jqvmap/maps/continents/jquery.vmap.australia.js"></script>
    <script src="/admin/assets/vendor/jqvmap/maps/continents/jquery.vmap.europe.js"></script>
    <script src="/admin/assets/vendor/jqvmap/maps/continents/jquery.vmap.north-america.js"></script>
    <script src="/admin/assets/vendor/jqvmap/maps/continents/jquery.vmap.south-america.js"></script>


    <%--<!-- Specific Page Vendor -->--%>
    <%--<script src="/admin/assets/vendor/select2/select2.js"></script>--%>
    <%--<script src="/admin/assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>--%>
    <%--<script src="/admin/assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script>--%>
    <!-- Theme Base, Components and Settings -->
    <script src="/admin/assets/javascripts/theme.js"></script>

    <!-- Theme Custom -->
    <script src="/admin/assets/javascripts/theme.custom.js"></script>

    <!-- Theme Initialization Files -->
    <script src="/admin/assets/javascripts/theme.init.js"></script>


    <!-- Examples -->
    <script src="/admin/assets/javascripts/dashboard/examples.dashboard.js"></script>
    <script src="/admin/assets/notify/notify.js"></script>
    <script src="/admin/assets/custom/input-file-excel.js"></script>

    <script>
        $(document).ready(function () {
            if ('${excelMessage}' == 'error!') {
                $.notify("Error!", {type: "danger", align: "right", verticalAlign: "top", icon: "close"});
            }
            if ('${excelMessage}' == 'success!') {
                $.notify("success!", {type: "success", align: "right", verticalAlign: "top", icon: "close"});
            }
        });
    </script>
</head>


