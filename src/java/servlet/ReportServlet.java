package servlet;

import db.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.PreparedStatement;

// @author suhas

@WebServlet(name = "ReportServlet", urlPatterns = {"/ReportServlet"})
public class ReportServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("DOPOST CALLED");
        //get data from form
        String animal_type = request.getParameter("animal_type");
        String location = request.getParameter("location");
        String description = request.getParameter("description");
        String reporter_name = request.getParameter("reporter_name");
        String contact_number = request.getParameter("contact_number");
        String urgency_level = request.getParameter("urgency_level");
        
        Connection con = null;
        PreparedStatement ps = null;
        try{
            con = DBConnection.getConnection();
            
            HttpSession session =request.getSession(false);
            if(session == null ||session.getAttribute("user") == null)
            {
                response.sendRedirect("login.html");
                return;
            }
            
            String query = "insert into reports(animal_type,location,description,reporter_name,contact_number,urgency_level)"
                    + "values(?,?,?,?,?,?)";
            
            ps = con.prepareStatement(query);
            
            System.out.println("animalType = " + animal_type);
            
            ps.setString(1,animal_type);
            ps.setString(2,location);
            ps.setString(3,description);
            ps.setString(4,reporter_name);
            ps.setString(5,contact_number);
            ps.setString(6,urgency_level);
                        
            int rows=ps.executeUpdate(); 
        
            // Send response to browser
            response.setContentType("text/html");

            PrintWriter out = response.getWriter();
            
            if(rows>0){
                response.sendRedirect(
            "userdashboard.jsp?msg=success");
            }
            else{
                response.sendRedirect(
            "reportanimal.jsp?msg=failed");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        finally {
            try {
                if(ps != null) ps.close();
                if(con != null) con.close();
            } catch(Exception e) {
                e.printStackTrace();
            }
        }
        
    }

}
