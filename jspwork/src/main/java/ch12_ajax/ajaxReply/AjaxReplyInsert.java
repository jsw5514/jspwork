package ch12_ajax.ajaxReply;


import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AjaxReplyInsert", value = "/rinsert.bo")
public class AjaxReplyInsert extends HttpServlet {
    @Override
    public void init(ServletConfig config) throws ServletException { }

//    @Override
//    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { }

    @Override
    public void destroy() { }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        String replyContent = request.getParameter("content");
        int bno = Integer.parseInt(request.getParameter("bno"));
        String name = request.getParameter("name");
        
        Reply reply = new Reply();
        reply.setContent(replyContent);
        reply.setName(name);
        reply.setRef(bno);
        new ReplyDao().insertReply(reply);
        
        
    }
}