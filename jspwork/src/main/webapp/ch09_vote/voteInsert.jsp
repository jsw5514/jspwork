<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 13.
  Time: 오후 4:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            border-collapse: collapse;
            border-bottom: solid 1px lightgray;
            width: 100%;
            float: left;
        }
        th,td{
            border-bottom: solid 1px lightgray;
        }
    </style>
</head>
<body>
    <h1>투표 프로그램</h1>
    <hr>
    <h2>설문작성</h2>
    <form action="${pageContext.request.contextPath}/ch09_vote/voteInsertProc.jsp" method="post">
        <table>
            <tr>
                <th>질문</th>
                <th colspan="2">q:<input name="question"></th>
            </tr>
            
            <%
                for(int i=1;i<=4;i++){
            %>
                <tr>
                    <%if (i==1){%><td rowspan="7">항목</td><%}%>
                    <td><%=2*i-1%>:<input name="item"></td>
                    <td><%=2*i%>  :<input name="item"></td>
                </tr>
            <%
                }
            %>
            <tr>
                <td>시작일</td>
                <td colspan="2">
                    <select name="sdateY">
                        <% for(int i=2025; i<=2034;i++){ %>
                            <option value="<%=i%>"><%=i%></option>
                        <% } %>
                    </select>년
                    <select name="sdateM">
                        <% for(int i=1; i<=12;i++){ %>
                            <option value="<%=i%>"><%=i%></option>
                        <% } %>
                    </select>월
                    <select name="sdateD">
                        <% for(int i=1; i<=31;i++){ %>
                            <option value="<%=i%>"><%=i%></option>
                        <% } %>
                    </select>일
                </td>
            </tr>
            <tr>
                <td>종료일</td>
                <td colspan="2">
                    <select name="edateY">
                        <% for(int i=2025; i<=2034;i++){ %>
                            <option value="<%=i%>"><%=i%></option>
                        <% } %>
                    </select>년
                    <select name="edateM">
                        <% for(int i=1; i<=12;i++){ %>
                            <option value="<%=i%>"><%=i%></option>
                        <% } %>
                    </select>월
                    <select name="edateD">
                        <% for(int i=1; i<=31;i++){ %>
                            <option value="<%=i%>"><%=i%></option>
                        <% } %>
                    </select>일
                </td>
            </tr>
            <tr>
                <td>이중답변</td>
                <td>
                    <input type="radio" name="type" value="1">yes
                    <input type="radio" name="type" value="0">no
                </td>
            </tr>
            <tr>
                <td colspan=3 class="cen">
                    <input type="submit" value="작성하기">&emsp;
                    <input type="reset" value="다시쓰기">&emsp;
                    <input type="button" value="리스트" onclick="location.href='voteList.jsp'">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
