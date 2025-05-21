package com.quiz.util;

import org.mindrot.jbcrypt.BCrypt;

// Utility class for password hashing and checking
public class PasswordUtil {
    // Hash a plain password using BCrypt
    public static String hashPassword(String plainPassword) {
        if (plainPassword == null || plainPassword.trim().isEmpty()) {
            throw new IllegalArgumentException("Password cannot be null or empty");
        }
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt());
    }

    // Check if a plain password matches a hashed password
    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        if (plainPassword == null || hashedPassword == null) {
            return false;
        }
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }
}