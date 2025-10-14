<%@ page import="ch09_vote.vote.VoteList" %>
<%@ page import="java.util.List" %>
<%@ page import="ch09_vote.vote.VoteItem" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Random" %><%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 14.
  Time: 오후 4:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="vDao" class="ch09_vote.vote.VoteDao"/>
<%
    String numStr = request.getParameter("num");
    int num = Integer.parseInt(numStr!=null?numStr:"0");
    VoteList vlist = vDao.getVote(num);
    int sum = vDao.sumCount(num);
    ArrayList<VoteItem> viewList = vDao.getView(num);
    
    Random random = new Random();
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div>
        <table>
            <tr>
                <th colspan="4">Q: <%=vlist.getQuestion()%></th>
            </tr>
            <tr>
                <td colspan="4">총 투표자 : <%=sum%></td>
            </tr>
            <tr>
                <td>
                    <%
                        for(VoteItem view :viewList){
                            String[] item = view.getItem();
                            out.print(item[0]);
                            
                            int rgb = random.nextInt(255*255*255);
                            String rgbHex = "#"+Integer.toHexString(rgb);
                            int ratio = (int)(view.getCount() / (double)sum*100);

                    %>
                            <%=view.getCount()%>
                    <%
                        }
                    %>
                </td>
            </tr>

        </table>
    </div>
</body>
</html>
