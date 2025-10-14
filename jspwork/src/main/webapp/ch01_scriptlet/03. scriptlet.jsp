<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 9. 30.
  Time: 오후 5:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String name = "한철민";
        int num = 3;
        boolean bool = false;
        double douNum = 3.14;
    %>
    나의 이름은 <%=name%>입니다.<br>
    <%=num%>학년 입니다<br>
    재학중 입니까? <%=bool%><br>
    원주율은 <%=douNum%>입니다.
    <%=application.getRealPath("/")%>
</body>
</html>
