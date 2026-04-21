package com.fruitbox.controller;

import java.io.IOException;

import com.fruitbox.dao.UserDAOImpl;
import com.fruitbox.models.UserLoginModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		// set model
		UserLoginModel ulm = new UserLoginModel();
		ulm.setUsername(username);
		ulm.setPassword(password); // ✅ IMPORTANT

		// DAO call
		UserDAOImpl udi = new UserDAOImpl();
		String status = udi.userLogin(ulm); // ✅ renamed method

		if ("success".equals(status)) {
			HttpSession session = request.getSession();
			session.setAttribute("username", username);

			RequestDispatcher rd = request.getRequestDispatcher("userdashboard.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("msg", "Invalid Username or Password");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
	}
}