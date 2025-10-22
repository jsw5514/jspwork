<%@ page import="java.util.List" %>
<%@ page import="ch10_board.BoardItem" %><%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 14.
  Time: 오후 8:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="boardDao" class="ch10_board.BoardDAO"/>
<%
    int totalRecord = 0;    //총 레코드 수(총 게시글 수)
    int numPerPage = 10;    //페이지 당 레코드수([1]로 표현되는 페이지 하나)
    int pagePerBlock = 5;   //블록 당 페이지수([1][2]...[5]로 표현되는 묶음 1개)
    
    int totalPage = 0;      //총 페이지 수
    int totalBlock = 0;     //총 블록 수
    
    int nowPage = 1;        //현재 페이지 번호
    int nowBlock = 1;       //현재 블록 번호
    
    int start = 0;          //DB에서 select 시작번호
    int end = 0;            //DB에서 select 끝번호
    int listSize = 0;       //현재 읽어온 레코드 수


    String keyWord = request.getParameter("keyWord");
    String keyField = request.getParameter("keyField");
    keyWord = keyWord==null?"":keyWord;
    keyField = keyField==null?"":keyField;
    
    totalRecord = boardDao.getTotalRecord(keyWord,keyField);
    totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
    totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
    nowBlock = (int)Math.ceil((double) nowPage / pagePerBlock);
    
    /*
    페이지 계산식 설명
    start 계산
    nowPage는 현재 페이지 번호, numPerPage는 페이지 당 게시글 수이다.
    nowPage는 1로 시작하는 index(1-based index)로 직관적으로 생각했을때 numPerPage와 곱하면 현재 페이지의 게시글 번호가 나온다.
    하지만 nowPage가 1로 시작하므로(1-base라서) 첫 페이지의 첫 게시글이 numPerPage만큼 벌어지는 오차가 생긴다.
    ex) nowPage=1, numPerPage=10이면 첫 페이지의 첫 게시글 번호는 nowPage * numPerPage = 10이 된다.
    nowPage에서 1을 빼서 0으로 시작하는 인덱스를 얻어야 게시글의 0-base index를 얻을 수 있다.
    하지만 게시글은 1-base index로 관리하므로 여기서 다시 1을 더해야 게시글의 1-base index를 얻을 수 있는 것이다.
    
    end 계산
    페이지의 마지막 게시글 번호는 start~end까지의 게시글 갯수가 numPerPage와 같게 계산하면 된다.
    ex) nowPage=1, numPerPage=10이면 1 + 10 - 1 = 10  즉, 1~10번까지 총 10개의 게시글을 가져오게 된다.
     */
    start = (nowPage-1) * numPerPage + 1; 
    end = start + numPerPage - 1;
    
    if(request.getParameter("reload") != null){
        keyField = "";
        keyWord = "";
    }
    
    List<BoardItem> boardItemList = boardItemList = boardDao.getBoardItems(keyField, keyWord, start, end);
%>
<script>
    function list(){
        document.listFrm.submit();
    }
    function read(num){
        document.readFrm.num.value = num;
        document.readFrm.submit();
    }
</script>
<html>
<head>
    <title>JSP Board</title>
    <style>
        *{
            text-decoration: none;
        }
        body{
            width: 800px;
            margin: 0 auto;
        }
        h1{
            width: 100%;
            text-align: center;
        }
        th{
            border-top: 1px solid lightgray;
            border-bottom: 1px solid lightgray;
        }
        table{
            width: 100%;
        }
        footer{
            float: right;
        }
        .boardItem:hover{
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>JSPBoard</h1>
    <table>
        <tr>
            <th colspan="5">Total: <%=totalRecord%>Articles(<%=nowPage%>/<%=totalPage%>Pages)</th>
        </tr>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>이름</th>
            <th>날짜</th>
            <th>조회수</th>
        </tr>
        <%
            for(BoardItem boardItem:boardItemList){
        %>
                <tr class="boardItem" style="text-align: center">
                    <td><%=boardItem.getNum()%></td>
                    <td style="text-align: left">
                        <a href="javascript:read('<%=boardItem.getNum()%>')">
                            <%=boardItem.getSubject()%>
                        </a>
                    </td>
                    <td><%=boardItem.getName()%></td>
                    <td><%=boardItem.getRegdate()%></td>
                    <td><%=boardItem.getCount()%></td>
                </tr>
        <%
            }
        %>
    </table>
    <form action="${pageContext.request.contextPath}/ch10_board/list.jsp">
        <select name="keyField">
            <option value="name">이름</option>
            <option value="subject">제목</option>
            <option value="content">내용</option>
        </select>
        <input name="keyWord" required>
        <input type="submit" value="찾기">
    </form>
    <footer>
        <a href="${pageContext.request.contextPath}/ch10_board/post.jsp">[글쓰기]</a>
        <a href="">[처음으로]</a>
    </footer>
    <form name="listFrm" action="${pageContext.request.contextPath}/ch10_board/list.jsp">
        <input type="hidden" name="reload" value="true">
        <input type="hidden" name="page" value="<%=nowPage%>">
    </form>
    
    <!-- 제목을 누르면 상세 페이지로 가기-->
    <form name="readFrm" action="${pageContext.request.contextPath}/ch10_board/read.jsp">
        <input type="hidden" name="num">
        <input type="hidden" name="nowPage" value="<%=nowPage%>">
        <input type="hidden" name="ketField" value="<%=keyField%>">
        <input type="hidden" name="keyWord" value="<%=keyWord%>">
    </form>
</body>
</html>
