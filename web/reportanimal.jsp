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

```
<title>Report Animal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>

    body{
        background:#f4f6f9;
    }

    .report-card{
        border:none;
        border-radius:20px;
        box-shadow:0 5px 20px rgba(0,0,0,0.15);
    }

    .hero{
        background:linear-gradient(
                135deg,
                #198754,
                #20c997);

        color:white;
        padding:40px;
        border-radius:20px;
        margin-bottom:30px;
    }

</style>
```

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar navbar-dark bg-success">

```
<div class="container">

    <a class="navbar-brand"
       href="userdashboard.jsp">

        Animal Rescue Portal

    </a>

    <a href="UserLogoutServlet"
       class="btn btn-light">

        Logout

    </a>

</div>
```

</nav>

<!-- MAIN CONTENT -->

<div class="container mt-4">

```
<!-- HERO SECTION -->

<div class="hero text-center">

    <h1>

        Report an Animal

    </h1>

    <p>

        Help rescue teams respond quickly
        to animals in need.

    </p>

</div>

<%
String msg = request.getParameter("msg");

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

<!-- REPORT FORM -->

<div class="row">

    <div class="col-md-8 mx-auto">

        <div class="card report-card">

            <div class="card-body p-4">

                <h3 class="text-center mb-4">

                    Animal Rescue Reporting Form

                </h3>

                <form action="ReportServlet"
                      method="post">

                    <div class="mb-3">

                        <label class="form-label">

                            Animal Type

                        </label>

                        <select name="animal_type"
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

                        <input type="text"
                               name="location"
                               class="form-control"
                               required>

                    </div>

                    <div class="mb-3">

                        <label class="form-label">

                            Description

                        </label>

                        <textarea name="description"
                                  class="form-control"
                                  rows="4"></textarea>

                    </div>

                    <div class="mb-3">

                        <label class="form-label">

                            Reporter Name

                        </label>

                        <input type="text"
                               name="reporter_name"
                               class="form-control"
                               required>

                    </div>

                    <div class="mb-3">

                        <label class="form-label">

                            Contact Number

                        </label>

                        <input type="text"
                               name="contact_number"
                               class="form-control"
                               required>

                    </div>

                    <div class="mb-3">

                        <label class="form-label">

                            Urgency Level

                        </label>

                        <select name="urgency_level"
                                class="form-select">

                            <option>Low</option>
                            <option>Medium</option>
                            <option>High</option>

                        </select>

                    </div>

                    <button type="submit"
                            class="btn btn-success w-100">

                        Submit Report

                    </button>

                </form>

            </div>

        </div>

    </div>

</div>
```

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
