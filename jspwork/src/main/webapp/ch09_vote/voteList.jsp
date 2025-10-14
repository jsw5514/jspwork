<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 13.
  Time: 오후 5:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="ch09_vote.vote.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<jsp:useBean id="vDao" class="ch09_vote.vote.VoteDao"/>
<%
    
%>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" ></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <title>vote jsp</title>
    <style>
        * {margin: 0 auto; text-align: center;}
        div {width: 800px;}
        h2, h5, th {text-align:center;}
        a {text-decoration:none; color:black; cursor:pointer;}
        .m50 {margin-top:50px;}
        .m30 {margin-top:30px;}
        .voteList_item:hover {cursor: pointer;}
    </style>
</head>
<body>
    <div class="mx-auto">
        <h2 class="m50">투표 프로그램</h2>
        <hr>
    
        <h5 class="m30">설문폼</h5>
        <jsp:include page="/ch09_vote/voteForm.jsp"/>
        <hr>
    
        <h5 class="m30">설문리스트</h5>
        <table class="table m30">
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>시작일~종료일</th>
            </tr>
            <%
                List<VoteList> alist = vDao.getList();
                for(int i = 0; i<alist.size();i++){
                    VoteList voteList = alist.get(i);
                    int num = voteList.getNum();
                    String question = voteList.getQuestion();
                    String sdate = voteList.getSdate();
                    String edate = voteList.getEdate();

            %>
                    <tr class="voteList_item" onclick="location.href='${pageContext.request.contextPath}/ch09_vote/voteList.jsp?num=<%=num%>'">
                        <td><%=alist.size()-i%></td>
                        <td><%=question%>      </td>
                        <td><%=sdate%> ~ <%=edate%></td>
                    </tr>
            <%
                }

            %>
            <tr>
                <td colspan="3" align="right"><a href="${pageContext.request.contextPath}/ch09_vote/voteInsert.jsp">설문 작성하기</a><td>
            </tr>
        </table>
    </div>
</body>
</html>
