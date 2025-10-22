<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 21.
  Time: 오후 3:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1> EL(Expression Language) </h1>
    <p>
        기존에 사용했던 표현식(출력식 &lt;%=변수명 %&gt;)<br>
        jsp상에서 표현하고자 하는 값을 \${변수명}의 형식으로 표현하여 작성하는 것
    </p>
    <h3><a href="el.do">01.EL 구문</a></h3>
    <h3><a href="operation.do">02.EL의 연산자</a></h3>

    <hr>
<%--
    jsp 구성요소
    1. 스크립팅 원소: jsp 페이지에서 자바코드를 직접 기술할 수 있게하는 기능
                    ex) 스크립틀릿, 표현식 등
    2. 지시어: jsp 페이지 정보에 대한 내용을 표현하거나 다른 페이지를 포함시킬때 사용
              jsp 기능을 확장시키는 라이브러리 등록도 가능
              ex) page, include, taglib 등
    3. 액션태그: 표준 액션태그와 커스텀 액션태그로 나뉨
                jsp 페이지에서 어떤 동작을 하도록 지시하는 태그
                xml을 이용하여 jsp 문법 확장 가능
        >>표준 액션 태그: jsp 페이지에서 바로 사용 가능
                        모든 태그명 앞에 jsp: 접두어 붙음
--%>
    <h1>JSP Action Tag</h1>
    <p>xml을 이용하여 기존의 jsp 문법을 확장시키는 기술을 제공하는 태그들</p>
    <h3>커스텀 액션 태그</h3>
    <a href="${pageContext.request.contextPath}/views/2_customAction/jstl.jsp">JSTL</a>
</body>
</html>
