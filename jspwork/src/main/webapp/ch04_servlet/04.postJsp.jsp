<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 1.
  Time: 오후 9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Post Servlet 방식</h1>
<form action="PostServlet" method="post">
    ID: <input type="text" name="id"><br>
    PW: <input type="password" name="pw"><br>
    EMAIL: <input type="email" name="email"><br>
    <input type="submit" value="회원가입">
</form>
</body>
</html>
