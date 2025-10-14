<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 10.
  Time: 오후 4:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Enumeration en = session.getAttributeNames();
    while (en.hasMoreElements()){
        String element = (String) en.nextElement();
        out.print(element+" : "+session.getAttribute(element));
        out.print("<br>");
    }
%>
id: <%=session.getAttribute("idKey")%><br>
pw: <%=session.getAttribute("pwKey")%>
</body>
</html>
