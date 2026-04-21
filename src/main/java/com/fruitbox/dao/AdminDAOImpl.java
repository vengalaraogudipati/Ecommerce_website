package com.fruitbox.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.fruitbox.models.AdminLoginModel;
import com.fruitbox.utility.DBConnection;

public class AdminDAOImpl implements AdminDAOInterface {

    @Override
    public AdminLoginModel adminLogin(AdminLoginModel admin) {

        AdminLoginModel loggedAdmin = null;

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM admin WHERE username=? AND password=?"
            );

            ps.setString(1, admin.getUsername());
            ps.setString(2, admin.getPassword());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                loggedAdmin = new AdminLoginModel();
                loggedAdmin.setUsername(rs.getString("username"));
                loggedAdmin.setPassword(rs.getString("password"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return loggedAdmin; // null if login fails
    }
}
