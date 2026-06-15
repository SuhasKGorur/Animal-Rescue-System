package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import db.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//@author suhas

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        
        System.out.println("Email: " + email);
        System.out.println("Password: " + password);
        
          
        //check from database
        try{
            Connection con = DBConnection.getConnection();
            String query = "select * from users where email =? and password=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1,email);
            ps.setString(2,password);
                        
            ResultSet rs = ps.executeQuery(); 
        
            
            PrintWriter out = response.getWriter();
            
            if(rs.next()){
                HttpSession session = request.getSession();
                session.setAttribute("user",email);
                
                response.sendRedirect(
                    "userdashboard.jsp");

            }
            else{
                out.println("<h1>Login Failed</h1>");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}


/*
 * Browser:
 * Displays web pages and sends user requests to the server.
 */

/*
 * HTML Form:
 * Collects user input and sends it to a servlet.

 * Bootstrap:
 * Provides ready-made CSS classes for modern and responsive UI design.
 
 * Tomcat:
 * Web server that receives requests and runs servlets.
 
 * Servlet:
 * Java class that handles web requests and responses.

 * GET Request:
 * Used to retrieve or display data from the server.
 
 * POST Request:
 * Used to send form data securely to the server.
 
 * request.getParameter():
 * Retrieves a specific form field value from the request.
 
 * JDBC:
 * Java API used to connect and communicate with databases.
 
 * DriverManager:
 * Creates a database connection using URL, username and password.
 
 * Connection:
 * Represents an active link between Java and MySQL.
 
 * DBConnection Class:
 * Centralized utility class for creating database connections.
 
 * try-catch:
 * Handles exceptions and prevents program crashes.

 * PreparedStatement:
 * Represents a precompiled SQL query with placeholders.
 
 * Placeholder (?):
 * Temporary value in SQL replaced using setString() or similar methods.
 
 * setString():
 * Assigns a value to a specific SQL placeholder.
 
 * executeUpdate():
 * Executes INSERT, UPDATE or DELETE queries and returns affected rows.
 
 * executeQuery():
 * Executes a SELECT query and returns a ResultSet.
 
 * ResultSet:
 * Stores data returned by a SELECT query.
 
 * rs.next():
 * Moves to the next row and returns true if data exists.

 * @WebServlet:
 * Maps a URL pattern to a servlet class.
 
 * doGet():
 * Handles HTTP GET requests from the browser.
 
 * doPost():
 * Handles HTTP POST requests from forms.
 
 * Registration Module:
 * Creates a new user account and stores it in the database.
 
 * Login Module:
 * Verifies user credentials using a SELECT query.
 
 * Authentication:
 * Process of validating user identity using credentials.
 
 * Browser → Tomcat → Servlet → JDBC → MySQL:
 * User request travels from the browser to the database and back through these components.
 */

   
   