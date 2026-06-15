<%
String user =
        (String) session.getAttribute(
                "user");

if(user == null)
{
    response.sendRedirect(
            "login.html");

    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<title>User Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>

body{

    background:#f4f6f9;
}

.hero{

    background:linear-gradient(
            135deg,
            #198754,
            #20c997);

    color:white;

    padding:60px;

    border-radius:20px;

    margin-top:30px;
}

.dashboard-card{

    border:none;

    border-radius:20px;

    box-shadow:0 4px 15px rgba(0,0,0,0.15);

    transition:0.3s;
}

.dashboard-card:hover{

    transform:translateY(-5px);
}

</style>

</head>

<body>

<nav class="navbar navbar-dark bg-success">

<div class="container">

<a class="navbar-brand"
   href="#">

Animal Rescue Portal

</a>

<a href="UserLogoutServlet"
   class="btn btn-light">

Logout

</a>

</div>

</nav>
<%
    String msg = request.getParameter("msg");
    
    if("success".equals(msg)){
    %>
    <div class ="alert alert-success tex-center">
        Report Submitted Successfully!
    </div>
<%
}%>

<div class="container">

<div class="hero text-center">

<h1>

Welcome to Animal Rescue Portal

</h1>

<p class="lead">

Helping animals starts with one report.

</p>

</div>

<div class="row mt-5">

<div class="col-md-8 mx-auto">

<div class="card dashboard-card">

<div class="card-body text-center p-5">

<h2>

Report Injured Animal

</h2>

<p>

Submit details about injured,
abandoned, or endangered animals
to help rescue teams respond quickly.

</p>

<a href="reportanimal.jsp"
   class="btn btn-success btn-lg">

Report Animal

</a>

</div>

</div>

</div>

</div>

</div>

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