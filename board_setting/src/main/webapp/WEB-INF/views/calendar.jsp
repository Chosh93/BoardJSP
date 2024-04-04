<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./common/common.jsp" %>
<%@ include file="./common/nav.jsp" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="padding : 0 110px 0 110px;">
    <div class="mt-3 mb-3 p-3 d-flex justify-content-between">
        <span >
            <a>[이전달]</a>
        </span>
        <span>${year}년 ${month}월</span>
        <span>
            <a>[다음달]</a>
        </span>
    </div>
    <div>
        <table class="table table-striped">
            <tr>
                <th class="text-danger">일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th class="text-primary">토</th>
            </tr>
            <tr id="calendarRow"></tr>
        </table>
    </div>
</div>
</body>
<script>
var startBlank = ${firstDay} - 1;
var endBlank = 0;
if((startBlank + ${lastDay}) % 7 != 0){
    endBlank = 7 - ((startBlank + ${lastDay}) % 7);
}
var tdCnt = startBlank + ${lastDay} + endBlank;

var calendarRow = document.getElementById('calendarRow');
for (var i = 1; i <= tdCnt; i++) {
    var td = document.createElement('td');
    if (i > startBlank && i <= startBlank + ${lastDay}) {
        if (i % 7 == 0) {
            td.innerHTML = '<span class="text-primary">' + (i - startBlank) + '</span>';
        } else if (i % 7 == 1) {
            td.innerHTML = '<span class="text-danger">' + (i - startBlank) + '</span>';
        } else {
            td.innerHTML = i - startBlank;
        }
    } else {
        td.innerHTML = '&nbsp;';
    }
    calendarRow.appendChild(td);
    if (i != tdCnt && i % 7 == 0) {
        calendarRow = document.createElement('tr');
        document.getElementsByTagName('table')[0].appendChild(calendarRow);
    }
}

</script>
</html>
