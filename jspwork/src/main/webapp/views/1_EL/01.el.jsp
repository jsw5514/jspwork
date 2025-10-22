<%@ page import="ch13_el_jstl.com.study.dto.Person" %><%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 21.
  Time: 오후 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h3>1. 기존 방식대로 스크립트릿과 표현식을 이용하여 각 scope에 담겨있는 값 출력하기</h3>
    <%
        //request scope
        String classRoom = (String) request.getAttribute("classRoom");
        Person student = (Person) request.getAttribute("student");
        
        //session scope
        String academy = session.getAttribute("academy").toString();
        String teacher = session.getAttribute("teacher").toString();
    %>
    <p>
        학원명 : <%=academy%><br>
        강의장 정보 : <%=classRoom%><br>
        강사 정보 : <%=teacher%><br>
        수강생 정보
        <ul>
            <li>이름: <%=student.getName()%></li>
            <li>나이: <%=student.getAge()%></li>
            <li>성별: <%=student.getGender()%></li>
        </ul>
    </p>
    
    <h3>2. EL을 이용하여 scope에 저장된 값 출력하기</h3>
    <%--위의 student 선언이 없어도 EL은 문제없이 작동함(request에서 자동으로 student를 키로 하는 객체를 찾아서 반환--%>
    <p>
        학원 정보 : $${academy}<br>
        강의장 정보 : ${classRoom}<br>
        강사 정보 : ${teacher}<br>
        수강생 정보
        <ul>
            <li>이름: ${student.name}</li>
            <li>나이: ${student.age}</li>
            <li>성별: ${student.gender}</li>
        </ul>
    </p>

    <h3>3. EL사용시 내장 객체의 키값이 동일한 경우</h3>
    <!--제일 작은 scope부터 차례로 탐색, 작은 scope가 우선됨-->
    scope 값 : ${scope}
    <!--모든 scope를 다 확인해도 없으면 아무 값도 반환하지 않음(오류는 안 생김)-->

    <h3>4. 직접 scope를 지정하여 접근하기</h3>
    <%
        pageContext.setAttribute("scope","page");
    %>
    pageScope 값: ${scope} 또는 ${pageScope.scope}<br>
    requestScope 값: ${requestScope.scope}<br>
    sessionScope 값: ${sessionScope.scope}<br>
    applicationScope 값: ${applicationScope.scope}<br>

    잘못된 scope를 지정하면 데이터가 출력되지 않음
    classroom(pageScope) : ${pageScope.classroom}<br>
</body>
</html>
