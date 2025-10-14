<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 1.
  Time: 오후 3:50
  To change this template use File | Settings | File Templates.
--%>
<%
    String siteName = request.getParameter("siteName");
    String siteTel = request.getParameter("siteTel");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%=siteName%><br>
<%=siteTel%><br>
</body>
</html>
