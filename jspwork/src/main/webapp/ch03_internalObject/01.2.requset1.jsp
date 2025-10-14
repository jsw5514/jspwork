<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 1.
  Time: 오후 5:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = request.getParameter("name");
    String studentNum = request.getParameter("studentNum");
    String gender = request.getParameter("gender");
    String major = request.getParameter("major");
    String[] hobby = request.getParameterValues("hobby");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    이름: <%=name%>
    학번: <%=studentNum%>
    성별: <%=gender%>
    학과: <%=major%>
    취미: 
    <%
        StringBuilder msg = new StringBuilder();
        for(String oneHobby:hobby){
            msg.append(oneHobby);
            msg.append(", ");
        }
        msg.setLength(msg.length()-2);
        out.print(msg);
    %>
</body>
</html>
