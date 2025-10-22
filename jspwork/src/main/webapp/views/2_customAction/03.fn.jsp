<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 22.
  Time: 오후 3:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>JSTL Function Library</title>
</head>
<body>
    <h1>JSTL Function Library</h1>

    <c:set var="str" value="How are your?"/>
    
    str: ${str}<br><br>

    문자열의 길이 : ${str.length()}<br>
    문자열의 길이 : ${ fn:length(str)}<br><br>

    모두 대문자로 출력 : ${ fn:toUpperCase(str)}<br>
    모두 소문자로 출력 : ${ fn:toLowerCase(str)}<br><br>

    are의 시작 인덱스번호 : ${fn:indexOf(str,'are' )}<br>

    are를 were로 변경 ㅣ ${fn:replace(str, 'are', 'were')}<br>
    str : ${str}<br><br><!-- 원본은 유지-->

    <c:if test="${fn:contains(str, 'are')}">
        'are'가 포함되어 있음
    </c:if>
</body>
</html>
