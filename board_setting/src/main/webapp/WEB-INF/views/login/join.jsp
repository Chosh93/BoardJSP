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
            padding: 20px;
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
     button {
     	margin-top: 50px;
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
	    
	    <label for="password">Password</label>
	    <input class="input-pw" type="password" id="password" name="password" placeholder="비밀번호" required><br>
	    
	    <label for="confirmPassword">Password Check</label>
	    <input class="input-pwch" type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 확인" required><br>
	    
	    <button type="submit">회원가입</button>
    </div>
</div>
</body>
<script>
function vaildateName(){
	var inputName = $(".input-name").val();
	if(inputId === ""){
		
	}
}
</script>
</html>