<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="nav nav-tabs">
	<li role="presentation" class="home"><a href="/">Home</a></li>
	<li role="presentation" class="dropdown board">
	<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">게시판<span class="caret"></span></a>
		<ul class="dropdown-menu" role="menu">
			<li><a href="/board">게시판 목록</a></li>
			<li><a href="/board/ajaxList">게시판 목록 Ajax</a></li>
		</ul>
	</li>
	<li role="presentation" class="dropdown test">
	<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">TEST<span class="caret"></span></a>
		<ul class="dropdown-menu" role="menu">
			<li><a href="/test/gugudan">구구단</a></li>
			<li><a href="/test/color">색깔</a></li>
			<li><a href="/test/sequence">시퀀스</a></li>
		</ul>
	</li>
	<li role="presentation" class="calc"><a href="/calc">계산기</a></li>
	<li role="presentation" class="calendar"><a href="/calendar">캘린더</a></li>
	<li role="presentation" class="search"><a href="/search">검색</a></li>
</ul>
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
	else if(loc.indexOf("calendar") > -1){
		$(".calendar").addClass("active");
	}
	else if(loc.indexOf("search") > -1){
		$(".search").addClass("active");
	}
	else if(loc === ""){
		$(".home").addClass("active");
	}
});
</script>