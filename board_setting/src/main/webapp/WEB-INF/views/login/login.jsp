<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/common.jsp" %>
    <%@ include file="../common/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.login-container {
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    padding : 0 110px 0 110px;
}

.login-form {
            width: 500px;
            height: 500px;
            padding: 20px;
        }
</style>
</head>
<body>
<div class="login-container">
    <div class="login-form">
        <div>
            <label for="id" style="width: 50px; height: 50px">ID</label>
            <input class="id-input" type="text" id="id" placeholder="아이디">
        </div>
        <div>
            <label for="pw" style="width: 50px; height: 50px">PW</label>
            <input class="pw-input" type="password" id="pw" placeholder="비밀번호" onkeypress="handleKeyPress(event);">
        </div>
        <div style="padding-left:50px">
	        <button onclick="login();">로그인</button>
	        <button onclick="location.href='/join'" style="margin-left:20px">회원가입</button>
        </div>
    </div>
</div>
</body>
<script>

function vaildateLogin(){
	var inputId = $(".id-input").val();
	var inputPw = $(".pw-input").val();
	var missingFields = "";
	if(inputId === "") {
		missingFields += "아이디, ";
	}
	if(inputPw === "") {
		missingFields += "비밀번호, ";
	}
	if (missingFields !== "") {
        missingFields = missingFields.slice(0, -2); // 마지막 쉼표와 공백 제거
        alert(missingFields + "을(를) 확인해주세요."); // 누락된 입력값을 알림에 출력
        return false;
    }
    return true;
}

function login(){
	if(vaildateLogin()){
		sendLogindata();
	}
}

function sendLogindata() {
	$.ajax({
		type: 'POST',
		url:'/ajax/login',
        data: {
    		memberId: $(".id-input").val(),
    		memberPw: $(".pw-input").val()
    	},
        success: function(response) {
            console.log('로그인 성공', response);
            sessionStorage.setItem('isLogin', "true");
            sessionStorage.setItem('userId', $(".id-input").val());
            window.location.href = '/';
            alert("로그인 성공했습니다.");
        },
        error: function(xhr, status, error) {
            console.error('로그인 실패', error);
        }
    });
}

function handleKeyPress(event) {
	if (event.keyCode === 13){
		login();
	}
}
</script>
</html>