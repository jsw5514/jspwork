<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 9. 30.
  Time: 오후 9:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>0으로 나눌 수 없습니다</h1>
예외타입: <%=exception.getClass()%>
예외메시지: <%=exception.getMessage()%>
</body>
</html>
