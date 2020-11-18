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
@WebServlet ("/addEvent")
public class addEvent extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            DBRepository db=new DBConnection();
            String title=request.getParameter("title");
            String date=request.getParameter("date");
            String owner=request.getParameter("owner");
            String url=request.getParameter("url");
            PreparedStatement stmt=db.getConnection().prepareStatement("insert into events(title, creation_date, owner, url) values('"+title+"', '"+date+"', '"+owner+"', '"+url+"')");
            response.sendRedirect("profile.jsp");
            stmt.executeUpdate();
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
}
