package com.fruitbox.controller;

import java.io.IOException;

import com.fruitbox.dao.FruitDAOImpl;
import com.fruitbox.models.FruitModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddFruitServlet")
public class AddFruitServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // 🔹 Get form values
            String name = request.getParameter("name");
            String priceStr = request.getParameter("price");
            String qtyStr = request.getParameter("quantity");
            String image = request.getParameter("image");

            // 🔹 Convert String to correct data types
            double price = Double.parseDouble(priceStr);
            int quantity = Integer.parseInt(qtyStr);

            // 🔹 Create model object (NO ID because auto increment)
            FruitModel fruit = new FruitModel(name, price, quantity, image);

            // 🔹 Call DAO
            FruitDAOImpl dao = new FruitDAOImpl();
            boolean status = dao.addFruit(fruit);

            if (status) {
                response.sendRedirect("admindashboard.jsp?msg=added");
            } else {
                response.sendRedirect("addfruit.jsp?error=true");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addfruit.jsp?error=exception");
        }
    }
}
