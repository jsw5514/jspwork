<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 1.
  Time: 오후 3:19
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
    <h1>Action Include Tag</h1>

    <jsp:include page="04.3.include1.jsp"></jsp:include><br>
    action include의 첫번째 페이지<br>
    <%=name%>
</body>
</html>
