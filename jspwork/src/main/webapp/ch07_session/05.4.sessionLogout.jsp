<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 10.
  Time: 오후 7:05
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
    response.sendRedirect(request.getContextPath()+"/05.1.sessionLogin.jsp");
%>

</body>
</html>
