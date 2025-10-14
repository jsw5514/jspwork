<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 13.
  Time: 오후 6:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="vDao" class="ch09_vote.vote.VoteDao"/>

<jsp:useBean id="vlist" class="ch09_vote.vote.VoteList"/>
<jsp:setProperty name="vlist" property="*"/>

<jsp:useBean id="vitem" class="ch09_vote.vote.VoteItem"/>
<jsp:setProperty name="vitem" property="*"/>
<%
    StringBuilder date = new StringBuilder();
    date.append(request.getParameter("sdateY"));
    date.append("-");
    date.append(request.getParameter("sdateM"));
    date.append("-");
    date.append(request.getParameter("sdateD"));
    String sdate = date.toString();

    date.setLength(0);
    date.append(request.getParameter("edateY"));
    date.append("-");
    date.append(request.getParameter("edateM"));
    date.append("-");
    date.append(request.getParameter("edateD"));
    String edate = date.toString();
    
    vlist.setSdate(sdate);
    vlist.setEdate(edate);
    
    boolean result = vDao.voteInsert(vlist,vitem);
    
    String msg = result?"설문이 추가 되었습니다":"설문 추가를 실패했습니다.";
    String url = result?"voteList.jsp":"voteInsert.jsp";
%>
<script>
    alert("<%=msg%>");
    location.href="${pageContext.request.contextPath}/ch09_vote/<%=url%>"
</script>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
