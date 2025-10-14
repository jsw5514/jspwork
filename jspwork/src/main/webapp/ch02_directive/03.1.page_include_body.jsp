<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 9. 30.
  Time: 오후 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>body</title>
    <style>
        .body{
            height: 200px;
            line-height: 200px;
            background-color: orange;
        }
        .hf{
            background-color: aquamarine;
        }
    </style>
</head>
<body>
    <%@ include file="03.2.page_include_header.jsp"%>
    <div class="body">include 지시자의 body</div>
    <%@ include file="03.3.page_include_footer.jsp"%>
</body>
</html>
