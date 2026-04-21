package com.fruitbox.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.fruitbox.dao.UserDAOImpl;
import com.fruitbox.models.UserModel;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1️⃣ Read form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 2️⃣ Set data to model
        UserModel u = new UserModel();
        u.setName(name);
        u.setEmail(email);
        u.setMobile(mobile);
        u.setUsername(username);
        u.setPassword(password);

        // 3️⃣ Call DAO
        UserDAOImpl dao = new UserDAOImpl();
        String status = dao.UserRegister(u);

        // 4️⃣ Navigation
        if (status.equals("success")) {
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
            rd.forward(request, response);
        }
    }
}
