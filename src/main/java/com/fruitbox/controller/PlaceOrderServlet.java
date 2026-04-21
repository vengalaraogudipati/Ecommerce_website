package com.fruitbox.controller;

import java.io.IOException;
import java.util.List;

import com.fruitbox.dao.CartDAOImpl;
import com.fruitbox.dao.OrderDAOImpl;
import com.fruitbox.models.CartModel;
import com.fruitbox.models.OrderModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        CartDAOImpl cartDao = new CartDAOImpl();
        OrderDAOImpl orderDao = new OrderDAOImpl();

        List<CartModel> cartList = cartDao.getCartByUser(username);

        for (CartModel c : cartList) {

            OrderModel order = new OrderModel();
            order.setUsername(username);
            order.setFruitId(c.getFruitId());
            order.setFruitName(c.getFruitName());
            order.setPrice(c.getPrice());
            order.setQuantity(c.getQuantity());
            order.setTotal(c.getPrice() * c.getQuantity());
            order.setImage(c.getImage());
            order.setStatus("Ordered");

            orderDao.saveOrder(order);
        }

        cartDao.clearCart(username);

        response.sendRedirect("orders.jsp");
    }
}