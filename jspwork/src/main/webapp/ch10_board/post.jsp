<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 15.
  Time: 오후 6:59
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    public static String emptyIfNull(String str){
        return str!=null ? str : "";
    }
%>
<%
    String name = emptyIfNull(request.getParameter("name"));
    String subject = emptyIfNull(request.getParameter("subject"));
    String content = emptyIfNull(request.getParameter("content"));
%>
<html>
<head>
    <title>글쓰기</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/BoardPostServlet" method="post">
    <table>
        <tr>
            <th colspan="2">글 쓰 기</th>
        </tr>
        <tr>
            <td>성명</td>
            <td><input name="name"><%=name%></td>
        </tr>
        <tr>
            <td>제목</td>
            <td><input name="subject"><%=subject%></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea name="content"><%=content%></textarea></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input name="pass"></td>
        </tr>
        <tr>
            <td colspan="2"><br><hr></td>
        </tr>
        <tr>
            <td><input type="submit" value="등록"></td>
            <td><input type="reset" value="다시 쓰기"></td>
            <td><input type="button" value="리스트" onclick="location.href='/ch10_board/list.jsp'"></td>
        </tr>
    </table>
</form>
</body>
</html>

