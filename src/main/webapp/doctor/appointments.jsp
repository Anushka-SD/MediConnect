<%@page import="java.util.List"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointments</title>
<%@include file="../component/allcss.jsp"%>
<style>
    .paint-card {
        box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
    }
</style>
</head>
<body>
    <%@include file="navbar.jsp"%>
    <div class="container mt-4">
        <div class="col-md-12">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="fs-3 text-center">Patient Details</p>
                    
                    <!-- Search and Filter Options -->
                    <form method="get" action="appointments.jsp" class="mb-3">
                        <div class="input-group">
                            <input type="text" name="search" class="form-control" placeholder="Search by Patient Name" value="<%= request.getParameter("search") %>">
                            <button class="btn btn-primary" type="submit">Search</button>
                            <a href="appointments.jsp?filter=pending" class="btn btn-warning ms-2">Show Pending</a>
                        </div>
                    </form>
                    
                    <!-- Appointments Table -->
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Full Name</th>
                                <th>Gender</th>
                                <th>Age</th>
                                <th>Appointment Date</th>
                                <th>Email</th>
                                <th>Mobile Number</th>
                                <th>Diseases</th>
                                <th>Doctor Name</th>
                                <th>Address</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
                            DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
                            String search = request.getParameter("search");
                            String filter = request.getParameter("filter");
                            List<Appointment> list;

                            // Filter and Search Logic
                            if (filter != null && filter.equals("pending")) {
                                list = dao.getPendingAppointments();
                            } else if (search != null && !search.trim().isEmpty()) {
                                list = dao.searchAppointmentsByPatientName(search);
                            } else {
                                list = dao.getAllAppointment();
                            }

                            // Display appointments
                            for (Appointment ap : list) {
                                Doctor d = dao2.getDoctorById(ap.getDoctorId());
                            %>
                            <tr>
                                <td><%= ap.getFullName() %></td>
                                <td><%= ap.getGender() %></td>
                                <td><%= ap.getAge() %></td>
                                <td><%= ap.getAppoinDate() %></td>
                                <td><%= ap.getEmail() %></td>
                                <td><%= ap.getPhNo() %></td>
                                <td><%= ap.getDiseases() %></td>
                                <td><%= d != null ? d.getFullName() : "Unknown" %></td>
                                <td><%= ap.getAddress() %></td>
                                <td><%= ap.getStatus() %></td>
                                <td><a href="comment.jsp?id=<%= ap.getId() %>" class="btn btn-success btn-sm">Comment</a></td>
                            </tr>
                            <%
                            }
                            %>
                        </tbody>
                    </table>
                    
                    <% if (list.isEmpty()) { %>
                    <p class="text-center text-muted">No appointments found.</p>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../component/footer.jsp"%>
</body>
</html>
