package ch10_board;


import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "BoardPostServlet", value = "/BoardPostServlet")
public class BoardPostServlet extends HttpServlet {
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
        PrintWriter out = response.getWriter();
        BoardItem postBean = new BoardItem();
        postBean.setName(request.getParameter("name"));
        postBean.setSubject(request.getParameter("subject"));
        postBean.setContent(request.getParameter("content"));
        postBean.setPass(request.getParameter("pass"));
        postBean.setIp(request.getRemoteAddr());        

        String nowPage=request.getParameter("nowPage");

        BoardDAO boardDao =  new BoardDAO();
        boolean isSuccess = boardDao.insertBoard(postBean);
        if(isSuccess){
            out.print("<script>");
            out.print("alert('등록에 성공했습니다.');");
            out.print("</script>");
            
            response.setContentType("text/html;charset=UTF-8");
            response.sendRedirect(request.getContextPath()+"/ch10_board/list.jsp");
        }
        else{
            out.print("<script>");
            out.print("alert('등록에 실패했습니다.');");
            out.print("history.back();");
            out.print("</script>");
        }
    }
}