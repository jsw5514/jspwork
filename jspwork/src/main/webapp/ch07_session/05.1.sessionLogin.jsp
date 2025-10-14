<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 10.
  Time: 오후 5:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>4.1 로그인 화면</title>
</head>
<body>
    <h1>Cookie 로그인</h1>
    <form action="${pageContext.request.contextPath}/ch07_session/05.2.sessionLoginProc.jsp" method="post">
        <table border="1">
            <tr>
                <th colspan="2">Login</th>
            </tr>
            <tr>
                <th>ID</th>
                <td><input name="id" required></td>
            </tr>
            <tr>
                <th>pw</th>
                <td><input type="password" name="pw" required></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="login">
                    <input type="reset">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
