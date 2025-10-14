<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 1.
  Time: 오후 7:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Application Ex</h1>
    서블릿 컨테이너의 이름과 버전: <%=application.getServerInfo()%><br>
    05.1.session.html 파일의 MIME type: <%=application.getMimeType("05.1.session.html")%><br>
    웹 어플리케이션의 url 경로: <%=application.getContextPath()%><br>
    로컬 파일 시스템의 경로: <%=application.getRealPath("/")%>
    <% application.log("앱 내부 로그 출력 테스트"); %>
</body>
</html>
