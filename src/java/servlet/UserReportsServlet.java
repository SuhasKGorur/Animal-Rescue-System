package servlet;

import model.Report;
import db.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UserReportsServlet")
public class UserReportsServlet extends HttpServlet
{
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException,
            IOException
    {

        HttpSession session =
                request.getSession(false);

        if(session == null ||
           session.getAttribute("user") == null)
        {
            response.sendRedirect(
                    "login.html");

            return;
        }

        String email =
        (String)session.getAttribute(
                "user");

        try
        {
            Connection con =
                    DBConnection.getConnection();

            String query =
            "SELECT * FROM reports WHERE user_email=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1,email);

            ResultSet rs =
                    ps.executeQuery();

            ArrayList<Report> reportList =
                    new ArrayList<>();

            while(rs.next())
            {
                Report report =
                        new Report();

                report.setReportId(
                        rs.getInt("report_id"));

                report.setAnimalType(
                        rs.getString("animal_type"));

                report.setLocation(
                        rs.getString("location"));

                report.setStatus(
                        rs.getString("status"));

                report.setUrgencyLevel(
                        rs.getString("urgency_level"));

                reportList.add(report);
            }

            request.setAttribute(
                    "reportList",
                    reportList);

            request.getRequestDispatcher(
                    "userreports.jsp")
                    .forward(
                            request,
                            response);

        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}