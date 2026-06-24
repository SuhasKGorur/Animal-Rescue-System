package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import db.DBConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement; //to create SQL command object

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request,
                     HttpServletResponse response)
        throws ServletException, IOException {

    response.setContentType("text/html");

    PrintWriter out = response.getWriter();

    out.println("<h1>RegisterServlet is working!</h1>");
    out.println("<p>Please submit the form using POST.</p>");
    }
    
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Get data from form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pswd = request.getParameter("password");
        
        //insert to database
        try{
            Connection con = DBConnection.getConnection();
            //check if user exists            
            PreparedStatement ps2 = con.prepareStatement
            ("SELECT * FROM users WHERE email=?");

            ps2.setString(1,email);

            ResultSet rs = ps2.executeQuery();

            if(rs.next())
            {
                response.sendRedirect(
                        "login.html?msg=exists");

                return;
            }
            
            //new user
            String query = "insert into users(name,email,password)"
                    + "values(?,?,?)";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1,name);
            ps.setString(2,email);
            ps.setString(3,pswd);
            
            int rows=ps.executeUpdate(); 
        
            // Send response to browser
            response.setContentType("text/html");

            PrintWriter out = response.getWriter();
                 
            if(rows > 0){
                response.sendRedirect("login.html?msg=registered");
            }
            else{
                response.sendRedirect("login.html?msg=failed");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}

