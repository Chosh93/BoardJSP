<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/common.jsp" %>
    <%@ include file="../common/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TEST2</title>
</head>
<body>
<div style="padding : 0 110px 0 110px;">
	<h2>TEST2 - 구구단</h2>
	<form>
	<fieldset>
		<select>
			<option value="0">선택</option>
			<option value="1">1단</option>
			<option value="2">2단</option>
			<option value="3">3단</option>
			<option value="4">4단</option>
			<option value="5">5단</option>
			<option value="6">6단</option>
			<option value="7">7단</option>
			<option value="8">8단</option>
			<option value="9">9단</option>
		</select>
		<input id="gugudanBtn" type="button" value="계산">
	</fieldset>
	</form>
	<div id="result"></div>
</div>
</body>
<script>
$('#gugudanBtn').on('click', function(){
	var result = '';
	var dan = $('select').val();
	console.log(dan);
	if(dan > 0){
		for(var i = 1; i <= 9; i++){
			result += dan + " x " + i + " = " + (dan*i) + "<br>";
		}
	$('#result').html(result);
	}
})
</script>
</html>