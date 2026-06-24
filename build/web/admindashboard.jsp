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

```
<title>Admin Dashboard</title>

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

        padding:50px;

        border-radius:20px;

        margin-top:30px;
    }

    .dashboard-card{

        border:none;

        border-radius:20px;

        box-shadow:0 5px 20px rgba(0,0,0,0.15);

        transition:0.3s;
    }

    .dashboard-card:hover{

        transform:translateY(-5px);
    }

</style>
```

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar navbar-dark bg-success">

```
<div class="container">

    <a class="navbar-brand d-flex align-items-center"
   href="#">

<img src="images/logo.png"
     width="40"
     height="40"
     class="me-2">

<span>

Animal Rescue Portal

</span>

</a>

    <a href="LogoutServlet"
       class="btn btn-light">

        Logout

    </a>

</div>
```

</nav>

<!-- MAIN CONTENT -->

<div class="container">

```
<!-- HERO SECTION -->

<div class="hero text-center">

    <h1>

        Admin Dashboard

    </h1>

    <p class="lead">

        Manage rescue reports and coordinate
        animal rescue operations efficiently.

    </p>

</div>

<!-- DASHBOARD CARDS -->

<!-- DASHBOARD CARDS -->
<div class="row mt-5 g-4">

    <!-- Total Reports -->
    <div class="col-md-3">
        <div class="card dashboard-card h-100">
            <div class="card-body text-center">
                <h5>Total Reports</h5>
                <h1><%= total %></h1>
            </div>
        </div>
    </div>

    <!-- Pending -->
    <div class="col-md-3">
        <div class="card dashboard-card h-100">
            <div class="card-body text-center">
                <h5>Pending</h5>
                <h1><%= pending %></h1>
            </div>
        </div>
    </div>

    <!-- Assigned -->
    <div class="col-md-3">
        <div class="card dashboard-card h-100">
            <div class="card-body text-center">
                <h5>Assigned</h5>
                <h1><%= assigned %></h1>
            </div>
        </div>
    </div>

    <!-- Rescued -->
    <div class="col-md-3">
        <div class="card dashboard-card h-100">
            <div class="card-body text-center">
                <h5>Rescued</h5>
                <h1><%= rescued %></h1>
            </div>
        </div>
    </div>

</div>

<!-- MANAGEMENT SECTION -->
<div class="row mt-4">

    <div class="col-md-4">
        <div class="card dashboard-card h-100">
            <div class="card-body text-center p-4">

                <h3>Case Management</h3>

                <p>
                    Update rescue status and manage rescue cases.
                </p>

                <a href="ViewReportsServlet"
                   class="btn btn-primary">
                    Manage Cases
                </a>

            </div>
        </div>
    </div>

    <!-- WELCOME CARD -->
    <div class="col-md-8">
        <div class="card dashboard-card h-100">
            <div class="card-body text-center">

                <h4>
                    Welcome Administrator
                </h4>

                <p>
                    Use this dashboard to monitor rescue reports,
                    update rescue status, and manage animal rescue
                    operations effectively.
                </p>

            </div>
        </div>
    </div>

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
