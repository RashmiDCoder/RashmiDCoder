package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import java.io.IOException;


@WebFilter("/*")
public class AuthFilter implements Filter {
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        String uri = request.getRequestURI();

        boolean loggedIn = (session != null && session.getAttribute("user") != null);

        if (uri.contains("View/adminDashboard.jsp")) {
            if (loggedIn && ((model.User)session.getAttribute("user")).getRole().equals("admin")) {
                chain.doFilter(req, res);
            } else {
                response.sendRedirect(request.getContextPath() + "/View/error.jsp?error=Unauthorized Access — Admins Only");
            }
        } else if (uri.contains("View/userDashboard.jsp")) {
            if (loggedIn) {
                chain.doFilter(req, res);
            } else {
                response.sendRedirect(request.getContextPath() + "/View/error.jsp?error=You must be logged in to access this page.");
            }
        } else {
            chain.doFilter(req, res);
        }
    }
}