package com.quiz.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// Utility class for managing database connections
public class DBConnection {
    private static Connection con = null;

    // Get a connection to the database (singleton)
    public static Connection getConnection() {
        if (con == null || isClosed(con)) {
            try {
                // Load the MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                // Connect to the existing phpMyAdmin database
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

    // Check if the connection is closed
    private static boolean isClosed(Connection con) {
        try {
            return con == null || con.isClosed();
        } catch (SQLException e) {
            e.printStackTrace();
            return true;
        }
    }
}
