package Repositories;

import Model.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserRepository {
    private DBRepository db=new DBConnection();
    public User queryOne(String sql){
        try {
            Statement stmt = db.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                return new User(
                        rs.getString("username"),
                        rs.getString("name"),
                        rs.getString("surname"),
                        rs.getString("avatar"),
                        rs.getString("major"),
                        rs.getString("email"),
                        rs.getString("groupid")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public User login(String username,String password) {
        String sql = "SElECT username, name, surname, avatar, major, email, groupid FROM students WHERE username = '"+username+"' AND password = '"+password+"'";
        return queryOne(sql);
    }
}
