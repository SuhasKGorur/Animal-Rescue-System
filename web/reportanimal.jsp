<%
String user = (String) session.getAttribute("user");

if(user == null)
{
    response.sendRedirect("login.html");
    return;
}
%>

<!DOCTYPE html>

<html>

<head>

<title>Report Animal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>

body{

    background:#f8fafc;

    font-family:'Segoe UI',sans-serif;

    color:#1f2937;
}

/* NAVBAR */

.navbar{

    background:white;

    border-bottom:1px solid #e5e7eb;

    padding:15px 0;
}

.navbar-brand{

    font-size:24px;

    font-weight:600;

    color:#198754 !important;
}

.logo{

    width:45px;

    height:45px;

    object-fit:contain;
}

/* PAGE HEADER */

.page-header{

    margin-top:40px;

    margin-bottom:35px;
}

.page-header h2{

    font-weight:700;
}

.page-header p{

    color:#6b7280;

    margin-top:10px;
}

/* CARDS */

.form-card,
.info-card{

    border:none;

    border-radius:18px;

    background:white;

    box-shadow:0 8px 25px rgba(0,0,0,.08);
}

.form-card{

    padding:35px;
}

.info-card{

    padding:30px;

    position:sticky;

    top:30px;
}

.info-card h5{

    font-weight:600;

    margin-bottom:20px;
}

.tip{

    display:flex;

    align-items:flex-start;

    margin-bottom:18px;
}

.tip i{

    color:#198754;

    font-size:20px;

    margin-right:12px;

    margin-top:2px;
}

.form-control,
.form-select{

    border-radius:10px;
}

.btn-submit{

    border-radius:10px;

    padding:12px;

    font-weight:600;
}

footer{

    margin-top:70px;

    background:white;

    border-top:1px solid #e5e7eb;

    padding:35px;
}

</style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar">

<div class="container">

<a class="navbar-brand d-flex align-items-center"
href="#">

<img src="images/logo.png"
class="logo me-3">

Animal Rescue Portal

</a>

<div>

<a href="UserReportsServlet"
class="btn btn-outline-success me-2">

<i class="bi bi-list-check"></i>

My Reports

</a>

<a href="UserLogoutServlet"
class="btn btn-outline-danger">

<i class="bi bi-box-arrow-right"></i>

Logout

</a>

</div>

</div>

</nav>

<div class="container">

<div class="page-header">

<h2>

Report an Animal

</h2>

<p>

Submit rescue information to help nearby rescue teams respond quickly.

</p>

</div>

<%

String msg =
request.getParameter("msg");

if("failed".equals(msg))
{

%>

<div class="alert alert-danger">

Failed to submit report.
Please try again.

</div>

<%

}

%>

<div class="row g-4">

<!-- REPORT FORM -->

<div class="col-lg-8">

<div class="card form-card">

<h3 class="mb-4">

New Rescue Report

</h3>

<form action="ReportServlet"
method="post">

<div class="mb-3">

<label class="form-label">

Animal Type

</label>

<select
name="animal_type"
class="form-select"
required>

<option>Dog</option>

<option>Cat</option>

<option>Bird</option>

<option>Cow</option>

<option>Other</option>

</select>

</div>

<div class="mb-3">

<label class="form-label">

Location

</label>

<input
type="text"
name="location"
class="form-control"
required>

</div>

<div class="mb-3">

<label class="form-label">

Description

</label>

<textarea
name="description"
class="form-control"
rows="5"></textarea>

</div>

<div class="mb-3">

<label class="form-label">

Reporter Name

</label>

<input
type="text"
name="reporter_name"
class="form-control"
required>

</div>

<div class="mb-3">

<label class="form-label">

Contact Number

</label>

<input
type="text"
name="contact_number"
class="form-control"
required>

</div>

<div class="mb-4">

<label class="form-label">

Urgency Level

</label>

<select
name="urgency_level"
class="form-select">

<option>Low</option>

<option>Medium</option>

<option>High</option>

</select>

</div>

<button
type="submit"
class="btn btn-success btn-submit w-100">

Submit Rescue Report

</button>

</form>

</div>

</div>
<!-- RESCUE GUIDELINES -->

<div class="col-lg-4">

<div class="card info-card">

<h5>

<i class="bi bi-shield-check text-success me-2"></i>

Rescue Guidelines

</h5>

<div class="tip">

<i class="bi bi-check-circle-fill"></i>

<div>

<strong>Ensure Safety</strong>

<p class="text-muted mb-0">

Avoid approaching aggressive or frightened animals directly.

</p>

</div>

</div>

<div class="tip">

<i class="bi bi-geo-alt-fill"></i>

<div>

<strong>Provide Accurate Location</strong>

<p class="text-muted mb-0">

Include nearby landmarks to help rescuers locate the animal quickly.

</p>

</div>

</div>

<div class="tip">

<i class="bi bi-camera-fill"></i>

<div>

<strong>Describe the Situation</strong>

<p class="text-muted mb-0">

Mention visible injuries, behaviour and surroundings.

</p>

</div>

</div>

<div class="tip">

<i class="bi bi-telephone-fill"></i>

<div>

<strong>Keep Your Phone Available</strong>

<p class="text-muted mb-0">

Our rescue team may contact you for additional details.

</p>

</div>

</div>

<hr>

<h6 class="mb-3">

Current Workflow

</h6>

<div class="d-flex justify-content-between mb-3">

<span>

Report Submitted

</span>

<span class="badge bg-success">

Done

</span>

</div>

<div class="d-flex justify-content-between mb-3">

<span>

Admin Review

</span>

<span class="badge bg-warning text-dark">

Pending

</span>

</div>

<div class="d-flex justify-content-between">

<span>

Rescue Operation

</span>

<span class="badge bg-secondary">

Upcoming

</span>

</div>

</div>

</div>

</div>

</div>

<!-- FOOTER -->

<footer>

<div class="container">

<div class="row align-items-center">

<div class="col-md-6">

<h5 class="fw-semibold">

Animal Rescue Management System

</h5>

<p class="text-muted mb-0">

Helping rescue and protect animals through technology.

</p>

</div>

<div class="col-md-6 text-md-end mt-3 mt-md-0">

<span class="badge bg-success">

<i class="bi bi-check-circle-fill me-1"></i>

System Online

</span>

<p class="text-muted mt-2 mb-0">

© 2026 Animal Rescue Portal

</p>

</div>

</div>

</div>

</footer>

</body>

</html>