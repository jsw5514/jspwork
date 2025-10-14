<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 14.
  Time: 오후 3:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="vDao" class="ch09_vote.vote.VoteDao"/>
<%
    String numStr = request.getParameter("num");
    int num = Integer.parseInt(numStr!=null?numStr:"0");
    String[] itemnum = request.getParameterValues("itemnum");
    
    boolean isCounted = vDao.updateCount(num,itemnum);
    String msg = "투표가 등록되지 않았습니다.";
    if (isCounted){
        msg = "투표가 정상적으로 등록되었습니다.";
    }
%>
<script>
    alert("<%=msg%>");
    location.href = "${pageContext.request.contextPath}/ch09_vote/voteList.jsp?num=<%=num%>";
</script>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
