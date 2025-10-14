<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 10.
  Time: 오후 6:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="mem" class="oracleDB.MemberPool"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    if(mem.loginMem(id,pw)){
        session.setAttribute("id",id);
%>
        <script language="JavaScript">
            alert("로그인 성공");
            location.href = "/ch07_session/05.3.sessionLoginOK.jsp"
        </script>
<%
    }
    else{
%>
        <script language="JavaScript">
            alert("로그인 실패");
            location.href = "/ch07_session/05.1.sessionLogin.jsp"
        </script>
<%
    }
%>
</body>
</html>
