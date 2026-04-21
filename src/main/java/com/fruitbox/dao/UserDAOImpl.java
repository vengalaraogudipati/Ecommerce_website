package com.fruitbox.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.fruitbox.models.UserLoginModel;
import com.fruitbox.models.UserModel;
import com.fruitbox.utility.DBConnection;

public class UserDAOImpl implements UserDAOInterface {
	String status = "fail";
    @Override
    public String UserRegister(UserModel u) {

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(name,email,mobile,username,password) VALUES (?,?,?,?,?)");

            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getMobile());
            ps.setString(4, u.getUsername());
            ps.setString(5, u.getPassword());

            int i = ps.executeUpdate();
            if (i > 0) {
                status = "success";
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
		public String userLogin(UserLoginModel ulm) {


		    try {
		        Connection con = DBConnection.getConnection();

		        PreparedStatement ps = con.prepareStatement(
		            "SELECT * FROM users WHERE username=? AND password=?"
		        );

		        ps.setString(1, ulm.getUsername());
		        ps.setString(2, ulm.getPassword());

		        ResultSet rs = ps.executeQuery();

		        if (rs.next()) {
		            status = "success";
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return status;
	}
}
