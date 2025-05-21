package com.quiz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.quiz.model.Attempt;
import com.quiz.util.DBConnection;

public class AttemptDAO {
    private Connection connection;

    // Constructor initializes the database connection
    public AttemptDAO() {
        this.connection = DBConnection.getConnection();
    }

    // Insert a new quiz attempt into the database
    public boolean insertAttempt(Attempt attempt) {
        String sql = "INSERT INTO Attempt (user_id, score, attempt_desc) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, attempt.getUserId());
            stmt.setInt(2, attempt.getScore());
            stmt.setString(3, attempt.getAttemptDesc());
            boolean result = stmt.executeUpdate() > 0;
            System.out.println("Attempt insert result: " + result);
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
} 