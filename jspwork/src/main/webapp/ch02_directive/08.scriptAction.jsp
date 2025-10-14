<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 1.
  Time: 오후 5:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>스크립트를 대체하는 액션태그</h1>
<%--    <%!%>--%>
    <jsp:declaration>
        int max(int a, int b) {
            return a>b?a:b;
        }
    </jsp:declaration>

<%--    <%%>--%>
    <jsp:scriptlet>
        int num = 5;
    </jsp:scriptlet>

<%--    <%=%>--%>
    <jsp:expression>
        max(3,5)
    </jsp:expression>
</body>
</html>
