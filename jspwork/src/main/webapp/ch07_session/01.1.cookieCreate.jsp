<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 10.
  Time: 오후 3:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Cookie cookie = new Cookie("myCookie", "Apple");
    cookie.setValue("Banana");
    cookie.setMaxAge(60);//초단위
    response.addCookie(cookie);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>Cookie를 사용하여 연결 유지</h2>
    쿠키를 만듭니다.<br>
    쿠키 내용은 <a href="ch07_session/01.2.testCookie.jsp">클릭하세요</a>
</body>
</html>
