<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 10.
  Time: 오후 6:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>4.3 로그인 성공화면</title>
</head>
<body>
    <h2>Cookie Login Page</h2>
<%
    String id = "";
    Cookie[] cookies = request.getCookies();
    for(Cookie cookie:cookies){
        if(cookie.getName().equals("idKey")){
            id = cookie.getValue();
        }
    }
%>
    <%=id%>님이 로그인하였습니다.
    <a href="${pageContext.request.contextPath}/ch07_session/04.3.cookieLogout.jsp">로그아웃</a>
</body>
</html>
