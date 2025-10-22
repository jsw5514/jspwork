package ch12_ajax.ajaxReply;


import com.google.gson.Gson;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ReplyServlet", value = "/rlist.bo")
public class ReplyServlet extends HttpServlet {
    @Override
    public void init(ServletConfig config) throws ServletException { }

//    @Override
//    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { }

    @Override
    public void destroy() { }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        int boardNum = Integer.parseInt(request.getParameter("bno"));
        List<Reply> replyList = new ReplyDao().getReplies(boardNum);
        new Gson().toJson(replyList, response.getWriter());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { }
}