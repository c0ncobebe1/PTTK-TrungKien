package Garaman.dao;

import Garaman.model.User;
import java.sql.*;

public class UserDAO extends DAO {

    public UserDAO() { super(); }

    public User login(String username, String password) {
        String query = "SELECT * FROM tblUser WHERE username = ? AND password = ?";
        User member = null;

        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setString(1, username);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    member = new User();
                    member.setId(rs.getInt("id"));
                    member.setName(rs.getString("name"));
                    member.setUsername(rs.getString("username"));
                    member.setPassword(rs.getString("password"));
                    member.setBirthday(rs.getDate("birthday"));
                    member.setAddress(rs.getString("address"));
                    member.setEmail(rs.getString("email"));
                    member.setPhoneNumber(rs.getString("phoneNumber"));
                    member.setRole(rs.getString("role"));
                    member.setGender(rs.getString("gender"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return member;
    }


}
