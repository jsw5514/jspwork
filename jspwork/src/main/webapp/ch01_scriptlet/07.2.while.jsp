<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 9. 30.
  Time: 오후 8:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String str = request.getParameter("msg");
        int count = Integer.parseInt(request.getParameter("count"));
        
        int i = 0;
        while(i<count){
            i++;
            out.print(String.format("%d. %s<br>",i,str));
        }
    %>
</body>
</html>
