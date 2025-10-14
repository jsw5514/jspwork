<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 10.
  Time: 오후 3:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.addCookie(new Cookie("Name","김지원"));
    response.addCookie(new Cookie("Age","23"));
    response.addCookie(new Cookie("Gender","Male"));
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    쿠키생성<br>
    쿠키 내용은 <a href="ch07_session/02.2.testCookies.jsp">클릭하세요</a>
</body>
</html>
