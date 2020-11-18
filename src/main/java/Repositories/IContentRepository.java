package Repositories;

import java.sql.SQLException;
import java.util.List;

public interface IContentRepository<T> {
    List<T> query(String sql) throws SQLException, SQLException;
}
