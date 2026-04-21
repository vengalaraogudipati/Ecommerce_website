package com.fruitbox.controller;

import java.io.IOException;

import com.fruitbox.dao.FruitDAOImpl;
import com.fruitbox.models.FruitModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditFruitServlet")
public class EditFruitServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        FruitDAOImpl dao = new FruitDAOImpl();
        FruitModel fruit = dao.getFruitById(id);

        request.setAttribute("fruit", fruit);

        request.getRequestDispatcher("editfruit.jsp")
               .forward(request, response);
    }
}
