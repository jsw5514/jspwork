<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<jsp:useBean id="bDao" class="board.BoardDao" />
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	
	if(request.getParameter("pass") != null) {
		String inputPass = request.getParameter("pass");
		Board board = (Board)session.getAttribute("bean");
		
		if(inputPass.equals(board.getPass())) {
			int result = bDao.deleteBoard(num);
			if(result == 1) {
				response.sendRedirect("list.jsp?nowPage=" + nowPage);
			} else {
%>
			<script type="text/javascript">
				alert("댓글이 있어 삭제할 수 없습니다.");
				history.go(-2);
			</script>
<%
			}
		} else {
%>
			<script type="text/javascript">
				alert("비밀번호가 맞지 않습니다.");
				history.go(-1);
			</script>
<%			
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 삭제</title>
<link href="../resources/css/board_normal.css" rel="stylesheet">
</head>
<body>
	<form action="delete.jsp" method="post">
		<table align="center">
			<tr>
				<th bgcolor="#D5D5D5">사용자의 비밀번호를 입력해 주세요</th>
			</tr>
			<tr>
				<th><input type="password" name="pass" required></th>
			</tr>
			<tr>
				<th><hr></th>
			</tr>
			<tr>
				<td align="center">
					<input type="submit" value="삭제">&nbsp;
					<input type="reset" value="다시쓰기">&nbsp;
					<input type="button" value="뒤로" onclick="history.back();">
				</td>
			</tr>
		</table>
		<input type="hidden" name="num" value="<%=num %>">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
	</form>
</body>
</html>