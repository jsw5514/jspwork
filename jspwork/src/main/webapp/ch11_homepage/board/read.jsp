<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.*" %>
<jsp:useBean id="bDao" class="board.BoardDao" />
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	
	Board board = null;
	Board sessionBoard = (Board)session.getAttribute("bean");
	
	if(sessionBoard == null || sessionBoard.getNum() != num) {
		bDao.upCount(num);
		board = bDao.getBoard(num);
		session.setAttribute("bean", board);
	} else {
		board = bDao.getBoard(num);
		session.setAttribute("bean", board);
	}
%>
<script>
	function list() {
		document.listFrm.submit();
	}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/board_normal.css" rel="stylesheet">
<title>게시판 상세보기</title>
</head>
<body>
	<table align="center">
		<tr>
			<th colspan=4 bgcolor="#8041D9"><font color="white">글 읽 기</font></th>
		</tr>
		<tr>
			<td align="center" bgcolor="#D1B2FF" width="15%">이름</td>
			<td align="center" bgcolor="#E8D9FF" width="35%"><%=board.getName() %></td>
			<td align="center" bgcolor="#D1B2FF" width="15%">등록날짜</td>
			<td align="center" bgcolor="#E8D9FF" width="35%"><%=board.getRegdate().substring(0,10) %></td>
		</tr>
		<tr>
			<td align="center" bgcolor="#D1B2FF" width="15%">제목</td>
			<td colspan="3" bgcolor="#E8D9FF"><%=board.getSubject() %></td>
		</tr>
		<tr>
			<td colspan="4"><br>본문내용 :<br><%=board.getContent() %><br><br><br></td>
		</tr>
		<tr>
			<td colspan="4" align="right"><%=board.getIp() %>로 부터 글을 남기셨습니다 / 조회수 : <%=board.getCount() %> </td>
		</tr>
		<tr>
			<td colspan="4" align="center"><hr/>
				[ <a href="javascript:list()">리스트</a> | 
				<a href="update.jsp?num=<%=num%>&nowPage=<%=nowPage%>">수 정</a> | 
				<a href="reply.jsp?nowPage=<%=nowPage%>">답 변</a> | 
				<a href="delete.jsp?num=<%=num%>&nowPage=<%=nowPage%>"> 삭 제</a> ]
			</td>
		</tr>
	</table>
	<form action="list.jsp" name="listFrm">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		<%
		if(!(keyWord == null || keyWord.equals(""))) {
		%>	
			<input type="hidden" name="keyField" value="<%=keyField %>">
			<input type="hidden" name="keyWord" value="<%=keyWord %>">
		<%
		}
		%>
	</form>
</body>
</html>


