package com.quiz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.quiz.model.Users;
import com.quiz.util.PasswordUtil;

public class UserDAO {
    private Connection con;

    // Constructor initializes the database connection
    public UserDAO(Connection con) {
        this.con = con;
        if (con == null) {
            throw new IllegalStateException("Database connection unsuccessful");
        }
    }

    // Register a new user
    public boolean registerUser(Users user) {
        if (user == null || user.getEmail() == null || user.getPassword() == null) {
            System.err.println("Invalid user data for registration");
            return false;
        }
        String query = "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)";
        try (PreparedStatement pst = con.prepareStatement(query)) {
            String hashedPassword = PasswordUtil.hashPassword(user.getPassword()); // Hashing the password
            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, hashedPassword);
            pst.setString(4, user.getRole());
            int result = pst.executeUpdate();
            System.out.println("Insert Result: " + result);  // Log the result of the insert
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Logs in a user by verifying email and password
    public Users login(String email, String plainPassword) {
        String query = "SELECT * FROM users WHERE email = ?";
        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, email);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    String hashedPassword = rs.getString("password");
                    // Use PasswordUtil to compare the hashed password
                    if (PasswordUtil.checkPassword(plainPassword, hashedPassword)) {
                        return new Users(
                                rs.getString("name"),
                                rs.getString("email"),
                                rs.getString("password"),
                                rs.getString("role")
                        );
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get a user by their username
    public Users getUserByUsername(String username) {
        String query = "SELECT * FROM users WHERE name = ?";
        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, username);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    return new Users(
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("role")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Update user information
    public boolean updateUser(String oldUsername, String newUsername, String newEmail) {
        String query = "UPDATE users SET name = ?, email = ? WHERE name = ?";
        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, newUsername);
            pst.setString(2, newEmail);
            pst.setString(3, oldUsername);
            return pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete a user by their username
    public boolean deleteUserByUsername(String username) {
        String query = "DELETE FROM users WHERE name = ?";
        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, username);
            return pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get user ID by email
    public int getUserIdByEmail(String email) {
        String query = "SELECT id FROM users WHERE email = ?";
        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, email);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("id");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}
