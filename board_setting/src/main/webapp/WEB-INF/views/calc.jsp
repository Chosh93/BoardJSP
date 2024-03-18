<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./common/common.jsp" %>
    <%@ include file="./common/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.calcDesc{
   width: 100%;
}

#calcTable {
   width: 100%;
   border: 0.5px solid black;
}

#calcTable tr,td{
   border: 0.5px solid black;
   width: 25%;
   height: 50px;
   padding: 0;
}

#display {
   border: none;
    outline: none;
}

input{
	border: none;
	width: 100%;
	height: 100%;	
	background-color: transparent;
	transition: background-color 0.1s ease;
	
}

input[type="button"]:active {
    background-color: #dddddd; /* 클릭시 회색으로 반응 */
}

.table>tbody>tr>td {
	padding: 0;
}
</style>
</head>
<body>
<div style="padding : 0 110px 0 110px;">
   <h1>계산기!</h1>
   <table id="calcTable" class="table table-bordered">
      <tr align="right">
         <td colspan="4"><input id="display" value="" style="text-align: right" readonly/></td>
      </tr>
      <tr align="center">
         <td id="7"><input id="7btn" type="button" value="7"/></td>
         <td id="8"><input id="8btn" type="button" value="8"/></td>
         <td id="9"><input id="9btn" type="button" value="9"/></td>
         <td id="mul"><input id="mulBtn" type="button" value="x"/></td>
      </tr>
      <tr align="center">
         <td id="4"><input id="4btn" type="button" value="4"/></td>
         <td id="5"><input id="5btn" type="button" value="5"/></td>
         <td id="6"><input id="6btn" type="button" value="6"/></td>
         <td id="sub"><input id="subBtn" type="button" value="-"/></td>
      </tr>
      <tr align="center">
         <td id="1"><input id="1btn" type="button" value="1"/></td>
         <td id="2"><input id="2btn" type="button" value="2"/></td>
         <td id="3"><input id="3btn" type="button" value="3"/></td>
         <td id="add"><input id="addBtn" type="button" value="+"/></td>
      </tr>
      <tr align="center">
         <td id="Del"><input id="Delbtn" type="button" value="Del"/></td>
         <td id="0"><input id="0btn" type="button" value="0"/></td>
         <td id="dot"><input id="dotBtn" type="button" value="."/></td>
         <td id="equal"><input id="equalBtn" type="button" value="="/></td>
      </tr>
   </table>
</div>
<script>
$('input').on('click', function(){
    var value = $(this).val();
    var display = $('#display');
    var currentValue = display.val();
    var lastChar = currentValue.charAt(currentValue.length-1);
    console.log("마지막 문자 : " + lastChar);
    if(value === 'x'){
        value = '*';
    }
	if(value === 'Del') {
		display.val(currentValue.slice(0, -1));
		return false;
    }
    if(value === '=') {
    	currentValue = eval(currentValue);
    	display.val(currentValue);
    	return false;
    }
    if(currentValue === ''){
    	if(value === '+' || value === '-' || value === '*'){
            return false;
        }
    }
    if(lastChar === '+' || lastChar === '-' || lastChar === '*' || lastChar === '.'){
        if(value === '+' || value === '-' || value === '*' || value === '.'){
        	return false;
        }
        
    }
    display.val(currentValue + value);
    console.log(display.val());
});
</script>
</body>
</html>