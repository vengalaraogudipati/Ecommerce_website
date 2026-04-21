package com.fruitbox.dao;

import java.sql.*;
import java.util.*;

import com.fruitbox.models.OrderModel;
import com.fruitbox.utility.DBConnection;

public class OrderDAOImpl implements OrderDAOInterface {

    @Override
    public String saveOrder(OrderModel order) {

        String status = "fail";

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO orders(username, fruit_id, fruit_name, price, quantity, total, status, image) VALUES (?,?,?,?,?,?,?,?)"
            );

            ps.setString(1, order.getUsername());
            ps.setInt(2, order.getFruitId());
            ps.setString(3, order.getFruitName());
            ps.setDouble(4, order.getPrice());
            ps.setInt(5, order.getQuantity());
            ps.setDouble(6, order.getTotal());
            ps.setString(7, order.getStatus());
            ps.setString(8, order.getImage());

            int i = ps.executeUpdate();

            if (i > 0) {
                status = "success";
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    @Override
    public List<OrderModel> getOrdersByUsername(String username) {

        List<OrderModel> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM orders WHERE username=?"
            );

            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                OrderModel o = new OrderModel();

                o.setId(rs.getInt("id"));
                o.setUsername(rs.getString("username"));
                o.setFruitId(rs.getInt("fruit_id"));
                o.setFruitName(rs.getString("fruit_name"));
                o.setPrice(rs.getDouble("price"));
                o.setQuantity(rs.getInt("quantity"));
                o.setTotal(rs.getDouble("total"));
                o.setStatus(rs.getString("status"));
                o.setImage(rs.getString("image"));
                o.setOrderDate(rs.getTimestamp("order_date"));

                list.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public boolean cancelOrder(int orderId) {

        boolean result = false;

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "UPDATE orders SET status = 'Cancelled' WHERE id = ?"
            );

            ps.setInt(1, orderId);

            int i = ps.executeUpdate();
            if (i > 0) {
                result = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}