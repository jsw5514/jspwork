<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 1.
  Time: 오후 7:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String season = request.getParameter("season");
    String fruit = request.getParameter("fruit");
    
    String id = (String) session.getAttribute("id");
    String sessionId = session.getId();
    int intervalTime = session.getMaxInactiveInterval();
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    if(id!=null){
%>
        <h1>Session Ex</h1>
        <%=id%>님이 좋아하는 계절과 과일은 <%=season%>과 <%=fruit%>입니다.<br>
        세션 ID:<%=sessionId%><br>
        세션 유지시간:<%=intervalTime%>
<%
    }
    else {
        out.print("세션이 만료되었습니다. 다시 로그인해주세요.");
    }
%>
</body>
</html>
