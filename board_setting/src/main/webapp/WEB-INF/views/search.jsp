<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./common/common.jsp" %>
<%@ include file="./common/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="searchDiv" style="padding : 0 110px 0 110px;">
	<div class="search-header" style="text-align: center; padding: 35px 0 25px 0; width: 100%; height: 50px">
		<a href="http://localhost:8080/search"><img src="../../../img/wooriict.png" style="width: 20%; height: 40px;"></a>
		<input type="text" class="searchInput" onkeypress="handleKeyPress(event)" style="margin-left: 40px; width: 50%;">
		<button onclick="search();" style="margin-left: 10px;">검색</button>
	</div>
	<ul class="nav nav-tabs" style="margin-top: 40px;">
		<li role="presentation" class="web"><a href="/calc">웹 문서</a></li>
		<li role="presentation" class="vclip"><a href="/calendar">동영상</a></li>
		<li role="presentation" class="image"><a href="/search">이미지</a></li>
	</ul>
	
	<div class="web-search">
		<h1 class="web-search-title"></h1>
	</div>
</div>
</body>
<script>
$(document).ready(function() {
	console.log("[네비게이션바] 적용 jsp");
	var loc = location.pathname.split("/")[1];
	console.log("loc => "+loc);
	// 해당 페이지에 맞는 네비게이션바 강조 옵션 적용
	if(loc.indexOf("board") > -1){
		$(".board").addClass("active");
	}
	else if(loc.indexOf("test") > -1){
		$(".test").addClass("active");
	}
	else if(loc.indexOf("calc") > -1){
		$(".calc").addClass("active");
	}
});
function search(){
	var text = $(".searchInput").val();
	$.ajax({
		type:"GET",
		url: "https://dapi.kakao.com/v2/search/web",
		headers: {Authorization: "KakaoAK c6cee192b1d1e6271a03a17adce07537"},
		data: {query: text},
		success: function(response){
			console.log(response);
		},
		error: function(xhr, status, error){
			console.log(error);
		}
	})
}

function handleKeyPress(event) {
	if (event.keyCode === 13){
		search();
	}
}
</script>
</html>