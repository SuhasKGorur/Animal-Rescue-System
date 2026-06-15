package servlet;

import db.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateStatusServlet")
public class UpdateStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session =
                request.getSession(false);

        if(session == null
                || session.getAttribute("admin") == null)
        {
            response.sendRedirect(
                    "adminlogin.html");

            return;
        }
        String reportId =
                request.getParameter("report_id");

        String status =
                request.getParameter("status");

        try {

            Connection con =
                    DBConnection.getConnection();

            String query =
                "UPDATE reports "
              + "SET status=? "
              + "WHERE report_id=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, status);

            ps.setInt(2,Integer.parseInt(reportId));

            ps.executeUpdate();

            response.sendRedirect(
                    "ViewReportsServlet");

        }
        catch(Exception e) {

            e.printStackTrace();

        }
    }
}