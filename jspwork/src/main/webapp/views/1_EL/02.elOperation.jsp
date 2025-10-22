<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 21.
  Time: 오후 4:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h3>1. 산술 연산</h3>
    기존방식: <%=(Integer)request.getAttribute("big") + (Integer)request.getAttribute("small")%>
    <br><br>

    10 + 3 = ${big + small}<br>
    10 - 3 = ${big - small}<br>
    10 * 3 = ${big * small}<br>
    10 / 3 = ${big / small} 또는 ${big div small}<br>
    10 % 3 = ${big % small} 또는 ${big mod small}<br>

    <h3>2. 대소 비교</h3>
    10 > 3 ${big > small} 또는 ${big gt small}<br>
    10 < 3 ${big < small} 또는 ${big lt small}<br>
    10 >= 3 ${big >= small} 또는 ${big ge small}<br>
    10 <= 3 ${big <= small} 또는 ${big le small}<br>

    <h3>3. 동등 비교 연산</h3>
    <!--el의 ==는 java의 equals와 동일한 동작-->
    sOne과 sTwo는 일치하는가? ${ sOne == sTwo } 또는 ${sOne eq sTwo}<br>
    sOne과 sTwo는 일치하지 않는가? ${ sOne != sTwo } 또는 ${sOne ne sTwo}<br>

    big == 10? ${big == 10} 또는 ${big eq 10}<br>

    sThree == '안녕?' ${sThree == '안녕?'} 또는 ${sThree eq '안녕?'}<br>

    <h3>4. 객체가 null인지 또는 리스트가 비어있는지 확인</h3>
    empty는 일반객체는 null이면 true, 리스트가 비어있으면 true
    pOne이 null인지? ${pOne == null} 또는 ${pOne eq null} 또는 ${empty pOne}<br>
    pTwo이 null인지? ${pTwo == null} 또는 ${pTwo eq null} 또는 ${empty pTwo}<br>
    pOne이 null이 아닌지? ${pOne != null} 또는 ${pOne ne null} 또는 ${not empty pOne}<br>

    aOne이 비어있는지? ${empty aOne}

    <h3>5. 논리연산자</h3>
    true and true: ${true && true} 또는 ${true and true}
    false of true: ${false || true} 또는 ${false or true}

    <h3>문제: big이 small보다 크고 aOne이 비어있는가?</h3>
    ${big>small and empty aOne}
</body>
</html>
