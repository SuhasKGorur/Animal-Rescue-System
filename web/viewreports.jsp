<%@page import="java.util.ArrayList"%>
<%@page import="model.Report"%>

<%
ArrayList<Report> reportList =
(ArrayList<Report>)request.getAttribute("reportList");
%>

<!DOCTYPE html>

<html>

<head>

<title>Manage Rescue Reports</title>

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

/* TABLE CARD */

.table-card{

    background:white;

    border-radius:18px;

    overflow:hidden;

    box-shadow:0 8px 25px rgba(0,0,0,.08);
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

    padding:18px;

    font-weight:600;
}

.table td{

    padding:18px;

    vertical-align:middle;

    border-color:#f1f5f9;
}

/* STATUS BADGES */

.badge{

    border-radius:30px;

    padding:8px 14px;

    font-size:13px;
}

.btn{

    border-radius:10px;
}

.form-select{

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

<!-- NAVBAR -->

<nav class="navbar">

<div class="container">

<a class="navbar-brand d-flex align-items-center"
href="AdminDashboardServlet">

<img src="images/logo.png"
class="logo me-3">

Animal Rescue Portal

</a>

<div>

<a href="AdminDashboardServlet"
class="btn btn-outline-success me-2">

<i class="bi bi-speedometer2"></i>

Dashboard

</a>

<a href="LogoutServlet"
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

Manage Rescue Reports

</h2>

<p>

Review, update and monitor all rescue requests submitted by users.

</p>

</div>

<!-- TABLE -->

<div class="table-card">

<table class="table table-hover align-middle">

<thead>

<tr>

<th>ID</th>

<th>Animal</th>

<th>Location</th>

<th>Status</th>

<th>Urgency</th>

<th width="220">

Update Status

</th>

<th>

Delete

</th>

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

<td>

<form action="UpdateStatusServlet"
method="post">

<input type="hidden"
name="report_id"
value="<%= report.getReportId() %>">

<select
name="status"
class="form-select form-select-sm">

<option>Pending</option>

<option>Assigned</option>

<option>Rescued</option>

</select>

<button
type="submit"
class="btn btn-success btn-sm w-100 mt-2">

Update Status

</button>

</form>

</td>

<td>

<a
href="DeleteReportServlet?id=<%= report.getReportId() %>"
class="btn btn-outline-danger btn-sm"

onclick="return confirm('Delete this report?')">

Delete

</a>

</td>

</tr>

<%
}
%>

</tbody>

</table>

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