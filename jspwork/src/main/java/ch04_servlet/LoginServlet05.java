package ch04_servlet;


import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet05", value = "/LoginServlet05")
public class LoginServlet05 extends HttpServlet {
    @Override
    public void init(ServletConfig config) throws ServletException { }

    @Override
    public void destroy() { }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        if(id!=null && !id.isEmpty() && pw!=null && !pw.isEmpty()){
            session.setAttribute("idKey",id);
        }
        response.sendRedirect("ch04_servlet/05.login.jsp");
    }
}