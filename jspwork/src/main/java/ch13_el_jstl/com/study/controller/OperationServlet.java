package ch13_el_jstl.com.study.controller;


import ch13_el_jstl.com.study.dto.Person;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "OperationServlet", value = "/operation.do")
public class OperationServlet extends HttpServlet {
    @Override
    public void init(ServletConfig config) throws ServletException { }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { super.service(request,response);}

    @Override
    public void destroy() { }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        request.setAttribute("big",10);
        request.setAttribute("small",3);
        
        request.setAttribute("sOne","");
        request.setAttribute("sTwo","");
        request.setAttribute("sThree","안녕");
        
        request.setAttribute("pOne",new Person("",20,""));
        request.setAttribute("pTwo",null);

        ArrayList<String> list1 = new ArrayList<>();
        request.setAttribute("alist1",list1);
        
        ArrayList<String> list2 = new ArrayList<>();
        list2.add("더조은컴퓨터아카데미");
        request.setAttribute("alist2",list2);
        
        request.getRequestDispatcher("/views/1_EL/02.elOperation.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { }
}