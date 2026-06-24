<%@page import="java.util.ArrayList"%>
<%@page import="model.Report"%>

<%
ArrayList<Report> reportList =
(ArrayList<Report>)request.getAttribute("reportList");
%>

<!DOCTYPE html>

<html>

<head>

<title>Animal Rescue Reports</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>

body{
    background:#f4f6f9;
}

.hero{

    background:linear-gradient(
            135deg,
            #14532d,
            #22c55e);

    color:white;

    padding:40px;

    border-radius:20px;

    margin-top:20px;
}

.table-card{

    background:white;

    border-radius:20px;

    padding:20px;

    box-shadow:0 5px 20px rgba(0,0,0,0.15);
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

<div class="alert alert-success">

Report Submitted Successfully!

</div>

</div>

<%
}
%>

<!-- NAVBAR -->

<nav class="navbar navbar-dark bg-success">

<div class="container">

<a class="navbar-brand d-flex align-items-center"
   href="reportanimal.jsp">

<img src="images/logo.png"
     width="40"
     height="40"
     class="me-2">

<span>

Animal Rescue Portal

</span>

</a>

<div>

<a href="reportanimal.jsp"
class="btn btn-light me-2">

Dashboard

</a>

<a href="UserLogoutServlet"
class="btn btn-danger">

Logout

</a>

</div>

</div>

</nav>

<!-- MAIN CONTENT -->

<div class="container">

<!-- HERO SECTION -->

<div class="hero text-center">

<h1>

Animal Rescue Reports

</h1>

<p class="lead">

Monitor, update and manage all rescue requests.

</p>

</div>

<!-- REPORT TABLE -->

<div class="table-card mt-4">

<table class="table table-hover table-bordered align-middle">

<thead class="table-success">

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

<%= report.getReportId() %>

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

<!-- FOOTER -->

<footer class="bg-dark text-white mt-5">
    
<div class="container text-center p-4">

<h5>
Animal Rescue Management System
</h5>

<p>
Helping animals through technology
</p>

<p>
animalrescue@example.com
</p>

<p>
© 2026 All Rights Reserved
</p>

</div>

</footer>

</body>

</html>
