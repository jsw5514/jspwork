<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 1.
  Time: 오후 6:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Request Method</h1>
    프로토콜 : <%=request.getProtocol()%><br>
    서버의 이름 : <%=request.getServerName()%><br>
    서버의 포트번호 : <%=request.getServerPort()%><br>
    클라이언트 주소 : <%=request.getRemoteAddr()%><br>
    클라이언트 이름 : <%=request.getRemoteHost()%><br>
    요청 경로(URI) : <%=request.getRequestURI()%><br>
    요청 경로(URL) : <%=request.getRequestURL()%><br>
    사용중인 브라우저: <%=request.getHeader("User-Agent")%><br>
    파일 타입 : <%=request.getHeader("Accept")%>
</body>
</html>
