<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/common.jsp" %>
    <%@ include file="../common/nav.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판홈</title>
</head>
<body>
<div style="padding : 0 110px 0 110px;">
	<h1>게시판</h1>
	<table class="table table-striped">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
		</tr>
	<c:forEach items="${boardList}" var="board">
		<tr>
			<td style="width:10%;">${board.bnum}</td>
			<td style="width:50%;"><a href="${path}/board/detail?bnum=${board.bnum}" style="text-decoration: none;">${board.btitle}</a></td>
			<td style="width:20%;">${board.bwriter}</td>
			<td style="width:20%;"><fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		</tr>
	</c:forEach>
	</table>
	<button onclick="location.href='/board/write' " type="button" class="btn btn-success" style="background-image : var (-bs-gradient);">글쓰기</button>
</div>
</body>
</html>