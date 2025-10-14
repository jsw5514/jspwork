<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 10.
  Time: 오후 4:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.setAttribute("idKey", "tjoeun");
    session.setAttribute("pwKey","1234");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    세션이 생성됨<br>
    세션 정보는 <a href="ch07_session/03.2.%20sessionCreate.jsp">클릭하세요</a>
</body>
</html>
