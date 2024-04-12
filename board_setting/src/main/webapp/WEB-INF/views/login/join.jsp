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
	    
	    <button class="join-btn" onclick="validateAll();">회원가입</button>
    </div>
</div>
</body>
<script>
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
			console.log(response)
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

</script>
</html>