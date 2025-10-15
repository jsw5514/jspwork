package ch10_board;


import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "BoardUpdateServlet", value = "/BoardUpdateServlet")
public class BoardUpdateServlet extends HttpServlet {
    @Override
    public void init(ServletConfig config) throws ServletException { }

    @Override
    public void destroy() { }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        BoardItem upBean = new BoardItem();
        upBean.setNum(Integer.parseInt(request.getParameter("num")));
        upBean.setName(request.getParameter("name"));
        upBean.setSubject(request.getParameter("subject"));
        upBean.setContent(request.getParameter("content"));
        upBean.setPass(request.getParameter("pass"));

        String nowPage=request.getParameter("nowPage");
        
        BoardItem dbBean = (BoardItem) request.getSession().getAttribute("boardItem");
        
        if(dbBean.getPass()==null || dbBean.getPass().equals(upBean.getPass())){
            BoardDAO boardDao =  new BoardDAO();
            boardDao.updateBoard(upBean);
            
            response.setContentType("text/html;charset=UTF-8");
            response.sendRedirect(request.getContextPath()+"/ch10_board/read.jsp?num="+upBean.getNum()+"&nowPage="+nowPage);
        }
        else{
            out.print("<script>");
            out.print("alert('비밀번호가 맞지 않습니다.');");
            out.print("history.back();");
            out.print("</script>");
        }
    }
}