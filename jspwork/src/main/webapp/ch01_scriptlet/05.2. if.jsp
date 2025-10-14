<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 9. 30.
  Time: 오후 7:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        String name = request.getParameter("name");
        String color = request.getParameter("color");
        String msg;
        
        if(color.equals("blue")) {
            msg = "파란색";
        }
        else if(color.equals("green")){
            msg = "초록색";
        } else if (color.equals("red")) {
            msg = "빨간색";
        }
        else{
            msg = "기타";
            color = "aquamarine";
        }
    %>
</head>
<body style="background-color: <%=color%>">
<b><%=name%></b>님이 좋아하는 색상은 <b><%=color%></b>입니다.
    <h1><%=color%></h1>
</body>
</html>
