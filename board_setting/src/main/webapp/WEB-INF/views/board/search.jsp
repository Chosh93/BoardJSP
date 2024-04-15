<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/common.jsp" %>
    <%@ include file="../common/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   select{
       margin-left: 75%;
   }
</style>
</head>
<body>
<div style="padding: 0 110px;">
<h1>게시판</h1>
    <span class="list-cnt"></span>
    <select onchange="changePageSize(this.value)">
		<option value="5">5줄 보기</option>
		<option value="10">10줄 보기</option>
		<option value="15">15줄 보기</option>
		<option value="20">20줄 보기</option>
    </select>
    <input class="input-search" type="text">
    <button onclick="search();">검색</button>
    <table id="boardTable" class="table table-striped">
    	<thead>
	    	<tr>
				<th>번호</th><th style="width:60%;">제목</th><th>작성자</th><th>날짜</th>
			</tr>
		</thead>
		<tbody id="boardBody">
		</tbody>
    </table>
    <button id="writeButton" onclick="showWrite()" type="button" class="btn btn-success" style="margin-bottom: 25px;">글쓰기</button>
    <form onsubmit="return validateForm()" class="write-area" style="display: none;">
       <label for="wtitle">제목</label><br>
       <input type="text" id="wtitle" name="btitle" placeholder="제목을 입력하세요." style="width: 100%; margin-bottom: 15px;"><br>
       <label for="writer">작성자</label><br>
       <input type="text" id="writer" name="bwriter" placeholder="작성자를 입력하세요." style="width: 100%; margin-bottom: 15px;"><br>
       <label for="wcontents">내용</label><br>
       <textarea rows="10" type="text" id="wcontents" name="bcontents" placeholder="내용을 입력하세요." style="width: 100%; margin-bottom: 15px;"></textarea><br>
       <button type="button" onclick="writeBoard()" class="btn btn-info">작성</button>
   </form>
      	<div id="boardDetail"></div>
</div>
</body>
<script>
$(document).ready(function(){
	listCnt();
	loadBoardList();
})
function listCnt() {
	$.ajax({
		type: 'GET',
		url: '/ajax/listCnt',
		dataType: 'json',
		success: function(response){
			console.log(response);
			$(".list-cnt").text("총 "+response+"개");
		},
		error: function(xhr, status, error){
			console.log(error);
		}
	})
}

function loadBoardList() {
    $.ajax({
        type: 'GET',
        url: '/ajax/list',
        dataType: 'json',
        success: function(response) {
            updateBoardList(response);
        },
        error: function(xhr, status, error) {
            console.error('게시판 목록 불러오기 실패:', error);
            alert('게시판 목록을 불러오는데 실패했습니다.');
        }
    });
}

function updateBoardList(boardList) {
    var tableBody = $('#boardBody');
    tableBody.empty();
    $.each(boardList, function(index, board) {
    	var row = $('<tr>');
        row.append('<td>' + board.bnum + '</td>');
        row.append('<td><a class="board-title" data-bnum="' + board.bnum + '">' + board.btitle + '</a></td>');
        row.append('<td>' + board.bwriter + '</td>');
        row.append('<td>' + formatDate(board.bdate) + '</td>');
        tableBody.append(row);
    });
}

//날짜 포맷
function formatDate(dateString) {
    var date = new Date(dateString);
    var year = date.getFullYear();
    var month = ("0" + (date.getMonth() + 1)).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);
    var hours = ("0" + date.getHours()).slice(-2);
    var minutes = ("0" + date.getMinutes()).slice(-2);
    var seconds = ("0" + date.getSeconds()).slice(-2);
    return year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds;
}

function search() {
    $.ajax({
        type: 'POST',
        url: '/ajax/search',
        data: { searchData: $(".input-search").val() },
        success: function(response) {
            console.log(response);
            updateBoardList(response);
        },
        error: function(xhr, status, error) {
            console.log(error);
        }
    })
}

function changePageSize(pageSize) {
    console.log("페이지 사이즈 변경:", pageSize);
    loadBoardList();
}
</script>
</html>