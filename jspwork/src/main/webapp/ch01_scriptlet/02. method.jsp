<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 9. 30.
  Time: 오후 5:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%!
        int one = 1;
        int two = 2;
        //메소드는 선언문에서만 선언 가능
        public int plusMethod(int one, int two){
            return one + two;
        }
        String msg;
    %>
    3과 5의 합? <%=plusMethod(3,5)%>
    one의 값? <%=one%>
    two의 값? <%=two%>
    one과 two의 합은? <%=plusMethod(one, two)%><br>
    msg의 값? <%=msg%>
</body>
</html>
