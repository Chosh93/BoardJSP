<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/common.jsp" %>
    <%@ include file="../common/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TEST4</title>
<script>
function selCol(){
	var sel = document.querySelector('#select1').value;
	var col = document.querySelector('#select2').value;
	var selText = document.getElementById(sel);
	var h4All = document.getElementsByTagName("h4");
	for(var i = 0; i < h4All.length; i++){
		h4All[i].style.color = 'black';
	}
	if (sel === "5") {
	    for (var i = 0; i < h4All.length; i++) {
	        switch (col) {
	            case '11':
	                h4All[i].style.color = 'red';
	                console.log("전체 빨강으로 변경");
	                break;
	            case '12':
	                h4All[i].style.color = 'blue';
	                console.log("전체 파랑으로 변경");
	                break;
	            case '13':
	                h4All[i].style.color = 'yellow';
	                console.log("전체 노랑으로 변경");
	                break;
	            case '14':
	                h4All[i].style.color = 'green';
	                console.log("전체 초록으로 변경");
	                break;
	            default:
	                h4All[i].style.color = 'black';
	        }
	    }
	}
	if(selText){
		switch(col) {
	    case '11':
	    	selText.style.color = 'red';
	        console.log("빨강으로 변경");
	        break;
	    case '12':
	    	selText.style.color = 'blue';
	        console.log("파랑으로 변경");
	        break;
	    case '13':
	    	selText.style.color = 'yellow';
	        console.log("노랑으로 변경");
	        break;
	    case '14':
	    	selText.style.color = 'green';
	        console.log("초록으로 변경");
	        break;
	    default:
	    	selText.style.color = 'black';
		}
	}
}

function valiForm(){
	var sel = document.querySelector('#select1').value;
	var col = document.querySelector('#select2').value;
	var msg = "";
 	if(sel === "0"){
 		msg += "글자 순서, ";
 	}
	if(col === "10") {
		msg += "색상, ";
	}
	if(msg !== ""){
		msg = msg.slice(0, -2);
		alert(msg + "을(를) 선택하세요.");
		return false;
	}
	return true;
}
</script>
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
		<input type="button" value="변경" onclick="valiForm(); selCol();">
	</fieldset>
	</form>
</div>
</body>
</html>