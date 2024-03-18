<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/common.jsp" %>
    <%@ include file="../common/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TEST4</title>
</head>
<body>
<div style="padding : 0 110px 0 110px;">
	<h2>TEST4 - 색상변경</h2>
	<h4 id="1">첫번째</h4>
	<h4 id="2">두번째</h4>
	<h4 id="3">세번째</h4>
	<h4 id="4">네번째</h4>
	<form>
	<fieldset>
		<select id="select1">
			<option value="0">선택</option>
			<option value="5">전체</option>
			<option value="1">첫번째</option>
			<option value="2">두번째</option>
			<option value="3">세번째</option>
			<option value="4">네번째</option>
		</select>
		<select id="select2">
			<option value="10">선택</option>
			<option value="11">빨강</option>
			<option value="12">파랑</option>
			<option value="13">노랑</option>
			<option value="14">초록</option>
		</select>
		<input id="changeBtn" type="button" value="변경">
	</fieldset>
	</form>
</div>
</body>
<script>
$('#changeBtn').on('click', function(){
	var h4All = $('h4');
	h4All.css('color', 'black');
	var sel = $('#select1').val();
	var col = $('#select2').val();
	var selText = $('#'+sel).text();
	var msg = "";
	if(sel === "0"){
		msg += "글자 순서, ";
	}
	if(col === "10"){
		msg += "색상, ";
	}
	if(msg !== ""){
		msg = msg.slice(0,-2);
		alert(msg + "을(를) 선택하세요.");
	}
	if(sel === "5"){
		switch(col){
		case '11':
			h4All.css('color', 'red');
			break;
		case '12':
			h4All.css('color', 'blue');
			break;
		case '13':
			h4All.css('color', 'yellow');
			break;
		case '14':
			h4All.css('color', 'green');
			break;
		}
	}
	if(selText){
		switch(col) {
		case '11':
			$('#'+sel).css('color', 'red');
			break;
		case '12':
			$('#'+sel).css('color', 'blue');
			break;
		case '13':
			$('#'+sel).css('color', 'yellow');
			break;
		case '14':
			$('#'+sel).css('color', 'green');
			break;
		}
	}
})
</script>
</html>