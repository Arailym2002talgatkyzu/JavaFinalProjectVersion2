package Repositories;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection implements DBRepository {
    public Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String connStr = "jdbc:mysql://localhost:3306/university?serverTimezone=UTC";
            return DriverManager.getConnection(connStr, "root", "650464");
        } catch (SQLException | ClassNotFoundException ex) {
            throw new SQLException(ex);
        }
    }
}
