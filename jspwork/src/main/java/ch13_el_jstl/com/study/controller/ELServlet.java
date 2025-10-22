package ch13_el_jstl.com.study.controller;


import ch13_el_jstl.com.study.dto.Person;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "ELServlet", value = "/el.do")
public class ELServlet extends HttpServlet {
    @Override
    public void init(ServletConfig config) throws ServletException { }

//    @Override
//    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { }

    @Override
    public void destroy() { }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        /*
        * 데이터를 담을 수 있는 JSP내장 객체의 종류
        * 1. ServletContext(application scope)
        *   한 애플리케이션 당 1개가 존재
        *   이 영역에 담은 데이터는 애플리케이션 전역에서 사용 가능
        *   공유 범위가 가장 큼(jsp, servlet, java)
        * 2. HttpSession(session scope)
        *   한 브라우저당 1개 존재
        *   이 영역에 데이터를 담으면 jsp, servlet에서 사용 가능
        * 3. HttpServletRequest(request scope)
        *   요청마다 생성되는 객체
        *   동일한 요청을 갖는 곳 또는 포워딩 받는 jsp나 servlet에서 사용 가능
        * 4. PageContext(page scope)
        *   jsp마다 존재
        *   해당 페이지에서만 사용 가능
        *   가장 작은 공유범위(include 된 페이지나 jstl 등에서 현재 페이지에 접근할때 사용)
        * */
        
        //request scope에 데이터 저장
        request.setAttribute("classRoom","801 강의실");
        request.setAttribute("student", new Person("더조은", 23, "남자"));
        
        //session scope에 데이터 저장
        HttpSession session = request.getSession();
        session.setAttribute("academy","tjoeun");
        session.setAttribute("teacher",new Person("김지원",31, "여자"));
        
        //두 scope에 동일한 키로 서로 다른 데이터 저장
        request.setAttribute("scope","request");
        session.setAttribute("scope","session");
        
        //application scope에 담기
        request.getServletContext().setAttribute("scope","application");
        
        //포워딩
        request.getRequestDispatcher("/views/1_EL/01.el.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { }
}