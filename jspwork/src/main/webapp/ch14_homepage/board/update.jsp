<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.Board" %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	Board board = (Board)session.getAttribute("bean");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/board_normal.css" rel="stylesheet">
<title>게시판 수정하기</title>
</head>
<body>
	<form method="post" action="boardUpdate">
		<table align="center">
			<tr>
				<th colspan=2 bgcolor="#66793C"><font color="white">수 정 하 기</font></th>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td width="15%">성명</td>
				<td><input name="name" value="<%=board.getName() %>"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input name="subject" value="<%=board.getSubject() %>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="10" cols="50"><%=board.getContent() %></textarea></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" required>&ensp;수정시에는 비밀번호가 필요합니다.</td>
			</tr>
			<tr>
				<td colspan="2"><br><hr></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="수정완료">&emsp;
					<input type="reset" value="다시수정">&emsp;
					<input type="button" value="뒤로" onClick="history.go(-1)">
				</th>
			</tr>
		</table>
		<input type="hidden" name="num" value="<%=num %>">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
	</form>
</body>
</html>