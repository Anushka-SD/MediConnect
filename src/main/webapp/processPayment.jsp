<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../component/allcss.jsp"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Payment Success</title>
    <style>
        body {
            background-image: url('images/background.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }
        
        .success-container {
            margin: 50px auto;
            text-align: center;
            padding: 30px;
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0.9);
            max-width: 600px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }

        .success-container img {
            width: 100px;
            margin-bottom: 20px;
        }

        .success-container h2 {
            color: #28a745;
        }

        .details {
            text-align: left;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ddd;
            background-color: #f9f9f9;
            border-radius: 8px;
        }

        .details p {
            margin: 5px 0;
            font-size: 16px;
        }

        .btn-home {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #28a745;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }

        .btn-home:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <%@ include file="../component/navbar.jsp" %>

    <div class="container success-container">
        <img src="images/tick.jpg" alt="Success">
        <h2>Appointment Booked Successfully!</h2>
        <p>Thank you for booking your appointment.</p>


        <a href="index.jsp" class="btn-home">Go to Home</a>
    </div>

    <%@ include file="../component/footer.jsp" %>
</body>
</html>