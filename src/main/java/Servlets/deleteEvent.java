package Servlets;

import Repositories.DBConnection;
import Repositories.DBRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;

@WebServlet(name = "deleteEvent", value = "/deleteEvent")
public class deleteEvent extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            DBRepository db=new DBConnection();
            Integer id=Integer.parseInt(request.getParameter("id"));
            PreparedStatement statement=db.getConnection().prepareStatement("delete from events where id="+id);
            statement.executeUpdate();
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
}
