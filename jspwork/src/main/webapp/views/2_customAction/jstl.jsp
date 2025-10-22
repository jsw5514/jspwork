<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 21.
  Time: 오후 5:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>JSTL이란?</h1>

    <p>
        JSP Standard Tag Library<br>
        jsp 커스텀 액션 태그<br>
        자주 사용되는 코드를 쉽게 사용하기위한 표준 라이브러리<br>
    </p>

    <h3>JSTL 선언 방법</h3>
    <p>
        JSTL을 사용하고자 하는 페이지 상단에 taglib 지시어로 선언<br>
        
        &lt;%@ tablib prefix="접두어" uri="라이브러리 파일상의 uri 주소" %&gt;
    </p>

    <h4>1. JSTL Core Library</h4>
    <p>변수와 조건문, 반복문 등의 로직과 관련된 문법을 제공</p>
    <a href="${pageContext.request.contextPath}/views/2_customAction/01.core.jsp">core library</a>

    <br>

    <h4>2. JSTL Formatting Library</h4>
    <p>숫자, 날짜 및 시간 데이터의 출력 형식을 지정하는</p>
</body>
</html>
