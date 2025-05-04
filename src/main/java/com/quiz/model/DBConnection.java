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

                // Create the connection to your database.
                // Change the URL, username, and password as per your MySQL configuration.
                con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/Quiz", "root", ""
                );
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }
        return con;
    }

    private static boolean isClosed(Connection con) {
        try {
            return con.isClosed();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }
}
