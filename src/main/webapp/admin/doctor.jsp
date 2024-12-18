<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"> 
<title>Add Doctor</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

<script>
function validateForm() {
    const phoneInput = document.getElementById('mobno').value;
    const dobInput = document.getElementById('dob').value;

    // Validate phone number
    if (!/^\d{10}$/.test(phoneInput)) {
        alert("Mobile number must be exactly 10 digits and contain only numbers.");
        return false; // Prevent form submission
    }

    // Validate age (DOB should correspond to age > 23 years)
    if (!validateAge(dobInput)) {
        alert("Doctor's age must be greater than 23 years.");
        return false; // Prevent form submission
    }

    return true; // Allow form submission if all validations pass
}

function validatePhoneNumber(input) {
    input.value = input.value.replace(/\D/g, ''); // Remove all non-numeric characters
}

function validateAge(dob) {
    if (!dob) return false; // Ensure a date is entered

    const today = new Date();
    const birthDate = new Date(dob);
    const age = today.getFullYear() - birthDate.getFullYear();
    const monthDiff = today.getMonth() - birthDate.getMonth();

    // Adjust age if the current month/day is before the birth month/day
    if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDate.getDate())) {
        return age - 1 > 23;
    }
    return age > 23;
}
</script>


</head>
<body>
	<%@include file="admin_navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">

			<!-- Add Doctor Form -->
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<form action="../addDoctor" method="post" onsubmit="return validateForm()">
							<div class="mb-3">
								<label class="form-label">Full Name</label> 
								<input type="text" required name="fullname" class="form-control">
							</div>

							<div class="mb-3">
    <label class="form-label">DOB</label> 
    <input type="date" required name="dob" id="dob" class="form-control">
</div>


							<div class="mb-3">
								<label class="form-label">Qualification</label> 
								<input required name="qualification" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> 
								<select name="spec" required class="form-control">
									<option>--select--</option>
									<%
									SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
									List<Specalist> list = dao.getAllSpecialist();
									for (Specalist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> 
								<input type="text" required name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> 
								<input type="text" required name="mobno" id="mobno" class="form-control" maxlength="10" oninput="validatePhoneNumber(this)">
								<small id="mobnoError" class="text-danger"></small>
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> 
								<input required name="password" type="password" class="form-control">
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>

			<!-- Doctor Details -->
			<div class="col-md-8">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Doctor Details</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
								List<Doctor> list2 = dao2.getAllDoctor();
								for (Doctor d : list2) {
								%>
								<tr>
									<td><%= d.getFullName() %></td>
									<td><%= d.getDob() %></td>
									<td><%= d.getQualification() %></td>
									<td><%= d.getSpecialist() %></td>
									<td><%= d.getEmail() %></td>
									<td><%= d.getMobNo() %></td>
									<td>
										<a href="edit_doctor.jsp?id=<%=d.getId()%>" class="btn btn-sm btn-primary">Edit</a>
										<a href="#" class="btn btn-sm btn-danger">Delete</a>
									</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	<%@include file="../component/footer.jsp"%>
</body>
</html>
