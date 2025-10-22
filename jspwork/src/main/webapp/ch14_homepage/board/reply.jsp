<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.Board" %>
<%
	String nowPage = request.getParameter("nowPage");
	Board board = (Board)session.getAttribute("bean");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/board_normal.css" rel="stylesheet">
<title>게시판 댓글등록</title>
</head>
<body>
	<form method="post" action="boardReply">
		<table align="center">
			<tr>
				<th colspan=2 bgcolor="#007087"><font color="white">댓 글 등 록</font></th>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td width="15%">성명</td>
				<td><input name="name"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input name="subject" value="답변 : <%=board.getSubject() %>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="10" cols="50">
<%=board.getContent() %>
====== 댓글을 작성 하세요 ======
				</textarea></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" required></td>
			</tr>
			<tr>
				<td colspan="2"><br><hr></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="답변등록">&emsp;
					<input type="reset" value="다시쓰기">&emsp;
					<input type="button" value="뒤로" onClick="history.go(-1)">
				</th>
			</tr>
		</table>
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		
		<!-- 나의 정보 -->
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
		
		<!-- 부모의 정보 -->
		<input type="hidden" name="ref" value="<%=board.getRef() %>">
		<input type="hidden" name="pos" value="<%=board.getPos() %>">
		<input type="hidden" name="depth" value="<%=board.getDepth() %>">
	</form>
</body>
</html>