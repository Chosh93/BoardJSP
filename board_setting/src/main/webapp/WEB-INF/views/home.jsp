<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./common/common.jsp" %>
    <%@ include file="./common/nav.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<style>
		.home-div {
			display: flex;
			justify-content: space-between;
			align-items: center;
		}
	</style>
</head>
<body>
	<h1 style="padding : 0 110px 0 110px;">HOME</h1>
	<div class="home-div" style="padding : 0 110px 0 110px;">
		<a href="http://www.wooriict.com/" target="_blank">
		<img src="../../../img/wooriict.png">
		</a>
		<button id="loginButton">로그인</button>
	</div>
</div>
</body>
<script>
//페이지가 로드될 때 세션 스토리지에서 isLogin 값을 확인하여 버튼 텍스트를 설정합니다.
document.addEventListener("DOMContentLoaded", function() {
	console.log(sessionStorage.getItem("userId"));
    var isLogin = sessionStorage.getItem("isLogin");
    var loginButton = document.getElementById("loginButton");
    if (isLogin === "true") {
        loginButton.textContent = "로그아웃";
    } else {
        loginButton.textContent = "로그인";
    }
});

// 로그인 또는 로그아웃 버튼 클릭 이벤트 처리
document.getElementById("loginButton").addEventListener("click", function() {
    var isLogin = sessionStorage.getItem("isLogin");
    var loginButton = document.getElementById("loginButton");
    if (isLogin === "true") {
        // 로그아웃 처리
        sessionStorage.setItem("isLogin", "false");
        sessionStorage.removeItem("userId");
        loginButton.textContent = "로그인";
    } else {
        // 로그인 페이지로 이동
        location.href = "/login";
    }
});
</script>
</html>
