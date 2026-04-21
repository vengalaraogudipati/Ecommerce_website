package com.fruitbox.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

		static Connection con=null;
		public static Connection getConnection() {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_db","root","root");
			}catch(Exception e) {
				System.out.println(e);
			}
			return con;
		}



	}
