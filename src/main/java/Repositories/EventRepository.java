package Repositories;

import Contents.Club;
import Contents.Event;
import Contents.News;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EventRepository implements IEventRepository {
    private DBRepository db=new DBConnection();

    public List<Event> showEvents() throws SQLException {
        String sql = "SELECT * FROM events "  ;
        return query(sql);
    }

    public List<Event> showUserEvents(String username)throws SQLException{
        String sql="SELECT * FROM events where owner='"+username+"'";
        return query(sql);
    }

    @Override
    public List<Event> query(String sql) throws SQLException {
        try {
            Statement stmt = db.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            ArrayList<Event> events = new ArrayList<>();

            while (rs.next()) {
                Event event = new Event(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("url"),
                        rs.getString("creation_date"),
                        rs.getString("owner")
                );

                events.add(event);

            }
            return events;
        } catch (SQLException ex) {
            throw new SQLException(ex);
    }
    }
}
