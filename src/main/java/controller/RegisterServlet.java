package controller;

import model.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = PasswordUtil.hashPassword(req.getParameter("password"));
        String role = req.getParameter("role");

        try {
            Connection con = DBConnection.getConnection();
            User user = new User(name, email, password, role);
            UserDAO dao = new UserDAO(con);

            if (dao.registerUser(user)) {
                res.sendRedirect("View/login.jsp?success=Registered Successfully");
            } else {
                res.sendRedirect("View/register.jsp?error=Error Occurred");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}