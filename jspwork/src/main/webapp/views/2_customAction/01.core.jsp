<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 21.
  Time: 오후 6:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" import="ch13_el_jstl.com.study.dto.Person"%>
<html>
<head>
    <title>JSTL Core Library</title>
</head>
<body>
    <h1>JSTL Core Library</h1>

    <h3>1. 변수(속성 == attribute)</h3>
    <h4>1.1 변수 선언과 초기화</h4>
    <pre>
        변수 선언과 동시에 초기화
    </pre>
    <c:set var="num1" value="10"/>
    <c:set var="num2" value="20" scope="request"/>

    num1 변수의 값 : ${num1}<br>
    num2 변수의 값 : ${num2}<br>

    <%--이러면 문자열 취급--%>
    <c:set var="result" value="num1+num2"/>
    <%--이래야 덧셈 가능--%>
    <c:set var="result" value="${num1+num2}" scope="session"/>
    
    result: ${result}<br>

    pageScope.num1 : ${pageScope.num1}<br>
    requestScope.num2 : ${requestScope.num2}<br>
    sessionScope.result: ${sessionScope.result}<br>

    <c:set var="result" scope="request">999999999</c:set>

    requestScope.result: ${requestScope.result}<br>

    <h4>1.2 변수 삭제</h4>
    <pre>
        지정한 스코프에서 변수를 찾아서 삭제
        스코프 미지정시 모든 스코프에서 해당 변수 삭제
    </pre>
    삭제전<br>
    pageScope: ${pageScope.result}<br>
    requestScope: ${requestScope.result}<br>
    sessionScope: ${sessionScope.result}<br><br>
    
    <c:remove var="result" scope="request"/>

    삭제 후<br>
    pageScope: ${pageScope.result}<br>
    requestScope: ${requestScope.result}<br>
    sessionScope: ${sessionScope.result}<br><br>

    <h4>1.3 변수 출력</h4>
    <pre>
        변수 출력
    </pre>
    <span>num1 출력</span><br>
    <c:out value="${num1}"/><br>
    <c:out value="${num1}" default="없음"/><br><br>
    
    <span>&lt;b&gt;내용&lt;/b&gt; 출력</span><br>
    <c:out value="<b>내용</b>"/><br>
    <c:out value="<b>내용</b>" escapeXml="false"/><br><br>

    <h3>2. 조건문 if</h3>
    <pre>
        test로 조건식 입력
    </pre>
    <c:if test="${num1 > num2}">
        <b>num1이 num2보다 크다</b>
    </c:if>
    <c:if test="${num1 <= num2}">
        <b>num1이 num2보다 작거나 같다</b>
    </c:if>

    <h3>3. 조건문 choose</h3>
    <pre>
        if-else 역할
    </pre>
    
    <c:choose>
        <c:when test="${num1 gt 20}">
            <b>20보다 큰 숫자</b>
        </c:when>
        <c:when test="${num1 ge 10}">
            <b>20보다 작고 10보다 크거나 같은 숫자</b>
        </c:when>
        <c:otherwise>
            <b>10보다 작은 숫자</b>
        </c:otherwise>
    </c:choose>

    <h3>4. 반복문-forEach</h3>
    <c:forEach var="i" begin="1" end="10" step="2">
        반복중... loop#${i}<br>
    </c:forEach>
    
    <c:forEach var="i" begin="1" end="6">
        <h${i}>태그 안에서도 사용 가능</h${i}><br>
    </c:forEach>

    <c:set var="colors">
        red, yellow, green, pink
    </c:set>
    colors 변수값 : ${colors}<br>
    <ul>
        <c:forEach var="c" items="${colors}">
            <li style="color:${c}">${c}</li>
        </c:forEach>
    </ul>

    <%
        ArrayList<Person> list = new ArrayList<>();
        list.add(new Person("이하늘", 24, "여자"));
        list.add(new Person("김도윤", 27, "남자"));
        list.add(new Person("박소연", 22, "여자"));
    %>
    <c:set var="pList" value="<%=list%>" scope="request"/>
    <table border="1">
        <thead>
            <tr>
                <th>index</th>
                <th>count</th>
                <th>이름</th>
                <th>나이</th>
                <th>성별</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${empty pList}">
                    <tr>
                        <td colspan="5">조회된 사람이 없습니다</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="p" items="${pList}" varStatus="status">
                        <tr>
                            <td>${status.index}</td>
                            <td>${status.count}</td>
                            <td>${p.name}</td>
                            <td>${p.age}</td>
                            <td>${p.gender}</td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
<br><br>
    
    <h3>5. 반복문 forTokens</h3>

    <c:set var="device" value="컴퓨터,핸드폰,TV.에어컨/냉장고.세탁기"/>
    <ol>
        <c:forTokens var="d" items="${device}" delims=",./">
            <li>${d}</li>
        </c:forTokens>
    </ol>
    
    <h3>6. url, 쿼리 스트링 관련</h3>
    <c:url var="u" value="/ch10_board/list.jsp">
        <c:param name="nowPage" value="1"/>
        <c:param name="num">2</c:param>
    </c:url>
    <a href="${u}">c:url 이용한 링크</a>
</body>
</html>
