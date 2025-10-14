<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 10.
  Time: 오후 3:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Map<String,String> cookieMap = new HashMap<>();  
    Cookie[] cookies = request.getCookies();
    if(cookies != null){
        for(Cookie cookie:cookies){
            cookieMap.put(cookie.getName(),cookie.getValue());
            out.print("Cookie Name :"+cookie.getName()); out.print("<br>");
            out.print("Cookie Value :"+cookie.getValue()); out.print("<hr>");
        }
    }
%>
이름:<%=cookieMap.get("Name")%><br>
나이:<%=cookieMap.get("Age")%><br>
성별:<%=cookieMap.get("Gender")%><br>
</body>
</html>
