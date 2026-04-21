package com.fruitbox.controller;

import java.io.IOException;

import com.fruitbox.dao.FruitDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteFruitServlet
 */
@WebServlet("/DeleteFruitServlet")
public class DeleteFruitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));

        FruitDAOImpl dao = new FruitDAOImpl();
        dao.deleteFruit(id);

        response.sendRedirect("adminviewfruits.jsp");
	}

}
