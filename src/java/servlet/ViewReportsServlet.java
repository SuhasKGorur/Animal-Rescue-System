package servlet;

import model.Report;
import java.util.ArrayList;

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

 //* @author suhas

@WebServlet("/ViewReportsServlet")
public class ViewReportsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("admin") == null)
        {
            response.sendRedirect(
                    "adminlogin.html");

            return;
        }
        try {

            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM reports";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();
            
            ArrayList<Report> reportList =new ArrayList<>();
            
            while(rs.next()) {

                Report report = new Report();

                report.setReportId(rs.getInt("report_id"));

                report.setAnimalType(rs.getString("animal_type"));

                report.setLocation(rs.getString("location"));

                report.setStatus(rs.getString("status"));

                report.setUrgencyLevel(rs.getString("urgency_level"));

                reportList.add(report);
            }
            request.setAttribute("reportList",reportList);
            request.getRequestDispatcher("viewreports.jsp").forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

        }
    }
}


/*
 * MVC:
 * Model = Data, View = JSP, Controller = Servlet.
 */

/*
 * ArrayList<Report>:
 * Dynamic list used to store multiple Report objects.
 */

/*
 * setAttribute():
 * Stores data inside request for JSP access.
 */

/*
 * getRequestDispatcher():
 * Finds the target JSP or servlet.
 */

/*
 * forward():
 * Transfers request and response to another resource.
 */