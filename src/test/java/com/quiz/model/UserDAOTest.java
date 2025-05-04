package com.quiz.model;

import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;
import java.sql.*;

public class UserDAOTest {

    private static Connection connection;
    private static UserDAO userDAO;

    @BeforeAll
    public static void setup() {
        try {
            connection = DBConnection.getConnection();
            userDAO = new UserDAO(connection);
            // Create a test table if needed.
            try (Statement stmt = connection.createStatement()) {
                stmt.execute("CREATE TABLE IF NOT EXISTS users (" +
                        "id INT AUTO_INCREMENT PRIMARY KEY, " +
                        "name VARCHAR(100) NOT NULL, " +
                        "email VARCHAR(100) NOT NULL UNIQUE, " +
                        "password VARCHAR(255) NOT NULL, " +
                        "role VARCHAR(50) NOT NULL" +
                        ")");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            fail("Setup failed: " + e.getMessage());
        }
    }

    @AfterAll
    public static void tearDown() throws SQLException {
        // Cleanup test table data if necessary.
        try (Statement stmt = connection.createStatement()) {
            stmt.execute("DROP TABLE users");
        }
        connection.close();
    }

    @Test
    public void testRegisterUser() {
        String name = "Test User";
        String email = "testuser@example.com";
        String plainPassword = "1234";
        String hashedPassword = PasswordUtil.hashPassword(plainPassword);
        String role = "user";

        Users user = new Users(name, email, hashedPassword, role);
        boolean result = userDAO.registerUser(user);
        assertTrue(result, "User should be registered successfully");

        // Trying to register the same email should fail.
        boolean duplicateResult = userDAO.registerUser(user);
        assertFalse(duplicateResult, "Duplicate registration should fail");
    }
}
