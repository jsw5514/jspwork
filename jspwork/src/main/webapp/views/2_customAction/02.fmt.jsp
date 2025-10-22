<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 21.
  Time: 오후 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h3>1. formatNumber</h3>
    <p>
        숫자 데이터의 포맷(형식) 지정
        - 표현하고자 하는 숫자데이터의 형식을 통화기호, %등 원하는 쓰임에 맞게 형식을 지정하는 태그
    </p>
    
    <c:set var="num1" value="123456789"/>
    <c:set var="num2" value="0.75"/>
    <c:set var="num3" value="50000"/>

    그냥 출력 : ${num1}<br>
    세자리마다 구분하여 출력 : <fmt:formatNumber value="${num1}"/><br>
    숫자 그대로 출력 : <fmt:formatNumber value="${num2}" groupingUsed="false"/><br>

    percent : <fmt:formatNumber value="${num2}" type="percent"/><br>
    currency : <fmt:formatNumber value="${num3}" type="currency"/><br>
    currency : <fmt:formatNumber value="${num3}" type="currency" currencySymbol="$"/><br>
    currency : <fmt:formatNumber value="${num3}" type="currency" currencySymbol="£"/><br>

    <h3>2. formatDate</h3>
    <p>날짜 및 시간 데이터의 포맷지정(단, java.util.Date 객체 사용)</p>

    <c:set var="current" value="<%=new Date()%>"/>
    출력: <br>
    <ul>
        <li>현재 날짜 : <fmt:formatDate value="${current}"/></li><!--타입 생략시 기본값 date-->
        <li>현재 시간 : <fmt:formatDate value="${current}" type="time"/></li>
        <li>현재 날짜와 시간 : <fmt:formatDate value="${current}" type="both"/></li><!--스타일 생략시 기본값 medium-->
        <li>Medium : <fmt:formatDate value="${current}" type="both" dateStyle="medium" timeStyle="medium"/></li>
        <li>Long : <fmt:formatDate value="${current}" type="both" dateStyle="long" timeStyle="long"/></li>
        <li>Full : <fmt:formatDate value="${current}" type="both" dateStyle="full" timeStyle="full"/></li>
    </ul>

    
    
</body>
</html>
