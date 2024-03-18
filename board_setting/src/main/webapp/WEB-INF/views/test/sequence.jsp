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
</head>
<body>
<div style="padding : 0 110px 0 110px;">
	<h1>시퀀스</h1>
	<form id="numberForm">
        <input type="number" id="numberInput">
        <button id="selectBtn" type="button">선택</button>
    </form>
    <table id="numberTable" border="1">
    </table>
</div>
</body>
<script>
$('#selectBtn').on('click', function(){
	var inputNum = $('#numberInput').val();
	var seqTable = $('#numberTable');
	if(inputNum === 0){
		seqTable.html=("");
		return;
	}
	if(seqTable.find('tr')) {
		seqTable.html = ("");
	}
	var rowCnt = Math.ceil(inputNum / 4);
	var cnt = 1;
	for(var i = 0; i < rowCnt; i++) {
		var row = numberTable.insertRow();
		for(var j = 0; j < 4; j++){
			var cell = row.insertCell();
			if(cnt > inputNum){
				cell.textContent = "x";
			} else {
				cell.textContent = cnt;
				cnt++;
			}
		}
	}
})
</script>
</html>