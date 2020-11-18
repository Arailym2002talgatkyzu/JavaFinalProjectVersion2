package Servlets;

import Model.Student;
import Repositories.studentSelector;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;


@WebServlet(name = "searchServlet", value = "/searchServlet")
public class searchServlet extends HttpServlet {
    studentSelector selector = null;
    public static ArrayList<Student> listOfStudents;
    @Override
    public void init() throws ServletException {
        selector = new studentSelector();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    studentSelector selector=new studentSelector();
    String target=request.getParameter("search");
    String select=request.getParameter("query");
    System.out.println(target + " " + select);
    if(select.equals("1")){
        listOfStudents= (ArrayList<Student>) selector.selectByName(target);
    }
    else if(select.equals("2")){
        listOfStudents= (ArrayList<Student>) selector.selectBySurname(target);
    }
    else if(select.equals("3")){
        listOfStudents= (ArrayList<Student>) selector.selectByGroup(target);
    }
    else if(select.equals("4")){
        listOfStudents= (ArrayList<Student>) selector.selectByMajor(target);
    }

   else  if(select.equals("5")){
        listOfStudents= (ArrayList<Student>) selector.selectByYear(Integer.parseInt(target));
    }

   else  if(select.equals("6")){
        listOfStudents= (ArrayList<Student>) selector.selectByEmail(target);
    }
   else  if(select.equals("7")){
        System.out.println(
                "hello"
        );
    }
    PrintWriter out=response.getWriter();
    System.out.println(selector.selectAll());
    System.out.println(listOfStudents);
    String json = new Gson().toJson(listOfStudents);
    out.print(json);
    out.flush();

}
}
