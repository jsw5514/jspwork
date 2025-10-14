<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 1.
  Time: 오후 4:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = request.getParameter("name");
    String bloodType = request.getParameter("bloodType");
    String personalityA = "꼼꼼하고 책임감이 강함";
    String personalityB = "자유롭고 개성적임";
    String personalityAB = "논리적이고 차분함";
    String personalityO = "활발하고 사교적임";
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    Forward의 포워딩 되기 전의 페이지<br>
    
    <jsp:forward page='<%=bloodType%>.jsp'/>
</body>
</html>
