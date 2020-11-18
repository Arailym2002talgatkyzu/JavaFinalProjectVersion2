package Repositories;

import Contents.Club;
import Contents.News;

import javax.enterprise.inject.New;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class NewsRepository implements INewsRepository{
    private DBRepository db=new DBConnection();

    public List<News> showNews() throws SQLException {
        String sql = "SELECT * FROM news "  ;
        return query(sql);
    }

    public List<News> showUserNews(String username)throws SQLException{
        String sql="SELECT * FROM news where owner='"+username+"'";
        return query(sql);
    }

    @Override
   public List<News> query(String sql)throws SQLException{
        try {
            Statement stmt = db.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            ArrayList<News> news = new ArrayList<>();

            while (rs.next()) {
                News newss = new News(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("url"),
                        rs.getString("creation_date"),
                        rs.getString("owner")
                );

                news.add(newss);
            }
            return news;
        } catch (SQLException ex) {
            throw new SQLException(ex);
        }
    }
}
