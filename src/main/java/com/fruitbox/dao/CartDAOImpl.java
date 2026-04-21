package com.fruitbox.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fruitbox.models.CartModel;
import com.fruitbox.models.OrderModel;
import com.fruitbox.utility.DBConnection;

public class CartDAOImpl implements CartDAOInterface {
	String status = "fail";
	public static void main(String[] args) {
		

	}

	public String addToCart(CartModel c) {

	    try {
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(
	            "INSERT INTO cart(username, fruit_id, fruit_name, price, quantity, image) VALUES (?,?,?,?,?,?)"
	        );

	        ps.setString(1, c.getUsername());
	        ps.setInt(2, c.getFruitId());
	        ps.setString(3, c.getFruitName());
	        ps.setDouble(4, c.getPrice());
	        ps.setInt(5, c.getQuantity());
	        ps.setString(6, c.getImage());   // ✅ NOW CORRECT

	        int i = ps.executeUpdate();
	        if (i > 0) status = "success";

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return status;
	}
	public List<CartModel> getCartByUser(String username) {

	    List<CartModel> list = new ArrayList<>();

	    try {
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(
	            "SELECT * FROM cart WHERE username=?"
	        );

	        ps.setString(1, username);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            CartModel c = new CartModel();
	            c.setId(rs.getInt("id"));
	            c.setUsername(rs.getString("username"));
	            c.setFruitId(rs.getInt("fruit_id"));
	            c.setFruitName(rs.getString("fruit_name"));
	            c.setPrice(rs.getDouble("price"));
	            c.setQuantity(rs.getInt("quantity"));
	            c.setImage(rs.getString("image"));   // 🔥 IMPORTANT
	            list.add(c);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	public String removeFromCart(int cartId) {

	    try {
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(
	            "DELETE FROM cart WHERE id=?"
	        );

	        ps.setInt(1, cartId);

	        int i = ps.executeUpdate();
	        if (i > 0) {
	            status = "success";
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return status;
	}
	public String clearCart(String username) {

	    try {
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(
	            "DELETE FROM cart WHERE username=?"
	        );

	        ps.setString(1, username);
	        ps.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		return status;
	}
	
	}
	
