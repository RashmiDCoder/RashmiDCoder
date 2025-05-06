package model;

import java.sql.*;

public class UserDAO {
    private Connection con;

   

    public UserDAO(Connection con) {
    	this.con = con;
	}

	public boolean registerUser(User user) {
        try {
            String query = "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getPassword());
            pst.setString(4, user.getRole());
            return pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public User login(String email, String plainPassword) {
        try {
            String query = "SELECT * FROM users WHERE email=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                String hashedPassword = rs.getString("password");
                if (PasswordUtil.checkPassword(plainPassword, hashedPassword)) {
                    return new User(
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
}