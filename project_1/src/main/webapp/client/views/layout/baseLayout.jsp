<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
	prefix="tilesx"%>
<!DOCTYPE html>
<html lang="en">
	<head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="/client/assets/img/favicon.png">

        <!-- all css here -->
        <!-- bootstrap v3.3.6 css -->
        <link rel="stylesheet" href="/client/assets/css/bootstrap.min.css">
        <!-- animate css -->
        <link rel="stylesheet" href="/client/assets/css/animate.css">
        <!-- meanmenu css -->
        <link rel="stylesheet" href="/client/assets/css/meanmenu.min.css">
        <!-- owl.carousel css -->
        <link rel="stylesheet" href="/client/assets/css/owl.carousel.css">
        <!-- font-awesome css -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
        <!-- flexslider.css-->
        <link rel="stylesheet" href="/client/assets/css/flexslider.css">
        <!-- chosen.min.css-->
        <link rel="stylesheet" href="/client/assets/css/chosen.min.css">
        <!-- style css -->
        <link rel="stylesheet" href="/client/assets/style.css">
        <!-- responsive css -->
        <link rel="stylesheet" href="/client/assets/css/responsive.css">
        <!-- modernizr css -->
        <script src="/client/assets/js/vendor/modernizr-2.8.3.min.js"></script>

        <title>
            <tiles:insertAttribute name="title" ignore="true" />
            </title>
	</head>
	<body>
		<header>
			<tiles:insertAttribute name="header" />
		</header>

		<tiles:insertAttribute name="body" />

		<footer>
			<tiles:insertAttribute name="footer" />
		</footer>

        <!-- all js here -->
        <!-- jquery latest version -->
        <script src="/client/assets/js/vendor/jquery-1.12.0.min.js"></script>
        <!-- bootstrap js -->
        <script src="/client/assets/js/bootstrap.min.js"></script>
        <!-- owl.carousel js -->
        <script src="/client/assets/js/owl.carousel.min.js"></script>
        <!-- meanmenu js -->
        <script src="/client/assets/js/jquery.meanmenu.js"></script>
        <!-- wow js -->
        <script src="/client/assets/js/wow.min.js"></script>
        <!-- jquery.parallax-1.1.3.js -->
        <script src="/client/assets/js/jquery.parallax-1.1.3.js"></script>
        <!-- jquery.countdown.min.js -->
        <script src="/client/assets/js/jquery.countdown.min.js"></script>
        <!-- jquery.flexslider.js -->
        <script src="/client/assets/js/jquery.flexslider.js"></script>
        <!-- chosen.jquery.min.js -->
        <script src="/client/assets/js/chosen.jquery.min.js"></script>
        <!-- jquery.counterup.min.js -->
        <script src="/client/assets/js/jquery.counterup.min.js"></script>
        <!-- waypoints.min.js -->
        <script src="/client/assets/js/waypoints.min.js"></script>
        <!-- plugins js -->
        <script src="/client/assets/js/plugins.js"></script>
        <!-- main js -->
        <script src="/client/assets/js/main.js"></script>
        <%--client index js--%>
        <script src="/client/assets/js/client-index.js"></script>

	</body>
</html>
