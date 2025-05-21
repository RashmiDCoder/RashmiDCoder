package com.quiz.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {
    "/view/home.jsp",
    "/view/userinfo.jsp",
    "/view/adminpanel.jsp",
    "/view/category.jsp",
    "/view/questions.jsp",
    "/view/result.jsp",
    "/view/aboutus.jsp",
    "/view/rules.jsp",
    "/controller/*"
})
public class AuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String path = req.getRequestURI().substring(req.getContextPath().length());
        
        // Allow access to login and signup pages/servlets without authentication
        if (path.equals("/view/login.jsp") || path.equals("/login") ||
            path.equals("/view/signup.jsp") || path.equals("/signup")) {
            chain.doFilter(request, response);
            return;
        }

        boolean loggedIn = (session != null && session.getAttribute("username") != null);
        String role = (session != null) ? (String) session.getAttribute("role") : null;

        // Check if user is logged in for other protected pages
        if (!loggedIn) {
            res.sendRedirect(req.getContextPath() + "/view/login.jsp?error=Please+login+first");
            return;
        }

        // Role-based check for admin pages
        boolean isAdminPage = path.endsWith("adminpanel.jsp") || path.contains("/admin");
        if (isAdminPage && (role == null || !role.equalsIgnoreCase("admin"))) {
            res.sendRedirect(req.getContextPath() + "/home.jsp?error=Unauthorized+access");
            return;
        }

        // Allow access to all other pages if logged in
        chain.doFilter(request, response);
    }
} 