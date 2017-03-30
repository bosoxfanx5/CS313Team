<%-- 
    Document   : index
    Created on : Mar 9, 2017, 3:38:10 PM
    Author     : Ele Thompson
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHangry | Find Some Foods</title>

        <!-- jQuery Support -->
        <script src="scripts/jquery-3.1.1.min.js"></script>

        <!-- Bootstrap JavaScript Support -->
        <script src="scripts/bootstrap.min.js"></script>

        <script src="scripts/mapHelper.js"></script>

        <script src="scripts/ihangry.js"></script>

        <script src="http://maps.google.com/maps/api/js?sensor=false&key=AIzaSyBxRoQJSpiJs0YzwUoQZS86YqRT0eZSjoE" type="text/javascript"></script>

        <script type="text/javascript">
            $(function () {
                var lat = '${latitude}';
                var lng = '${longitude}';
                setupMap(lat, lng);
                $('#FindNext').on('click', function () {
                    getRecommendation();
                });
            });

        </script>

        <!-- BOOTSTRAP CSS -->
        <link rel="stylesheet" href="content/bootstrap.min.css">

        <!-- MATERIAL DESIGN FOR BOOTSTRAP - http://fezvrasta.github.io/bootstrap-material-design/ -->
        <link rel="stylesheet" href="content/bootstrap-material-design.min.css" type="text/css">

        <!-- FONT AWESOME ICONS -->
        <link rel="stylesheet" href="content/FontAwesome/css/font-awesome.min.css" type="text/css">

        <!-- CUSTOM STYLESHEETS-->
        <link rel="stylesheet" href="content/styles.css" type="text/css">

        <!-- FAVICON IMAGE-->
        <link rel="icon" href="/images/iHangry.ico" type="image/x-icon">

        <style>
/*            Any chance we can find a way to move this into our css file? I can't seem to get it working if it is.*/
            .slide {
                background: #fff;
                -ms-border-radius: 4px;
                border-radius: 4px;
                -webkit-box-shadow: 0 8px 6px -6px #e0e0e0;
                -ms-box-shadow: 0 8px 6px -6px #e0e0e0;
                box-shadow: 0 8px 6px -6px #e0e0e0;
                padding: 20px;
                border: 1px solid #dce4e9;
                margin-bottom: 20px;
                -ms-word-wrap: break-word;
                word-wrap: break-word;
            }

            .slide.feedback-popup {
                position: absolute;
                bottom: 10px;
                width: 300px;
                left: -310px;
                padding-top: 10px;
            }

            .slide.feedback-popup #closeFeedbackPopup {
                font-size: 200%;
            }

            .overlay {
                height: 90%;
                width: 90%;
                position: absolute;
                z-index: 1;
                top: 15px;
                left: 45px;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0, 0.9);
                overflow-x: hidden;
                display: none;
            }
            .closebtn {
                position: absolute;
                z-index: 2;
                top: 20px;
                right: 60px;
                font-size: 60px;
            }

        </style>

    </head>
    <body>

        <main>
            <div class="container">
                <div id="map"></div>
                <div class="row margin-top">
                    <div class="col-sm-5 col-md-4">
                        <div class="row">
                            <div id="InfoDiv" class="well">
                                <span class="text-center">
                                    <h1>iHangry</h1>
                                    <p>Find your lunch.</p>
                                </span>
                                <hr>
                                <div class="loader-div h1 text-center">
                                    <i class="fa fa-spinner fa-pulse"></i>
                                </div>
                                <div class="content-div collapse">
                                    <h2 class="name">Restaurant Name</h2>
                                    <p class="rating">Ratings stars</p>
                                    <p class="address">Address</p>
                                    <p class="distance">Distance</p>
                                    <p class="eta">Time to get there</p>
                                </div>
                                
                                <div class="text-center">
                                    <button class="btn btn-large btn-raised btn-primary" id="FindNext">That looks gross. Find another.</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row text-center">
                    <h2>DEBUGGING</h2>
                    <pre>
                        ${location}<br>
                        Geocode Results:<br>
                        <c:forEach items="${geocodeList}" var="geocode">
                            ${geocode}<br>
                        </c:forEach>
                    </pre>
                    <a href="index.jsp" class="btn btn-large btn-raised btn-primary pull-right">Change Location</a>
                </div>
            </div>
        </main>
        <div class="overlay">
            <a href="javascript:void(0)" id="closebtn" class="closebtn">&times;</a>
            <iframe  src="https://docs.google.com/forms/d/e/1FAIpQLScwxjahxHmM28o4sZlR_JFM0bMhKyxdIN6UD9OM-rhFOu8kRA/viewform?embedded=true" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>
        </div>
        <footer>
            <div class="slide feedback-popup">
                <a href="#" class="pull-right" id="closeFeedbackPopup">
                    &times;
                </a>
                <h4>Send Us Some Feedback</h4>
                <button id="feedback" type="button" class="btn btn-primary">Send Feedback</button>
            </div>
        </footer>
        <!-- Geolocation Access Script (Move as needed) -->
        <!--        <script>
                   
                </script>-->
    </body>
</html>
