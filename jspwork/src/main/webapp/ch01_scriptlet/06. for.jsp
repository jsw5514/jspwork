<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 9. 30.
  Time: 오후 7:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int sum = 0;
    StringBuilder msgBuilder = new StringBuilder();
    for(int i = 1; i<=10;i++){ //1+2+...+10+
        sum+=i;
        msgBuilder.append(i);
        msgBuilder.append("+");
    }
    msgBuilder.setLength(msgBuilder.length()-1); //마지막 + 제거
    msgBuilder.append("=");
    msgBuilder.append(sum);
%>
<%=msgBuilder.toString()%>

<%
    int[] intArr = new int[10];
    for(int i = 0; i<intArr.length; i++){
        intArr[i] = i+1;
        out.print(intArr[i] + " ");
    }
%>
</body>
</html>
