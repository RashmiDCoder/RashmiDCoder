package com.quiz.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static Connection con = null;

    public static Connection getConnection() {
        if (con == null || isClosed(con)) {
            try {
                // Load the MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Connect to the existing phpMyAdmin database
                // Note: Using localhost since phpMyAdmin is running locally
                con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/Quiz?useSSL=false&allowPublicKeyRetrieval=true",
                    "root", // default phpMyAdmin username
                    ""     // your phpMyAdmin password (empty string if no password)
                );
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                // Add better error logging
                System.err.println("Database Connection Error: " + e.getMessage());
            }
        }
        return con;
    }

    private static boolean isClosed(Connection con) {
        try {
            return con == null || con.isClosed();
        } catch (SQLException e) {
            e.printStackTrace();
            return true;
        }
    }
}
