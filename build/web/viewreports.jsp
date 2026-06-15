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

<!-- NAVBAR -->

<nav class="navbar navbar-dark bg-success">

<div class="container">

<a class="navbar-brand"
href="admindashboard.jsp">

Animal Rescue Admin Portal

</a>

<div>

<a href="admindashboard.jsp"
class="btn btn-light me-2">

Dashboard

</a>

<a href="LogoutServlet"
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
<th>Update Status</th>
<th>Delete</th>

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

<td>

<form action="UpdateStatusServlet"
      method="post">

<input type="hidden"
    name="report_id"
    value="<%= report.getReportId() %>">

<select name="status"
     class="form-select form-select-sm">

<option>Pending</option>
<option>Assigned</option>
<option>Rescued</option>

</select>

<button type="submit"
     class="btn btn-primary btn-sm mt-2 w-100">

Update

</button>

</form>

</td>

<td>

<a href="DeleteReportServlet?id=<%= report.getReportId() %>"
class="btn btn-danger btn-sm"

onclick="return confirm(
'Are you sure you want to delete this report?')">

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
