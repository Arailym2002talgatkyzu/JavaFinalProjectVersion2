package Repositories;

import Contents.Club;
import Contents.News;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ClubRepository implements IClubRepository {
    private DBRepository db=new DBConnection();

    public List<Club> showClubs() throws SQLException {
        String sql = "SELECT * FROM clubs "  ;
        return query(sql);
    }
    public List<Club> showUserClubs(String username)throws SQLException{
        String sql="SELECT * FROM clubs where owner='"+username+"'";
        return query(sql);
    }

    @Override
    public List<Club> query(String sql) throws SQLException {
        try {
            Statement stmt = db.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            ArrayList<Club> clubs = new ArrayList<>();

            while (rs.next()) {
                Club club = new Club(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("url"),
                        rs.getString("creation_date"),
                        rs.getString("owner")
                );

                clubs.add(club);
            }
            return clubs;
        } catch (SQLException ex) {
            throw new SQLException(ex);
        }
    }
}
