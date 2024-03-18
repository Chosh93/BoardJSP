<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/common.jsp" %>
    <%@ include file="../common/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 작성</title>
</head>
<body>
<div style="padding : 0 110px 0 110px ;">
	<h1>게시글 작성</h1>
	<form method="post" onsubmit="return validateForm()">
	    <label for="wtitle">제목</label><br>
	    <input type="text" id="wtitle" name="btitle" placeholder="제목을 입력하세요." style="width: 100%; margin-bottom: 15px;"><br>
	    <label for="writer">작성자</label><br>
	    <input type="text" id="writer" name="bwriter" placeholder="작성자를 입력하세요." style="width: 100%; margin-bottom: 15px;"><br>
	    <label for="wcontents">내용</label><br>
	    <textarea rows="10" type="text" id="wcontents" name="bcontents" placeholder="내용을 입력하세요." style="width: 100%; margin-bottom: 15px;"></textarea><br>
	    <button type="submit" class="btn btn-info" style="background-image : var (-bs-gradient);">작성</button>
	    <button type="button" onclick="location.href='http://localhost:8080/board' " class="btn btn-primary" style="background-image : var (-bs-gradient);">목록</button>
	</form>
</div>

<script>
function validateForm() {
    var title = document.getElementById("wtitle").value;
    var writer = document.getElementById("writer").value;
    var contents = document.getElementById("wcontents").value;
    var missingFields = ""; // 누락된 입력값을 저장할 변수

    if (title === "") {
        missingFields += "제목, ";
    }
    if (writer === "") {
        missingFields += "작성자, ";
    }
    if (contents === "") {
        missingFields += "내용, ";
    }

    if (missingFields !== "") {
        missingFields = missingFields.slice(0, -2); // 마지막 쉼표와 공백 제거
        alert(missingFields + "을(를) 입력하세요."); // 누락된 입력값을 알림에 출력
        return false;
    }
    return true;
}
//엔터 키 기본 동작 막기
document.addEventListener("keypress", function(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
});
</script>
</body>
</html>