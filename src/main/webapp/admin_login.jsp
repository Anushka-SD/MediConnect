<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<%@include file="component/allcss.jsp" %>
<style>
    body {
        background-color: #f8f9fa;
        font-family: Arial, sans-serif;
    }
    
    body {
        background-image: url('images/background.jpg');
        background-size: cover; /* This ensures the image covers the entire page */
        background-position: center; /* Keeps the image centered */
        background-attachment: fixed; /* Keeps the background fixed while scrolling */
    }
    
    .login-container {
        margin-top: 10px;
        display: flex;
        justify-content: center;
        align-items: center;
        height: calc(100vh - 150px);
    }

    .login-card {
        background-color: #ffffff;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        border-radius: 8px;
        padding: 30px;
        width: 100%;
        max-width: 400px;
    }

    .login-card h2 {
        text-align: center;
        margin-bottom: 20px;
        font-weight: bold;
        color: #343a40;
    }

    .login-card .form-label {
        font-size: 14px;
        font-weight: bold;
        color: #495057;
    }

    .login-card .btn-login {
        background-color: #28a745;
        color: #ffffff;
        font-size: 16px;
        padding: 10px;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    .login-card .btn-login:hover {
        background-color: #218838;
    }

    .success-message {
        color: #28a745;
        font-size: 16px;
        text-align: center;
        margin-bottom: 10px;
    }

    .error-message {
        color: #dc3545;
        font-size: 16px;
        text-align: center;
        margin-bottom: 10px;
    }

    .login-footer {
        text-align: center;
        margin-top: 15px;
        font-size: 14px;
        color: #6c757d;
    }

    .login-footer a {
        color: #007bff;
        text-decoration: none;
    }

    .login-footer a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
<%@include file="component/navbar.jsp" %>

<div class="container login-container">
    <div class="login-card">
        <h2>Admin Login</h2>

        <c:if test="${not empty sucMsg}">
            <p class="success-message">${sucMsg}</p>
            <c:remove var="sucMsg" scope="session" />
        </c:if>

        <c:if test="${not empty errorMsg}">
            <p class="error-message">${errorMsg}</p>
            <c:remove var="errorMsg" scope="session" />
        </c:if>

        <form action="adminLogin" method="post">
            <div class="mb-3">
                <label class="form-label">Email Address</label>
                <input required name="email" type="email" class="form-control" placeholder="Enter your email">
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <input required name="password" type="password" class="form-control" placeholder="Enter your password">
            </div>
            <button type="submit" class="btn btn-login w-100">Login</button>
        </form>

        <div class="login-footer">
            <p>Forgot your password? <a href="resetPassword.jsp">Reset here</a></p>
        </div>
    </div>
</div>

<%@include file="../component/footer.jsp"%>
</body>
</html>
