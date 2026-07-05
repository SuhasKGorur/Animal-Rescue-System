<%
String admin =
(String) session.getAttribute("admin");

if(admin == null)
{
    response.sendRedirect("adminlogin.html");
    return;
}

int total =
(Integer)request.getAttribute("total");

int pending =
(Integer)request.getAttribute("pending");

int assigned =
(Integer)request.getAttribute("assigned");

int rescued =
(Integer)request.getAttribute("rescued");
%>

<!DOCTYPE html>

<html>

<head>

<title>Admin Dashboard</title>

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

/* ================= NAVBAR ================= */

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

.logout-btn{

    border-radius:10px;

    padding:8px 20px;
}

/* ================= PAGE HEADER ================= */

.page-title{

    margin-top:40px;
}

.page-title h1{

    font-weight:700;

    font-size:40px;
}

.page-title p{

    color:#6b7280;

    font-size:18px;
}

/* ================= DASHBOARD CARDS ================= */

.stats-card{

    border:none;

    border-radius:18px;

    box-shadow:0 8px 25px rgba(0,0,0,0.08);

    transition:.3s;

    height:100%;
}

.stats-card:hover{

    transform:translateY(-4px);
}

.icon-circle{

    width:60px;

    height:60px;

    border-radius:50%;

    background:#e8f5e9;

    color:#198754;

    display:flex;

    align-items:center;

    justify-content:center;

    font-size:26px;

    margin-bottom:20px;
}

.stats-card h6{

    color:#6b7280;

    font-weight:600;

    margin-bottom:10px;
}

.stats-card h2{

    font-size:45px;

    font-weight:700;
}

/* ================= MAIN CARDS ================= */

.main-card{

    border:none;

    border-radius:18px;

    box-shadow:0 8px 25px rgba(0,0,0,.08);
}

.action-btn{

    border-radius:10px;

    padding:12px 28px;
}

footer{

    margin-top:70px;

    background:white;

    border-top:1px solid #e5e7eb;

    padding:35px;
}

.footer-title{

    font-weight:600;
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

<a href="LogoutServlet"
class="btn btn-outline-success logout-btn">

<i class="bi bi-box-arrow-right"></i>

Logout

</a>

</div>

</nav>

<!-- PAGE HEADER -->

<div class="container">

<div class="page-title">

<h1>

Admin Dashboard

</h1>

<p>

Manage rescue reports and monitor rescue activities.

</p>

</div>

<!-- STATISTICS -->

<div class="row mt-4 g-4">

<div class="col-lg-3 col-md-6">

<div class="card stats-card">

<div class="card-body">

<div class="icon-circle">

<i class="bi bi-file-earmark-text"></i>

</div>

<h6>Total Reports</h6>

<h2>

<%= total %>

</h2>

</div>

</div>

</div>

<div class="col-lg-3 col-md-6">

<div class="card stats-card">

<div class="card-body">

<div class="icon-circle">

<i class="bi bi-clock-history"></i>

</div>

<h6>Pending</h6>

<h2>

<%= pending %>

</h2>

</div>

</div>

</div>

<div class="col-lg-3 col-md-6">

<div class="card stats-card">

<div class="card-body">

<div class="icon-circle">

<i class="bi bi-person-check"></i>

</div>

<h6>Assigned</h6>

<h2>

<%= assigned %>

</h2>

</div>

</div>

</div>

<div class="col-lg-3 col-md-6">

<div class="card stats-card">

<div class="card-body">

<div class="icon-circle">

<i class="bi bi-check-circle"></i>

</div>

<h6>Rescued</h6>

<h2>

<%= rescued %>

</h2>

</div>

</div>

</div>

</div>

<!-- SECOND ROW -->

<div class="row mt-5 g-4">

<div class="col-lg-5">

<div class="card main-card h-100">

<div class="card-body p-4">

<div class="icon-circle">

<i class="bi bi-clipboard2-pulse"></i>

</div>

<h3>

Case Management

</h3>

<p class="text-muted">

Review rescue requests, update rescue status,
and manage ongoing rescue operations.

</p>

<a href="ViewReportsServlet"
class="btn btn-success action-btn">

Manage Cases

<i class="bi bi-arrow-right ms-2"></i>

</a>

</div>

</div>

</div>

<div class="col-lg-7">

<div class="card main-card h-100">

<div class="card-body p-5">

<h3 class="mb-3">

Welcome Administrator

</h3>

<p class="text-muted">

Welcome to the Animal Rescue Management System. This dashboard
provides a quick overview of rescue reports submitted by users.
You can monitor rescue activities, assign volunteers, update
case statuses, and manage all rescue operations from one place.

</p>

<hr>

<div class="row text-center mt-4">

<div class="col-md-4">

<h5 class="fw-bold">

<%= total %>

</h5>

<p class="text-muted mb-0">

Total Cases

</p>

</div>

<div class="col-md-4">

<h5 class="fw-bold text-warning">

<%= pending %>

</h5>

<p class="text-muted mb-0">

Pending

</p>

</div>

<div class="col-md-4">

<h5 class="fw-bold text-success">

<%= rescued %>

</h5>

<p class="text-muted mb-0">

Completed

</p>

</div>

</div>

</div>

</div>

</div>

</div>

</div>

<footer>

<div class="container">

<div class="row">

<div class="col-md-6">

<h5 class="footer-title">

Animal Rescue Management System

</h5>

<p class="text-muted">

Helping rescue, protect and care for animals through
technology.

</p>

</div>

<div class="col-md-3">

<h6>

Quick Links

</h6>

<ul class="list-unstyled">

<li>

<a href="ViewReportsServlet"
class="text-decoration-none text-muted">

Manage Reports

</a>

</li>

<li>

<a href="LogoutServlet"
class="text-decoration-none text-muted">

Logout

</a>

</li>

</ul>

</div>

<div class="col-md-3 text-md-end">

<h6>

System Status

</h6>

<span class="badge bg-success">

Online

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