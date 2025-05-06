package controller;

import model.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();
            UserDAO dao = new UserDAO(con);
            User user = dao.login(email, password);

            if (user != null) {
                HttpSession session = req.getSession();
                session.setAttribute("user", user);

                Cookie roleCookie = new Cookie("userRole", user.getRole());
                roleCookie.setMaxAge(30 * 60); // 30 mins
                res.addCookie(roleCookie);

                if (user.getRole().equals("admin")) {
                    res.sendRedirect("View/adminDashboard.jsp");
                } else {
                    res.sendRedirect("View/userDashboard.jsp");
                }
            } else {
                res.sendRedirect("View/login.jsp?error=Invalid credentials");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}