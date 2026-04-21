package com.fruitbox.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.fruitbox.dao.CartDAOImpl;
import com.fruitbox.models.CartModel;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        CartModel cart = new CartModel();
        cart.setUsername(username);
        cart.setFruitId(Integer.parseInt(request.getParameter("fruitId")));
        cart.setFruitName(request.getParameter("fruitName"));
        cart.setPrice(Double.parseDouble(request.getParameter("price")));
        cart.setQuantity(Integer.parseInt(request.getParameter("quantity")));
        cart.setImage(request.getParameter("image"));

        CartDAOImpl dao = new CartDAOImpl();
        dao.addToCart(cart);

        response.sendRedirect("cart.jsp");   // 🔥 IMPORTANT CHANGE
    }
}