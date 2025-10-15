<%@ page import="ch10_board.BoardItem" %><%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 15.
  Time: 오후 3:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="boardDao" class="ch10_board.BoardDAO"/>
<%
    int num = Integer.parseInt(request.getParameter("num"));
    int nowPage = Integer.parseInt(request.getParameter("nowPage"));
    String keyWord = request.getParameter("keyWord");
    String keyField = request.getParameter("keyField");
    
    BoardItem boardItem = null;
    boardItem = (BoardItem) session.getAttribute("boardItem"); //세션에 캐시된 게시글 로딩
    
    //캐시된 게시글이 없거나 캐시된 게시글과 현재 표시해야하는 게시글이 다른 경우
    if(boardItem == null || boardItem.getNum() != num) {
        boardDao.upCount(num);
        session.setAttribute("boardItem",boardItem);
    }
    boardItem = boardDao.getBoardItem(num);
%>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <style>
        #filename{ color:lightgray; }
        #filesize{ color:blue; }
        .table-primary{text-align:center;}
        #board_footer_text{float: right}
        footer{
            width:100%;
            text-align:center;
        }
    </style>
</head>
<body class="container">
    <table class="table table-info">
        <tr>
            <th colspan="4" class="table-primary">글읽기</th>
        </tr>
        <tr>
            <td class="table-primary">이름</td>
            <td><%=boardItem.getName()%></td>
            <td class="table-primary">등록날짜</td>
            <td><%=boardItem.getRegdate()%></td>
        </tr>
        <tr>
            <td class="table-primary">제목</td>
            <td colspan="3"><%=boardItem.getSubject()%></td>
        </tr>
        <tr>
            <td class="table-primary">첨부파일</td>
            <td colspan="3">
                <span id="filename"><%=boardItem.getFilename()%></span>
                <span id="filesize">(<%=boardItem.getFilesize()%>Bytes)</span>
            </td>
        </tr>
        <tr>
            <td colspan="4"><p><%=boardItem.getContent()%></p></td>
        </tr>
        <tr>
            <td colspan="4">
                <span id="board_footer_text"><%=boardItem.getIp()%>로 부터 글을 남기셨습니다./조회수<%=boardItem.getCount()%></span>
            </td>
        </tr>
    </table>
    <footer>
        [
        <a href="${pageContext.request.contextPath}/ch10_board/list.jsp?num=<%=num%>&nowPage=<%=nowPage%>">리스트</a>|
        <a href="${pageContext.request.contextPath}/ch10_board/update.jsp?num=<%=num%>&nowPage=<%=nowPage%>">수정</a>|
        <a href="${pageContext.request.contextPath}/ch10_board/reply.jsp?num=<%=num%>&nowPage=<%=nowPage%>">답변</a>|
        <a href="${pageContext.request.contextPath}/ch10_board/delete.jsp?num=<%=num%>&nowPage=<%=nowPage%>">삭제</a>
        ]
    </footer>
</body>
</html>
