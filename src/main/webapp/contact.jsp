<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Contact - MediConnect</title>
    <%@include file="../component/allcss.jsp" %>
</head>
<body>
    <%@include file="../component/navbar.jsp" %>
    <div class="container mt-5">
        <h2 class="section-heading">Contact Us</h2>
        <p>We’re here to help you. Please feel free to reach out to us using the following contact details or the form below:</p>
        <h4>Contact Information</h4>
        <ul>
            <li><strong>Email:</strong> support@mediconnect.com</li>
            <li><strong>Phone:</strong> +1 (800) 123-4567</li>
            <li><strong>Address:</strong> 123 Healthcare Blvd, Wellness City, USA</li>
        </ul>
        <h4>Contact Form</h4>
        <form action="submitContactForm" method="POST">
            <div class="mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="message" class="form-label">Message:</label>
                <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
            </div>
            <a href="index.jsp" class="btn btn-success">Submit</a>
            <br><br>
            
        </form>
    </div>
    
    <%@include file="../component/footer.jsp" %>
</body>
</html>