package Repositories;

import java.sql.Connection;
import java.sql.SQLException;

public interface DBRepository {
    Connection getConnection() throws SQLException;
}
