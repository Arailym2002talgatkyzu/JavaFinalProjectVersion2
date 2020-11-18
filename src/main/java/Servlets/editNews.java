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

@WebServlet("/editNews")
public class editNews extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            DBRepository db=new DBConnection();
            Integer id=Integer.parseInt(request.getParameter("id"));
            String title=request.getParameter("title");
            String date=request.getParameter("date");
            String owner=request.getParameter("owner");
            String url=request.getParameter("url");

            PreparedStatement stmt=db.getConnection().prepareStatement("UPDATE news SET title = ?, creation_date =?, owner =?, url=? WHERE id = ?");
            stmt.setString(1, title);
            stmt.setString(2, date);
            stmt.setString(3, owner);
            stmt.setString(4, url);
            stmt.setInt(5,id );
            response.sendRedirect("profile.jsp");
            stmt.executeUpdate();
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
}}
