<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 10.
  Time: 오후 7:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id = (String) session.getAttribute("id");
%>
    <h2>Session Login Page</h2>
    <%=id%>님이 로그인 하였습니다.
    <a href="${pageContext.request.contextPath}/ch07_session/05.4.sessionLogout.jsp">로그아웃</a>
</body>
</html>
