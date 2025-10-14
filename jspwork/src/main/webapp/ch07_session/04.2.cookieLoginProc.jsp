<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 10.
  Time: 오후 5:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="mem" class="oracleDB.MemberPool"/>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    
    boolean logined = mem.loginMem(id,pw);
    if(logined){
        //로그인 성공
        response.addCookie(new Cookie("idKey",id));
%>
        <script>
            alert("로그인이 되었습니다");
            location.href = "04.3.sessionLoginOK.jsp"
        </script>
<%
    }
    else{
        //로그인 실패
%>
        <script>
            alert("로그인 실패");
            location.href = "04.1.cookieLogin.jsp"
        </script>
<%
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
