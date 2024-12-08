<%@ page import="com.db.DBConnect" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.entity.Doctor" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Dashboard</title>
<%@ include file="../component/allcss.jsp" %>
<style type="text/css">
.paint-card {
    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
    <!-- Include Navbar -->
    <%@ include file="navbar.jsp" %>

    <!-- Redirect if not logged in -->
    <c:if test="${ empty sessionScope.doctObj }">
        <c:redirect url="../doctor_login.jsp" />
    </c:if>

    <div class="container p-5">
        <p class="text-center fs-3">Doctor Dashboard</p>

        <!-- Display error or success messages -->
        <c:if test="${not empty errorMsg}">
            <p class="fs-3 text-center text-danger">${errorMsg}</p>
            <c:remove var="errorMsg" scope="session" />
        </c:if>
        <c:if test="${not empty succMsg}">
            <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
            <c:remove var="succMsg" scope="session" />
        </c:if>

        <!-- Dashboard Logic -->
        <%
        Doctor d = (Doctor) session.getAttribute("doctObj");
        DoctorDao dao = new DoctorDao(DBConnect.getConn());

        if (d == null) {
        %>
            <p class="text-danger text-center">Session expired or not logged in. Please <a href="../doctor_login.jsp">login</a> again.</p>
        <%
        } else {
        %>
            <!-- Centered doctor and appointment cards -->
            <div class="row justify-content-center">
                <!-- Doctor Card -->
                <div class="col-md-4 mb-3">
                    <div class="card paint-card">
                        <div class="card-body text-center text-success">
                            <i class="fas fa-user-md fa-3x"></i><br>
                            <p class="fs-4 text-center">
                                Total Doctors <br><%= dao.countDoctor() %>
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Appointment Card -->
                <div class="col-md-4 mb-3">
                    <div class="card paint-card">
                        <div class="card-body text-center text-success">
                            <i class="far fa-calendar-check fa-3x"></i><br>
                            <p class="fs-4 text-center">
                                Total Appointments <br><%= dao.countAppointmentByDocotrId(d.getId()) %>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        <%
        }
        %>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="../addSpecialist" method="post">
                        <div class="form-group">
                            <label>Enter Specialist Name</label>
                            <input type="text" name="specName" class="form-control">
                        </div>
                        <div class="text-center mt-3">
                            <button type="submit" class="btn btn-primary">Add</button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../component/footer.jsp"%>
</body>
</html>
