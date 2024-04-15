<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/common.jsp" %>
    <%@ include file="../common/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	.signup-div {
		width: 100%;
        height: 100%;
        display: flex;
    	justify-content: center;
    	align-items: center;
        padding : 0px 110px 0 110px;
     }
     .signup-form {
            width: 500px;
            height: 500px;
            padding: 30px;
     }
     input	{
     	margin-top: 30px;
     	margin-left: 30px;
     }     
     label {
     	width: 50px;
     	height: 50px;
     	text-align: center;
     }
     .join-btn {
     	margin-top: 50px;
     	margin-left: 80px;
     }
     .id-check{
     	margin-left: 80px;
     }
</style>
</head>
<body>
<div class="signup-div">
	<div class="signup-form">
	    <label for="name">이름</label>
	    <input class="input-name" type="text" id="name" name="name" placeholder="이름" required><br>
	    
	    <label for="id">ID</label>
	    <input class="input-id" type="text" id="id" name="id" placeholder="ID" required><br>
	    <button class="id-check" onclick="idCheck();">아이디체크</button><br>
	    
	    <label for="password">Password</label>
	    <input class="input-pw" type="password" id="password" name="password" placeholder="비밀번호" required><br>
	    
	    <label for="confirmPassword">Password Check</label>
	    <input class="input-pwch" type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 확인" required><br>
	    <p class="pwch-result"></p>
	    
	    <button class="join-btn" onclick="memberJoin();">회원가입</button>
    </div>
</div>
</body>
<script>
$(document).ready(function(){
	$(".input-pwch").on("input", function(){
		pwCheck();
	})
})

function vaildateName(){
	var inputName = $(".input-name").val();
	if(inputName === ""){
		return false;
	}
	return true;
}

function vaildateId(){
	var inputId = $(".input-id").val();
	if(inputId === ""){
		return false;
	}
	return true;
}

function vaildateIdCheck(idCheck){
	if(idCheck > 0) {
		return false;
	}
	return true;
}

function vaildatePw(){
	var inputPw = $(".input-pw").val();
	if(inputPw === ""){
		return false;
	}
	return true;
}

function pwCheck() {
	var inputPw = $(".input-pw").val();
	var inputPwCheck = $(".input-pwch").val();
	if(!inputPw){
		$(".pwch-result").text("")
		return;
	}
	if(inputPw === inputPwCheck){
		$(".pwch-result").text("비밀번호가 일치합니다.").css("color", "red");
		return true;
	} else {
		$(".pwch-result").text("비밀번호가 일치하지 않습니다.").css("color", "red");
		return false;
	}
}

function validateAll(){
    var missingFields = "";
    if(!vaildateName()){
        missingFields += "이름, ";
    }
    if(!vaildateId()){
        missingFields += "ID, ";
    }
    if(!vaildatePw()){
        missingFields += "비밀번호, ";
    }
    if(missingFields !== ""){
        missingFields = missingFields.slice(0, -2); // 마지막 쉼표와 공백 제거
        alert(missingFields + "을(를) 확인해주세요."); // 누락된 입력값을 알림에 출력
        return false;
    }
    return true;
}

function idCheck() {
	$.ajax({
		type: 'POST',
		url: '/ajax/idCheck',
		data: { memberId: $(".input-id").val() },
		success: function(response) {
			idCheckResponse = response;
			if(response > 0){
				alert("이미 사용중인 아이디 입니다.");
			} else {
				alert("사용 가능한 아이디 입니다.");
			}
		},
		error: function(xhr, status, error){
			console.log("검사 실패", error)
		}
	});
}

var idCheckResponse;
function memberJoin(){
	if(validateAll()){
		if(vaildateName() && vaildateId() && vaildatePw() && pwCheck() && idCheckResponse === 0) {
	        $.ajax({
				type: 'POST',
				url: '/ajax/join',
				data: {
					memberId: $(".input-id").val(),
					memberPw: $(".input-pw").val(),
					memberName: $(".input-name").val()
				},
				success: function(response){
					alert("회원가입 완료");
					window.location.href = '/';
				},
				error: function(xhr, status, error){
					console.log(error);
				}
	        });
	    }
	}
}

</script>
</html>