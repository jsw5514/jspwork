<%@ page import="java.util.List" %>
<%@ page import="ch10_board.BoardItem" %><%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 14.
  Time: 오후 8:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="boardDao" class="ch10_board.BoardDAO"/>
<%
    List<BoardItem> boardItemList = null;
    String keyWord = request.getParameter("keyWord");
    String keyField = request.getParameter("keyField");
    if(keyWord !=null){
        boardItemList = boardDao.getBoardItems(keyField,keyWord);
    }
    else {
        String pageNumStr = request.getParameter("page");
        int pageNum = Integer.parseInt(pageNumStr != null ? pageNumStr : "1");
        boardItemList = boardDao.getBoardItems(pageNum);
    }
    
    int nowPage = 1;
    if(request.getParameter("reload") != null){
        keyField = "";
        keyWord="";
    }
%>
<script>
    function list(){
        document.listFrm.submit();
    }
    function read(num){
        document.readFrm.num.value = num;
        document.readFrm.submit();
    }
</script>
<html>
<head>
    <title>JSP Board</title>
    <style>
        *{
            text-decoration: none;
        }
        body{
            width: 800px;
            margin: 0 auto;
        }
        h1{
            width: 100%;
            text-align: center;
        }
        th{
            border-top: 1px solid lightgray;
            border-bottom: 1px solid lightgray;
        }
        table{
            width: 100%;
        }
        footer{
            float: right;
        }
        .boardItem:hover{
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>JSPBoard</h1>
    <table>
        <tr>
            <th colspan="5">Total: </th>
        </tr>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>이름</th>
            <th>날짜</th>
            <th>조회수</th>
        </tr>
        <%
            for(BoardItem boardItem:boardItemList){
        %>
                <tr class="boardItem" style="text-align: center">
                    <td><%=boardItem.getNum()%></td>
                    <td style="text-align: left">
                        <a href="javascript:read('<%=boardItem.getNum()%>')">
                            <%=boardItem.getSubject()%>
                        </a>
                    </td>
                    <td><%=boardItem.getName()%></td>
                    <td><%=boardItem.getRegdate()%></td>
                    <td><%=boardItem.getCount()%></td>
                </tr>
        <%
            }
        %>
    </table>
    <form action="${pageContext.request.contextPath}/ch10_board/list.jsp">
        <select name="keyField">
            <option value="name">이름</option>
            <option value="subject">제목</option>
            <option value="content">내용</option>
        </select>
        <input name="keyWord" required>
        <input type="submit" value="찾기">
    </form>
    <footer>
        <a href="${pageContext.request.contextPath}/ch10_board/post.jsp">[글쓰기]</a>
        <a href="">[처음으로]</a>
    </footer>
    <form name="listFrm" action="${pageContext.request.contextPath}/ch10_board/list.jsp">
        <input type="hidden" name="reload" value="true">
        <input type="hidden" name="page" value="<%=nowPage%>">
    </form>
    
    <!-- 제목을 누르면 상세 페이지로 가기-->
    <form name="readFrm" action="${pageContext.request.contextPath}/ch10_board/read.jsp">
        <input type="hidden" name="num">
        <input type="hidden" name="nowPage" value="<%=nowPage%>">
        <input type="hidden" name="ketField" value="<%=keyField%>">
        <input type="hidden" name="keyWord" value="<%=keyWord%>">
    </form>
</body>
</html>
