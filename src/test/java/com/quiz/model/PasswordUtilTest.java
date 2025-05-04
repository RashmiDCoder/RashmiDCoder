package com.quiz.model;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class PasswordUtilTest {

    @Test
    public void testHashAndCheckPassword() {
        String plainPassword = "1234";
        String hashedPassword = PasswordUtil.hashPassword(plainPassword);
        assertNotNull(hashedPassword, "The hashed password should not be null");
        assertTrue(PasswordUtil.checkPassword(plainPassword, hashedPassword), "The passwords should match");
        assertFalse(PasswordUtil.checkPassword("wrongpass", hashedPassword), "The wrong password should not match");
    }
}
