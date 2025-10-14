<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 9. 30.
  Time: 오후 6:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        float f = 4.67f;
        int num = Math.round(f);
        Date date = new Date();
        int hour = date.getHours();
        int i = 1;
        int j = 3;
    %>
    <%!
        int max(int... nums){
            int max = Integer.MIN_VALUE;
            for(int num: nums){
                if(max<num){
                    max=num;
                }
            }
            return max;
        }
    %>
    실수 <%=f%>를 반올림한 값 : <%=num%><br>
    현재 날짜와 시간: <%=date%><br>
    두 수중 큰 값 : <%=max(8, 3)%><br>
    두 수중 큰 값 : <%=max(i, j)%><br>
    지금은 오전/오후 중 <%=hour<13?"오전":"오후"%>
</body>
</html>
