<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/common.jsp" %>
    <%@ include file="../common/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div style="padding : 0 110px 0 110px ;">
	<h1>게시글 상세</h1>
	<span style="font-weight: bold;">번호</span> <span style="margin-left: 10px">${data.bnum}</span><br><br>
	<span style="font-weight: bold;">제목</span>	<span style="margin-left: 10px">${data.btitle}</span><br><br>
	<span style="font-weight: bold;">작성자</span> <span style="margin-left: 10px">${data.bwriter}</span><br><br>
	<span style="font-weight: bold;">내용</span>
	<p>${data.bcontents}</p><br>
	<button onclick="location.href='http://localhost:8080/board/update?bnum=${data.bnum}' " class="btn btn-info" style="background-image : var (-bs-gradient);">수정</button>
	<button onclick="location.href='http://localhost:8080/board/delete?bnum=${data.bnum}' " class="btn btn-danger" style="background-image : var (-bs-gradient);">삭제</button>
	<button onclick="location.href='http://localhost:8080/board' " class="btn btn-primary" style="background-image : var (-bs-gradient);">목록</button>
</div>
</body>
</html>