package com.quiz.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(urlPatterns = {"/view/adminpanel.jsp", "/AddQuizServlet", "/EditQuizServlet", "/DeleteQuizServlet"})
public class RoleFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String role = (session != null) ? (String) session.getAttribute("role") : null;

        // Only allow admins to access these resources
        if (role == null || !role.equalsIgnoreCase("admin")) {
            res.sendRedirect(req.getContextPath() + "/view/home.jsp?error=Unauthorized+access");
            return;
        }

        chain.doFilter(request, response);
    }
} 