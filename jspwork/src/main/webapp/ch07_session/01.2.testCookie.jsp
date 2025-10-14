<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 10.
  Time: 오후 3:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cookie 사용</title>
</head>
<body>
<%
    Cookie[] cookies = request.getCookies();
    if(cookies != null){
        for(Cookie cookie:cookies){
            if(cookie.getName().equals("myCookie")){
%>
쿠키 이름: <%=cookie.getName()%>
쿠키 값: <%=cookie.getValue()%>
<%
            }
        }
    }
%>
</body>
</html>
