# 🐾 Animal Rescue Management System

## Overview

The Animal Rescue Management System is a web-based application developed to help citizens report injured, abandoned, or endangered animals and enable rescue organizations to manage rescue operations efficiently.

The system provides separate portals for users and administrators. Users can submit animal rescue reports, while administrators can view reports, update rescue status, and manage rescue cases through a centralized dashboard.

This project was developed as part of my MCA coursework to demonstrate concepts such as Java Servlets, JSP, JDBC, MySQL, Session Management, MVC Architecture, and Bootstrap-based responsive web design.

---

## Features

### User Module

* User Registration
* User Login Authentication
* Session Management
* User Dashboard
* Report Animal Rescue Cases
* Logout Functionality

### Admin Module

* Admin Login Authentication
* Admin Dashboard
* View Rescue Reports
* Update Rescue Status
* Delete Rescue Reports
* Dashboard Statistics
* Logout Functionality

### Report Management

* Create Reports
* View Reports
* Update Status
* Delete Reports

---

## Technologies Used

### Frontend

* HTML5
* CSS3
* Bootstrap 5
* JSP

### Backend

* Java
* Java Servlets
* JDBC

### Database

* MySQL

### Development Tools

* Apache NetBeans IDE
* Apache Tomcat Server
* MySQL Workbench

---

## Project Structure

AnimalRescueJava

├── Web Pages

│ ├── index.html

│ ├── register.html

│ ├── login.html

│ ├── adminlogin.html

│ ├── userdashboard.jsp

│ ├── reportanimal.jsp

│ ├── admindashboard.jsp

│ └── viewreports.jsp

│

├── src

│ ├── servlet

│ ├── model

│ └── db

│

└── Database

---

## Database Tables

### Users Table

| Column   | Type    |
| -------- | ------- |
| id       | INT     |
| name     | VARCHAR |
| email    | VARCHAR |
| password | VARCHAR |

### Reports Table

| Column         | Type    |
| -------------- | ------- |
| report_id      | INT     |
| animal_type    | VARCHAR |
| location       | VARCHAR |
| description    | TEXT    |
| reporter_name  | VARCHAR |
| contact_number | VARCHAR |
| urgency_level  | VARCHAR |
| status         | VARCHAR |

---

## System Workflow

### User Side

Home Page

↓

Register/Login

↓

User Dashboard

↓

Report Animal

↓

Report Saved To Database

### Admin Side

Admin Login

↓

Admin Dashboard

↓

View Reports

↓

Update Status / Delete Report

↓

Database Updated

---

## Concepts Implemented

* JDBC Connectivity
* Prepared Statements
* Session Management
* Request Dispatcher
* JSP Scripting Elements
* MVC Architecture
* CRUD Operations
* Bootstrap Responsive Design

---

## Future Enhancements

* Animal Image Upload
* Search and Filter Reports
* Email Notifications
* Rescue Team Assignment
* GPS-Based Location Tracking
* Volunteer Management Module

---

## Learning Outcomes

Through this project, I gained practical experience in:

* Java Web Development
* Database Connectivity using JDBC
* JSP and Servlets
* Session Handling
* MVC Architecture
* CRUD Application Development
* Responsive UI Design using Bootstrap

---

## Author

Suhas

Master of Computer Applications (MCA)

---

## License

This project is developed for educational and academic purposes.
