<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 10.
  Time: 오후 9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="memberDAO" class="ch08_member.MemberDAO"/>
<html>
<head>
    <title>idCheck</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    if(memberDAO.checkId(id)){
        //id가 중복되었습니다.
        out.print(String.format("%s는 이미 존재하는 id 입니다.",id));
    }
    else{
        //사용 가능한 id 입니다.
        out.print(String.format("%s는 사용 가능한 id 입니다.",id));
    }
%><br>
    <span style="cursor: pointer" onclick="self.close()">닫기</span>
</body>
</html>
