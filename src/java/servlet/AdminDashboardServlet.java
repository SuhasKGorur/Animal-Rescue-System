package servlet;

import db.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if(session == null ||
           session.getAttribute("admin") == null)
        {
            response.sendRedirect(
                    "adminlogin.html");

            return;
        }

        try{

            Connection con =
                    DBConnection.getConnection();

            int total = 0;
            int pending = 0;
            int assigned = 0;
            int rescued = 0;

            PreparedStatement ps;

            ResultSet rs;

            ps = con.prepareStatement(
                    "SELECT COUNT(*) FROM reports");

            rs = ps.executeQuery();

            if(rs.next())
            {
                total = rs.getInt(1);
            }

            ps = con.prepareStatement(
                    "SELECT COUNT(*) FROM reports WHERE status='Pending'");

            rs = ps.executeQuery();

            if(rs.next())
            {
                pending = rs.getInt(1);
            }

            ps = con.prepareStatement(
                    "SELECT COUNT(*) FROM reports WHERE status='Assigned'");

            rs = ps.executeQuery();

            if(rs.next())
            {
                assigned = rs.getInt(1);
            }

            ps = con.prepareStatement(
                    "SELECT COUNT(*) FROM reports WHERE status='Rescued'");

            rs = ps.executeQuery();

            if(rs.next())
            {
                rescued = rs.getInt(1);
            }

            request.setAttribute(
                    "total", total);

            request.setAttribute(
                    "pending", pending);

            request.setAttribute(
                    "assigned", assigned);

            request.setAttribute(
                    "rescued", rescued);

            request.getRequestDispatcher(
                    "admindashboard.jsp")
                    .forward(request,response);

        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

    }
}