<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 1.
  Time: 오후 7:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" buffer="4kb" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int totalBuffer = out.getBufferSize();
    int remainBuffer = out.getRemaining();
    int usedBuffer = totalBuffer - remainBuffer;
%>
버퍼의 총 크기 : <%=totalBuffer%>byte<br>
남은 버퍼 크기 : <%=remainBuffer%>byte<br>
사용한 버퍼크기 : <%=usedBuffer%>byte<br>

</body>
</html>
