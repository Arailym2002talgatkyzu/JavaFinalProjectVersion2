package Repositories;

import Model.Student;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class studentSelector {
    private DBRepository db = new DBConnection();
    public List<Student> query(String sql) {
        try {
            Statement stmt = db.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            ArrayList<Student> students = new ArrayList<>();
            while (rs.next()) {
                Student student = new Student(
                        rs.getString("name"),
                        rs.getString("surname"),
                        rs.getString("avatar"),
                        rs.getString("groupid")
                );
                students.add(student);
            }
            return students;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Student> selectAll(){
        String sql="Select name, surname, avatar, groupid from students";
        return query(sql);
    }

    public List<Student>selectByName(String name){
        String sql="Select name, surname, avatar, groupid from students where name='"+name+"'";
        return query(sql);
    }

    public List<Student>selectBySurname(String surname){
        String sql="Select name, surname, avatar, groupid from students where surname='"+surname+"'";
        return query(sql);
    }
    public List<Student>selectByMajor(String major){
        String sql="Select name, surname, avatar, groupid from students where major='"+major+"'";
        return query(sql);
    }

    public List<Student>selectByYear(int year){
        String sql="Select name, surname, avatar, groupid from students where year="+year;
        return query(sql);
    }

    public List<Student>selectByGroup(String group){
        String sql="Select name, surname, avatar, groupid from students where groupid='"+group+"'";
        return query(sql);
    }

    public List<Student>selectByEmail(String email){
        String sql="Select name, surname, avatar, groupid from students where email='"+email+"'";
        return query(sql);
    }
}
