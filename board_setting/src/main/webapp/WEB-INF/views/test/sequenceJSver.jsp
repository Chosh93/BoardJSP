<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/common.jsp" %>
    <%@ include file="../common/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TEST6</title>
<style>
    table {
        border-collapse: collapse;
    }

    td {
        width: 100px;
        height: 50px;
        text-align: center;
        vertical-align: middle;
    }
    input[type="number"] {
        width: 100px;
    }
</style>
<script>
function sequence() {
    var numberInput = document.getElementById("numberInput").value;
    var numberTable = document.getElementById("numberTable");

    // 입력값이 0일 경우 표시하지 않음
    if (numberInput === 0) {
        numberTable.innerHTML = "";
        return;
    }

 	// 이전에 생성된 행 제거
    if(numberTable.rows.length > 0) {
    	numberTable.innerHTML = "";
    }
    
    // 테이블 생성
    var rowCount = Math.ceil(numberInput / 4);
    var currentNumber = 1;
    for(var i = 0; i < rowCount; i++){
    	var row = numberTable.insertRow();
        for(var j = 0; j < 4; j++){
        	var cell = row.insertCell();
        	if(currentNumber > numberInput){
            	cell.textContent = "x";
            } else {
            	cell.textContent = currentNumber;
            	currentNumber++;
            }
        }
    } 
}
    </script>
</head>
<body>
<div style="padding : 0 110px 0 110px;ut">
	<h1>시퀀스</h1>
	<form id="numberForm">
        <input type="number" id="numberInput">
        <button type="button" onclick="sequence()">선택</button>
    </form>
    <table id="numberTable" border="1">
    </table>
</div>
</body>
</html>