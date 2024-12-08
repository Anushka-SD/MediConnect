<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MediConnect</title>
<%@include file="component/allcss.jsp"%>
<link rel="icon" type="image/png" href="images/logo.png">
<style>
.section-heading {
	text-align: center;
	margin-bottom: 30px; /* Adjust the space below the heading */
}

.image-container {
	position: relative;
	width: 100%;
	height: 200px;
}

.image-container img {
	position: absolute;
	top: 0;
	right: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.section-heading {
	text-align: center;
	margin-bottom: 30px;
}

.team-card {
	text-align: center;
	border: 1px solid #ddd;
	padding: 15px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.team-card img {
	width: 100%;
	height: auto;
	border-radius: 8px;
}

.team-member-name {
	font-weight: bold;
	margin-top: 10px;
}

.team-member-title {
	color: gray;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<%
	Connection conn = DBConnect.getConn();
	out.print(conn);
	%>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="images/img1.jpg" class="d-block w-100" alt="..."
					height="600px">
			</div>
			<div class="carousel-item">
				<img src="images/img2.jpg" class="d-block w-100" alt="..."
					height="600px">
			</div>
			<div class="carousel-item">
				<img src="images/img3.jpg" class="d-block w-100" alt="..."
					height="600px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<!-- Next Section -->

	<div class="container mt-5">
		<!-- Centered heading with spacing below -->
		<h2 class="section-heading">Key Features of E Health Care System</h2>
		<div class="row">
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-6">
						<div class="card mb-4">
							<div class="card-body">
								<h5 class="card-title">100% Safety</h5>
								<p class="card-text">We prioritize patient safety by
									adhering to the highest medical standards and protocols in all
									our procedures.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card mb-4">
							<div class="card-body">
								<h5 class="card-title">Clean Environment</h5>
								<p class="card-text">Our facilities are maintained to ensure
									cleanliness and hygiene, fostering a healthy healing
									environment for everyone.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card mb-4">
							<div class="card-body">
								<h5 class="card-title">Friendly Doctors</h5>
								<p class="card-text">Our team of compassionate and
									approachable doctors ensures personalized care for every
									patient.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
                    <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="card-title">Medical Research</h5>
                            <p class="card-text">We invest in medical research to bring cutting-edge treatments and innovations to our patients.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
			<div class="col-md-4">
				<div class="image-container">
					<img src="images/doctor.jpg" alt="Image description">
				</div>
			</div>
		</div>
	</div>

	<!--  Next Page -->
	<div class="container mt-5">
		<h2 class="section-heading">Our Team</h2>
		<div class="row">
			<!-- First Row of 4 Doctors -->
			<div class="col-md-3">
				<div class="team-card">
					<img src="images/doctor2.jpg" alt="Doctor 1">
					<h5 class="team-member-name">Samuni Simi</h5>
					<p class="team-member-title">(CEO & Chairman)</p>
					<p>Expert in hospital management with over 20 years of
						experience leading healthcare innovations globally.</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="team-card">
					<img src="images/doctor3.jpg" alt="Doctor 2">
					<h5 class="team-member-name">Dr. Siva Kumar</h5>
					<p class="team-member-title">(Chief Doctor)</p>
					<p>Renowned cardiologist, recipient of the National Medical
						Excellence Award for groundbreaking research in heart health.</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="team-card">
					<img src="images/doctor4.jpg" alt="Doctor 3">
					<h5 class="team-member-name">Dr. Niuise Paule</h5>
					<p class="team-member-title">(Chief Doctor)</p>
					<p>Pediatric specialist with a passion for improving children's
						health in underprivileged areas worldwide.</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="team-card">
					<img src="images/doctor2.jpg" alt="Doctor 4">
					<h5 class="team-member-name">Dr. Mathue Samuel</h5>
					<p class="team-member-title">(Chief Doctor)</p>
					<p>Award-winning neurologist, known for innovative approaches
						to treating rare neurological disorders.</p>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<!-- Second Row of 4 Doctors -->
			<div class="col-md-3">
				<div class="team-card">
					<img src="images/doctor3.jpg" alt="Doctor 5">
					<h5 class="team-member-name">Dr. Aisha Khan</h5>
					<p class="team-member-title">(Senior Doctor)</p>
					<p>Dermatologist with expertise in treating chronic skin
						conditions and developing new cosmetic treatments.</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="team-card">
					<img src="images/doctor4.jpg" alt="Doctor 6">
					<h5 class="team-member-name">Dr. Ravi Mehta</h5>
					<p class="team-member-title">(Senior Doctor)</p>
					<p>Orthopedic surgeon specializing in sports injuries, with a
						history of working with professional athletes.</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="team-card">
					<img src="images/doctor2.jpg" alt="Doctor 7">
					<h5 class="team-member-name">Dr. Sunita Gupta</h5>
					<p class="team-member-title">(Junior Doctor)</p>
					<p>General physician with a focus on preventive medicine and
						patient education for healthier lifestyles.</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="team-card">
					<img src="images/doctor3.jpg" alt="Doctor 8">
					<h5 class="team-member-name">Dr. Arjun Singh</h5>
					<p class="team-member-title">(Junior Doctor)</p>
					<p>Young and dynamic oncologist committed to research and
						developing new cancer treatment protocols.</p>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<%@include file="component/footer.jsp"%>
</body>
</html>
</body>
</html>