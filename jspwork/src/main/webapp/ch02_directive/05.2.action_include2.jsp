<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 1.
  Time: 오후 3:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String siteName = request.getParameter("siteName");
    String siteTel = request.getParameter("siteTel");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Action Include Tag Ex2</h1>
    <jsp:include page="05.3.action_include2.jsp">
        <jsp:param name="siteName" value="naver"/>
        <jsp:param name="siteTel" value="031-123-3456"/>
    </jsp:include>
    <%=siteName%><br>
    <%=siteTel%><br>
</body>
</html>
