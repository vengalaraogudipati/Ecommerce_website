package com.fruitbox.controller;

import java.io.IOException;

import com.fruitbox.dao.FruitDAOImpl;
import com.fruitbox.models.FruitModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateFruitServlet")
public class UpdateFruitServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String image = request.getParameter("image");

        FruitModel fruit =
            new FruitModel(id, name, price, quantity, image);

        FruitDAOImpl dao = new FruitDAOImpl();
        dao.updateFruit(fruit);

        response.sendRedirect("adminviewfruits.jsp");
    }
}
