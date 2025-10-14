<%@ page import="java.util.List" %>
<%@ page import="ch09_vote.vote.VoteList" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 13.
  Time: 오후 4:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="voteDao" class="ch09_vote.vote.VoteDao"/>
<%
    String numStr = request.getParameter("num");
    int num = Integer.parseInt(numStr!=null?numStr:"0");
    VoteList vote = voteDao.getVote(num);
    ArrayList<String> voteItems = voteDao.getItem(num); 
    int type = vote.getType();
%>
<script>
    console.log('<%=type%>');
</script>
<html>
<head>
    <title>vote jsp</title>
    <style>
        *{
            text-align: center;
            margin: auto;
        }
        body{
            width: 800px;
        }
        table{
            width: 100%;
        }
        a {
            float: right;
        }
        hr{
            clear: both;
        }
    </style>
</head>
<body>
    <div>
        <form action="${pageContext.request.contextPath}/ch09_vote/voteFormProc.jsp">
            <table>
                <tr>
                    <td colspan="2">Q:<%=vote.getQuestion()%></td>
                </tr>
                <%
                    for(String voteItem:voteItems){
                %>
                        <tr>
                            <td colspan="2"><input type='<%=type==1?"checkbox":"radio"%>' name="itemnum" value="<%=voteItem%>"><%=voteItem%></td>
                        </tr>
                <%
                    }
                %>
                <tr>
                    <td><input type="submit" value="투표"></td>
                    <td>
                        <input type="button" value="결과" 
                               onclick = "window.open('${pageContext.request.contextPath}/ch09_vote/voteView.jsp')">
                    </td>
                </tr>
            </table>
            <input type="hidden" name="num" value="<%=num%>">
        </form>
    </div>
</body>
</html>
