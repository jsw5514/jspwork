<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 1.
  Time: 오후 4:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Action Forward Ex1</h1>
    당신의 id는 <%=id%>이고,<br>
    당신의 pw는 <%=pw%>
</body>
</html>
