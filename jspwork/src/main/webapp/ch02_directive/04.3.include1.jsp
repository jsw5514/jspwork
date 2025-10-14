<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 1.
  Time: 오후 3:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
        <%
            String name = request.getParameter("name");
        %>
</head>
<body>
    action include로 포함되는 페이지<br>
    <%=name%> Fighting!!!
</body>
</html>
