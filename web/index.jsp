<%-- 
    Document   : index
    Created on : May 29, 2012, 11:00:11 PM
    Author     : Zhengyi
--%>

<%@page import="model.cart.Cart"%>
<%@page import="model.user.User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Integer hitCounter = (Integer) application.getAttribute("hitCounter");
    if (hitCounter == null) {
        hitCounter = 0;
    }
    hitCounter++;
    application.setAttribute("hitCounter", hitCounter);
    String extension = ".jsp";
    User user = (User) session.getAttribute("user");
    Cart cart = (Cart) session.getAttribute("cart"); 
    if (cart == null) 
        cart = new Cart();
    String error = (String) request.getAttribute("error") == null ? "" :    
        (String) request.getAttribute("error");
    String content = request.getParameter("content");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="resume, computer, project">
        <meta name="description" content="Project Showroom">
        <meta name="author" content="Zhengyi Wilson Liang">
        <link rel="shortcut icon" href="images/siteStyle/icon.ico"/>
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
        <link rel="stylesheet" href="css/mainStyle.css"/>
        <link rel="stylesheet" href="css/posStyle.css" type="text/css"/>
        <link rel="stylesheet" href="css/movingboxes.css"type="text/css"/>
        <link rel="stylesheet" type="text/css" href="css/nivo-slider.css"/>
        <link rel="stylesheet" type="text/css" href="themes/default/default.css"/>
        <link rel="stylesheet" type="text/css" href="css/homeStyle.css"/>
        <script src="Pos/web-files/dtjava.js"></script>
        <script src="js/jquery.movingboxes.js" type="text/javascript"></script>
        <script src="js/fancyzoom.js" type="text/javascript"></script>        
        <script src="js/jquery.nivo.slider.js" type="text/javascript"></script>
        <script src="js/main.js" type="text/javascript"></script>
        <title>Welcome to My Webpage</title>
        <style>
        </style>
    </head>
    <body>
        <div id="wrapper">
            <!--
            <div id="topBar">

            </div>-->
            <div id='trigger'></div>
            <div id="sideBar">
                <li><h3><a href="javascript: loadPage('home.jsp')" class="selected">Home</a></h3></li>
                <li><h3><a href="javascript: loadPage('pos.jsp')" class="nonselected">WBPOSS</a></h3></li>
                <li><h3><a href="javascript: loadPage('aboutMe.html')" class="nonselected">About Me</a></h3></li>
                <li><h3><a class="nonselected" id='hitCounter'><%= hitCounter %> Hits</a></h3></li>
            </div>
            <div id="header">
                <a id="logoLink" onclick="loadPage('home.jsp');"></a>
                <%--
                     <div id='slideMenu'>
                         <li><span class="trigger"></span><span class="title"><a onclick="loadPage('pos.jsp');">Point of Sale System</a></span></li>
                         <li><span class="trigger"></span><span class="title"><a href="">DrawKit</a></span></li>
                         <li><span class="trigger"></span><span class="title"><a>Others</a></span></li>
                     </div>
                <div id="log">
                    Welcome
                    <c:choose>
                        <c:when test="<%= user != null %>">
                            <%= user.getFirstName() %>, <a href="#">Logout</a>
                        </c:when>
                        <c:otherwise>
                            Guest, You May <a id="loginLink">Login</a> | <a href="#">Sign up</a>
                        </c:otherwise>
                    </c:choose>
                    <!--<span class="cart">
                        <a href="#"><%= cart.getTotal() %> My Cart</a>
                    </span>-->

                </div>--%>
                <div id='login'>
                    <form id='loginForm' action="login" onsubmit="return ">
                        <table border='0'>
                            <tr>
                                <td><label for="loginName">User Name</label></td>
                                <td><input id="loginName" type='text' name='userName'></td>
                            </tr>
                            <tr>
                                <td><label for="loginPass">Password</label></td>
                                <td><input id="loginPass" type="password" name="password"></td>
                            </tr>
                        </table>
                        <input type="submit" id="loginButton" value="Login">
                    </form>
                </div>
                <div id="clear"></div>
                <div id="siteIntro">
                    <!-- slides powered by nivo-slider -->
                    <div class="slider-wrapper theme-default">
                        <div id="projectSlides" class="nivoSlider">
                            <img src="images/nivoSlider/pos.jpg" data-thumb="images/nivoSlider/pos.jpg" alt="" />
                            <img src="images/nivoSlider/egrapid.jpg" data-thumb="images/nivoSlider/egrapid.jpg" alt="" />
                            <img src="images/nivoSlider/drawkit.jpg" data-thumb="images/nivoSlider/drawkit.jpg" alt=""  />
                            <img src="images/nivoSlider/wiki.jpg" data-thumb="images/nivoSlider/wiki.jpg" alt=""  />
                        </div>
                        <!--data-transition="slideInLeft"-->
                        <div id="htmlcaption" class="nivo-html-caption">
                            <strong>This</strong> is an example of a <em>HTML</em> caption with <a href="#">a link</a>. 
                        </div>
                    </div>
                    <h2>Welcome</h2>
                    <p>
                        This website mainly showcases the programs I created during university
                        study period, and it also runs on the Debian OS I setup using my own computer, 
                        with Apache Tomcat Server and JSP as Server-side Scripting. Everything but 
                        the sliders are made from scratch on this site, sliders are powered by existing 
                        ones on the net with some change of codes; animation is powered by jQuery plug-in.
                    </p>
                    <p>
                        Projects that are worth showing include the Graduation Project - 
                        <a href="javascript: loadPage('pos.jsp')">WBPOSS</a> (Web Based Point of Sale System); the weather forecasting system 
                        called <a href="javascript: expand('#egrapid', '280px')" type="hidden">EGRAPID</a> during the summer; the simple drawing application 
                        <a href="javascript: expand('#drawkit', '280px')">DrawKit</a>; the <a href="javascript: expand('#ushahidi', '240px')">
                            Ushahidi Standalone Application</a> and last but not the least 
                        the <a href="javascript: expand('#wiki', '300px')">Wiki website managing system</a>.
                    </p>
                    <p>
                        All applications are finished upto a point where they meant to according to the 
                        course requirement. Most of the projects will have only screen shots, 
                        besides the WBPOSS.
                    </p>      
                </div>
            </div>
            <div id="clear"></div>
            <div id="animateArea">
                <div id="content">
                    <jsp:include page="home.jsp"/>
                </div>
            </div>
            <div id="footBar">
                <div id="message">
                    <p>Thank you for visiting my webpage.</p>
                    Feel free to contact me at
                    <a href="mailto:wilson.liang@outlook.com?subject=Hello" target="_self">wilson.liang@outlook.com</a>
                </div>
            </div>
        </div>
    </body>
</html>
