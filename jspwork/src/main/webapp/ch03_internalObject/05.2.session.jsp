<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 1.
  Time: 오후 7:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    final int SESSION_REMAIN_MINUTE = 30;
    String id = request.getParameter("id");
    
    session.setAttribute("id",id);
    session.setMaxInactiveInterval(SESSION_REMAIN_MINUTE*60);//초단위로 입력 받으므로 60을 곱해서 입력
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="05.3.session.jsp">
    1. 가장 좋아하는 계절은?<br>
    <input type="radio" name="season" value="봄">봄&emsp;
    <input type="radio" name="season" value="여름">여름&emsp;
    <input type="radio" name="season" value="가을">가을&emsp;
    <input type="radio" name="season" value="겨울">겨울&emsp;
    
    2. 가장 좋아하는 과일은?<br>
    <input type="radio" name="fruit" value="사과">사과&emsp;
    <input type="radio" name="fruit" value="바나나">바나나&emsp;
    <input type="radio" name="fruit" value="오렌지">오렌지&emsp;
    <input type="radio" name="fruit" value="포도">포도<br>

    <input type="submit">
    <input type="reset">
</form>
</body>
</html>
