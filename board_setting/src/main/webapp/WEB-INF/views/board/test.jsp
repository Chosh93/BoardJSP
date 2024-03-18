<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../common/nav.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax Board List</title>
<script>
function deleteBoard(bnum) {
    $.ajax({
        type: 'POST',
        url: '/board/ajax/delete',
        data: { bnum: bnum },
        success: function(response) {
            console.log('게시물 삭제 성공');
            console.log(response);
            updateBoardList(response);
        },
        error: function(xhr, status, error) {
            console.log('게시물 삭제 실패');
        }
    });
}

function updateBoardList(boardList) {
    var table = document.getElementById("boardTable");
    table.innerHTML = ""; // 테이블 초기화
    for (var i = 0; i < boardList.length; i++) {
        var row = table.insertRow();
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);
        var cell5 = row.insertCell(4);

        cell1.innerHTML = boardList[i].bnum;
        cell2.innerHTML = "<a href='${path}/board/detail?bnum=" + boardList[i].bnum + "' style='text-decoration: none;'>" + boardList[i].btitle + "</a>";
        cell3.innerHTML = boardList[i].bwriter;
        cell4.innerHTML = <fmt:formatDate value="${boardList[i].bdate}" pattern="yyyy-MM-dd HH:mm:ss" />
        cell5.innerHTML = "<button onclick='deleteBoard(" + boardList[i].bnum + ")' type='button' class='btn btn-danger' style='background-image : var (-bs-gradient);'>삭제</button>";
    }
}
</script>
</head>
<body>
<div style="padding: 0 110px;">
    <h1>게시판</h1>
    <table id="boardTable" class="table table-striped">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>날짜</th>
            <th></th>
        </tr>
        <c:forEach items="${boardList}" var="board">
            <tr>
                <td style="width:10%;">${board.bnum}</td>
                <td style="width:40%;"><a href="${path}/board/detail?bnum=${board.bnum}" style="text-decoration: none;">${board.btitle}</a></td>
                <td style="width:20%;">${board.bwriter}</td>
                <td style="width:20%;"><fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                <td style="width:10%;"><button onclick="deleteBoard(${board.bnum})" type="button" class="btn btn-danger" style="background-image : var (-bs-gradient);">삭제</button></td>
            </tr>
        </c:forEach>
    </table>
    <button onclick="location.href='/board/write'" type="button" class="btn btn-success" style="background-image : var (-bs-gradient);">글쓰기</button>
</div>
</body>
</html>
