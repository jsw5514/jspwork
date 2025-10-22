<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../resources/css/vote_style.css" rel="stylesheet">
<title>투표 추가</title>
</head>
<body>
	<div class="ques">
		<h2 class="m50">투표 프로그램</h2>
		<hr>
		
		<h5 class="m30">설문작성</h5>
		<form action="voteInsertProc.jsp" method="post">
			<table class="table m30">
				<tr>
					<td>질문</td>
					<td colspan="2">q:<input name="question" size="54"></td>
				</tr>
				<tr>
					<td rowspan="4">항목</td>
				<%
				for(int i=1; i<=4; i++) {
					out.print("<td>" + (i*2-1) +":<input name='item'></td>");
					out.print("<td>" + (i*2) +":<input name='item'></td>");
					out.print("</tr>");
					if(i<4) {
						out.print("<tr>");
					}
				}
				%>
				<tr>
					<td>시작일</td>
					<td colspan="2" class="cen">
						<select name="sdateY">
							<%
								for(int i=2025; i<=2034; i++) {
									out.print("<option value='" + i + "'>" + i);
								}
							%>
						</select>년&emsp;
						<select name="sdateM">
							<%
								for(int i=1; i<=12; i++) {
									out.print("<option value='" + i + "'>" + i);
								}
							%>
						</select>월&emsp;
						<select name="sdateD">
							<%
								for(int i=1; i<=31; i++) {
									out.print("<option value='" + i + "'>" + i);
								}
							%>
						</select>일	
					</td>
				</tr>
				<tr>
					<td>종료일</td>
					<td colspan="2" class="cen">
						<select name="edateY">
						<%
							for(int i=2025; i<=2034; i++) {
								out.print("<option value='" + i + "'>" + i);
							}
						%>
						</select>년&emsp; 
						<select name="edateM">
							<%
								for(int i=1; i<=12; i++) {
									out.print("<option value='" + i + "'>" + i);
								}
							%>
						</select>월&emsp; 
						<select name="edateD">
							<%
								for(int i=1; i<=31; i++) {
									out.print("<option value='" + i + "'>" + i);
								}
							%>
						</select>일
					</td>
				</tr>
				<tr>
					<td>이중답변</td>
					<td colspan=2 class="cen">
						<input type="radio" name="type" value="1" checked>yes&emsp;&emsp; 
						<input type="radio" name="type" value="0">no
					</td>
				</tr>
				<tr>
					<td colspan=3 class="cen">
						<input type="submit" value="작성하기">&emsp;
						<input type="reset" value="다시쓰기">&emsp;
						<input type="button" value="리스트" onclick="location.href='voteList.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>