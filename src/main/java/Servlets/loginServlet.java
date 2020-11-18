package Servlets;

import Model.User;
import Repositories.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "loginServlet", value = "/loginServlet")
public class loginServlet extends HttpServlet {
    UserRepository userRepository = null;
    @Override
    public void init() throws ServletException {
        userRepository = new UserRepository();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

        UserRepository userRepository=new UserRepository();
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        User user= userRepository.login(username, password);
        HttpSession httpSession=request.getSession();
        if(user!=null){
            httpSession.setAttribute("user", user);
            response.sendRedirect("user.jsp");
        }
        else {
            response.sendRedirect("index.jsp");
            System.out.println("Incorrect login or password");
        }

    }

}