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

@WebServlet("/DeleteReportServlet")
public class DeleteReportServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
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
                request.getParameter("id");

        try {

            Connection con =
                    DBConnection.getConnection();

            String query =
                "DELETE FROM reports "
              + "WHERE report_id=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(1,Integer.parseInt(reportId));

            ps.executeUpdate();

            response.sendRedirect(
                    "ViewReportsServlet");

        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}