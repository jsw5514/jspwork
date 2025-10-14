<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
    <%! 
        //표현식보다 아래에 선언문을 작성해도 먼저 실행됨
        String name = "더조은";
        int num = 8;
    %>
    <!-- html 주석 -->
    학원 이름은 <%=name%><br>
    강의실은 <%=num%>층 입니다.<br><br>
    <%
        //java 주석
        String name2 = team+" 강좌";
    %>
    <%=name2%>
    <%!
        String team = "java 풀스택";
    %>
<%--    jsp 주석--%>
<%--    html과 jsp가 섞인 경우 사용--%>
</body>
</html>