<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vote.*, java.util.*" %>
<jsp:useBean id="vDao" class="vote.VoteDao" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" ></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<title>vote jsp</title>
	<link href="../resources/css/vote_style.css" rel="stylesheet">
</head>
<body>
	<div>
		<h2 class="m50">투표 프로그램</h2>
		<hr>
		
		<h5 class="m30">설문폼</h5>
		<jsp:include page="voteForm.jsp" />
		<hr>
		
		<h5 class="m30">설문리스트</h5>
		<table class="table m30">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>시작일~종료일</th>
			</tr>
			<%
			ArrayList<VoteList> alist = vDao.getList();
			for(int i=0; i<alist.size(); i++) {
				VoteList vlist = alist.get(i);
				int num = vlist.getNum();
				String question = vlist.getQuestion();
				String sdate = vlist.getSdate().substring(0,10);
				String edate = vlist.getEdate().substring(0,10);
				
				out.print("<tr><td class='cen'>" + (alist.size()-i) + "</td>");
				out.print("	   <td><a href='voteList.jsp?num="+num+"'>" + question + "</a></td>");
				out.print("	   <td class='cen'>" + sdate + " ~ " + edate + "</td></tr>");
			}
			%>
			<tr>
				<td colspan="3" align="right"><a href="voteInsert.jsp">[설문 작성하기]</a>&ensp;<a href="../index.jsp">[홈으로]</a><td>
			</tr>
		</table>
	</div>
</body>
</html>