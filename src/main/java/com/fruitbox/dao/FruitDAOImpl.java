package com.fruitbox.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fruitbox.models.FruitModel;
import com.fruitbox.utility.DBConnection;

public class FruitDAOImpl implements FruitDAOInterface{
	
		public List<FruitModel> getAllFruits() {

	        List<FruitModel> list = new ArrayList<>();

	        try {
	            Connection con = DBConnection.getConnection();
	            PreparedStatement ps = con.prepareStatement("SELECT * FROM fruits");
	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {
	                FruitModel f = new FruitModel();
	                f.setId(rs.getInt("id"));
	                f.setName(rs.getString("name"));
	                f.setPrice(rs.getDouble("price"));
	                f.setQuantity(rs.getInt("quantity"));
	                f.setImage(rs.getString("image"));

	                list.add(f);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return list;
	    }

		@Override
		public boolean addFruit(FruitModel fruit) {
			boolean status = false;

	        try {
	            Connection con = DBConnection.getConnection();

	            PreparedStatement ps = con.prepareStatement(
	                "INSERT INTO fruits(name,price,quantity,image) VALUES(?,?,?,?)"
	            );

	            ps.setString(1, fruit.getName());
	            ps.setDouble(2, fruit.getPrice());
	            ps.setInt(3, fruit.getQuantity());
	            ps.setString(4, fruit.getImage());

	            int i = ps.executeUpdate();

	            if (i > 0) {
	                status = true;
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return status;
		}
		public boolean deleteFruit(int id) {

		    boolean status = false;

		    try {
		        Connection con = DBConnection.getConnection();

		        PreparedStatement ps =
		            con.prepareStatement("DELETE FROM fruits WHERE id=?");

		        ps.setInt(1, id);

		        int rows = ps.executeUpdate();

		        if (rows > 0) {
		            status = true;
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return status;
		}
		public FruitModel getFruitById(int id) {

		    FruitModel fruit = null;

		    try {
		        Connection con = DBConnection.getConnection();

		        PreparedStatement ps =
		            con.prepareStatement("SELECT * FROM fruits WHERE id=?");

		        ps.setInt(1, id);

		        ResultSet rs = ps.executeQuery();

		        if (rs.next()) {
		            fruit = new FruitModel(
		                rs.getInt("id"),
		                rs.getString("name"),
		                rs.getDouble("price"),
		                rs.getInt("quantity"),
		                rs.getString("image")
		            );
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return fruit;
		}
		public boolean updateFruit(FruitModel fruit) {

		    boolean status = false;

		    try {
		        Connection con = DBConnection.getConnection();

		        PreparedStatement ps =
		            con.prepareStatement(
		                "UPDATE fruits SET name=?, price=?, quantity=?, image=? WHERE id=?"
		            );

		        ps.setString(1, fruit.getName());
		        ps.setDouble(2, fruit.getPrice());
		        ps.setInt(3, fruit.getQuantity());
		        ps.setString(4, fruit.getImage());
		        ps.setInt(5, fruit.getId());

		        int rows = ps.executeUpdate();

		        if (rows > 0) {
		            status = true;
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return status;
		}



	}

