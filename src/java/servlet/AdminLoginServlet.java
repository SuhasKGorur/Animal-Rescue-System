package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");

        if(username.equals("admin")
                && password.equals("admin123"))
        {
            HttpSession session =
                    request.getSession();

            session.setAttribute(
                    "admin",
                    "true");

            response.sendRedirect(
                    "AdminDashboardServlet");
        }
        else
        {
            response.getWriter().println("<h2>Invalid Admin Credentials</h2>");
        }
    }
}