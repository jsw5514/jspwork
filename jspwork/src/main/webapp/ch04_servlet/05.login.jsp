<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 1.
  Time: 오후 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id = (String) session.getAttribute("idKey");
    if(id !=null){
        System.out.println("id 있음");
%>
    <%=id%>님 반갑습니다.
    <a href="05.logout.jsp">로그아웃</a>
<%
    }
    else{
%>
<h1>Login</h1>
<form method="POST" action="<%=application.getContextPath()%>/LoginServlet05">
    ID: <input type="text" name="id"><br>
    Password: <input type="password" name="pw"><br>
    <input type="submit" value="Submit">
</form>
<%
    }
%>
<script>
    console.log('id 출력중...')
    console.log('<%=session.getAttribute("idKey")%>')
</script>
</body>
</html>
