<%@page import="java.util.ArrayList"%>
<%@page import="model.Report"%>

<%
ArrayList<Report> reportList =
(ArrayList<Report>)request.getAttribute("reportList");
%>

<!DOCTYPE html>

<html>

<head>

<title>My Rescue Reports</title>

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

    color:#198754 !important;

    font-size:24px;

    font-weight:600;
}

.logo{

    width:45px;

    height:45px;

    object-fit:contain;
}

/* PAGE HEADER */

.page-header{

    margin-top:40px;

    margin-bottom:30px;
}

.page-header h2{

    font-weight:700;
}

.page-header p{

    color:#6b7280;
}

/* REPORT CARD */

.report-card{

    background:white;

    border:none;

    border-radius:18px;

    box-shadow:0 8px 25px rgba(0,0,0,.08);

    overflow:hidden;
}

.table{

    margin-bottom:0;
}

.table thead{

    background:#f9fafb;
}

.table th{

    border:none;

    color:#374151;

    font-weight:600;

    padding:18px;
}

.table td{

    padding:18px;

    vertical-align:middle;

    border-color:#f1f5f9;
}

.badge{

    border-radius:30px;

    padding:8px 14px;

    font-size:13px;
}

.btn{

    border-radius:10px;
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

<%

String msg =
request.getParameter("msg");

if("success".equals(msg))
{

%>

<div class="container mt-3">

<div class="alert alert-success alert-dismissible fade show">

<i class="bi bi-check-circle-fill me-2"></i>

Report submitted successfully.

<button
type="button"
class="btn-close"
data-bs-dismiss="alert">

</button>

</div>

</div>

<%

}

%>

<!-- NAVBAR -->

<nav class="navbar">

<div class="container">

<a class="navbar-brand d-flex align-items-center"
href="reportanimal.jsp">

<img src="images/logo.png"
class="logo me-3">

Animal Rescue Portal

</a>

<div>

<a href="reportanimal.jsp"
class="btn btn-outline-success me-2">

<i class="bi bi-house-door"></i>

Dashboard

</a>

<a href="UserLogoutServlet"
class="btn btn-outline-danger">

<i class="bi bi-box-arrow-right"></i>

Logout

</a>

</div>

</div>

</nav>

<!-- PAGE HEADER -->

<div class="container">

<div class="page-header">

<h2>

My Rescue Reports

</h2>

<p>

Track the status of all rescue requests submitted by you.

</p>

</div>

<div class="card report-card">

<div class="card-body p-0">

<table class="table table-hover align-middle">

<thead>

<tr>

<th>ID</th>

<th>Animal</th>

<th>Location</th>

<th>Status</th>

<th>Urgency</th>

</tr>

</thead>

<tbody>

<%

for(Report report : reportList)
{

%>

<tr>

<td>

<strong>

#<%= report.getReportId() %>

</strong>

</td>

<td>

<%= report.getAnimalType() %>

</td>

<td>

<%= report.getLocation() %>

</td>

<td>

<%

String status =
report.getStatus();

if(status.equals("Pending"))
{

%>

<span class="badge bg-warning text-dark">

Pending

</span>

<%

}

else if(status.equals("Assigned"))
{

%>

<span class="badge bg-primary">

Assigned

</span>

<%

}

else

{

%>

<span class="badge bg-success">

Rescued

</span>

<%

}

%>

</td>

<td>

<%

String urgency =
report.getUrgencyLevel();

if(urgency.equals("High"))
{

%>

<span class="badge bg-danger">

High

</span>

<%

}

else if(urgency.equals("Medium"))
{

%>

<span class="badge bg-warning text-dark">

Medium

</span>

<%

}

else

{

%>

<span class="badge bg-success">

Low

</span>

<%

}

%>

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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>