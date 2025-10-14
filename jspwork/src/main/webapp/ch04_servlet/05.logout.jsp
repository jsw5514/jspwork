<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 1.
  Time: 오후 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.invalidate();
    response.sendRedirect("05.login.jsp");
%>
</body>
</html>
