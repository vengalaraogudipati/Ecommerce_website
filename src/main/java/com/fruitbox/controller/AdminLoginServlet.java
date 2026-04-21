package com.fruitbox.controller;

import java.io.IOException;

import com.fruitbox.dao.AdminDAOImpl;
import com.fruitbox.models.AdminLoginModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        AdminLoginModel admin = new AdminLoginModel(username, password);

        AdminDAOImpl dao = new AdminDAOImpl();
        AdminLoginModel result = dao.adminLogin(admin);

        if (result != null) {
            HttpSession session = req.getSession();
            session.setAttribute("username", username);

            res.sendRedirect("admindashboard.jsp");
        } else {
            res.sendRedirect("adminlogin.jsp?error=invalid");
        }
    }
}
