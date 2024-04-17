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
#boardTable td:nth-child(1) {
    width: 10%;
}

#boardTable td:nth-child(2) {
    width: 30%;
}

#boardTable td:nth-child(3) {
    width: 10%
}

#boardTable td:nth-child(4) {
    width: 30%;
}
</style>
</head>
<body>
<div style="padding: 0 110px;">
<h1>게시판</h1>
    <span class="list-cnt"></span>
    <select class="page-select" onchange="loadBoardList();">
    	<option value="10">선택</option>
		<option value="5">5줄 보기</option>
		<option value="10">10줄 보기</option>
		<option value="15">15줄 보기</option>
		<option value="20">20줄 보기</option>
    </select>
    <input class="input-search" type="text">
    <button onclick="loadBoardList();">검색</button>
    <table id="boardTable" class="table table-striped">
    	<thead>
	    	<tr>
				<th>번호</th><th style="width:60%;">제목</th><th>작성자</th><th>날짜</th>
			</tr>
		</thead>
		<tbody id="boardBody">
		</tbody>
    </table>
    <div class="show-paging" style="text-align: center;"></div>
    
    <button id="writeButton" onclick="location.href='/board/write' " type="button" class="btn btn-success" style="margin-bottom: 25px; float: left;">글쓰기</button>
    <button id="search-reset" onclick="searchReset();" type="button" class="btn btn-success" style="margin-bottom: 25px; float: right;">목록보기</button>
</div>
</body>
<script>
$(document).ready(function(){
	loadBoardList();
})

var endPage;
var beginPage;
function loadBoardList() {
    $.ajax({
        type: 'GET',
        url: '/board/search/list',
        data: { searchData: $(".input-search").val(),
            	displayRow: $(".page-select").val()
        },
        success: function(response) {
            $(".list-cnt").text("총 "+response[0].totalCnt+"개");
            updateBoardList(response);
            endPage = response[0].endPage;
            beginPage = response[0].beginPage;
        },
        error: function(xhr, status, error) {
            console.error('게시판 목록 불러오기 실패:', error);
            alert('게시판 목록을 불러오는데 실패했습니다.');
        }
    });
}

function updateBoardList(response) {
    var tableBody = $('#boardBody');
    var pageBody = $('.show-paging');
    var boardList = response[1];
    var paging = response[0];
    tableBody.empty();
    pageBody.empty();
    $.each(boardList, function(index, board) {
    	var row = $('<tr>');
        row.append('<td>' + board.bnum + '</td>');
        row.append('<td><a class="board-title" href="/board/detail?bnum=' + board.bnum + '">' + board.btitle + '</a></td>');
        row.append('<td>' + board.bwriter + '</td>');
        row.append('<td>' + formatDate(board.bdate) + '</td>');
        tableBody.append(row);
    });
    var pagingHTML = '<ul class="pagination">';
    pagingHTML += '<li class="page-item ' + (!paging.prev ? 'disabled' : '') + '"><a class="page-link" onclick="' + (paging.prev ? 'goToPrev()' : 'return false;') + '">이전</a></li>';

    for (var i = paging.beginPage; i <= paging.endPage; i++) {
        pagingHTML += '<li class="page-item ' + (i === paging.page ? 'active' : '') + '"><a class="page-link" onclick="goToPage(' + i + ')">' + i + '</a></li>';
    }

    pagingHTML += '<li class="page-item ' + (!paging.next ? 'disabled' : '') + '"><a class="page-link" onclick="' + (paging.next ? 'goToNext()' : 'return false;') + '">다음</a></li>';
    pagingHTML += '</ul>';

    pageBody.html(pagingHTML);
}

function goToPage(pageNum) {
	$.ajax({
        type: 'GET',
        url: '/board/search/goToPage',
        data: { searchData: $(".input-search").val(),
            	displayRow: $(".page-select").val(),
            	pageNum: pageNum
        },
        success: function(response) {
            updateBoardList(response);
            endPage = response[0].endPage;
            beginPage = response[0].beginPage;
        },
        error: function(xhr, status, error) {
            console.error('게시판 목록 불러오기 실패:', error);
            alert('게시판 목록을 불러오는데 실패했습니다.');
        }
    });
}
function goToNext(){
	goToPage(endPage+1);
}

function goToPrev(){
	goToPage(beginPage-1);
}

function searchReset(){
	$(".input-search").val("");
	loadBoardList();
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
</script>
</html>