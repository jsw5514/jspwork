<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 10.
  Time: 오후 6:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Cookie[] cookies = request.getCookies();
    for(Cookie cookie:cookies){
        if(cookie.getName().equals("idKey")){
            cookie.setMaxAge(0);
        }
    }
%>
<html>
<head>
    <title>4.3 로그아웃 화면</title>
</head>
<body>
    <script type="text/javascript">
        alert("로그아웃 되었습니다.");
        location.href="${pageContext.request.contextPath}/ch07_session/04.1.cookieLogin.jsp"
    </script>
</body>
</html>
