<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/common.jsp" %>
    <%@ include file="../common/nav.jsp" %>
<style>
a.board-title{
	cursor: pointer;
}

#boardTable td:nth-child(1) {
    width: 10%;
}

#boardTable td:nth-child(2) {
    width: 10%;
}

#boardTable td:nth-child(3) {
    width: 30%
}

#boardTable td:nth-child(4) {
    width: 20%;
}
</style>
<script>
// 게시판 ajax 목록 출력
$(document).ready(function() {
   loadBoardList();
});
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
        row.append('<td><input type="checkbox" name="RowCheck" value="' + board.bnum + '" onclick="checkSelectAll();"></td>');
        row.append('<td>' + board.bnum + '</td>');
        row.append('<td><a class="board-title" data-bnum="' + board.bnum + '">' + board.btitle + '</a></td>');
        row.append('<td>' + board.bwriter + '</td>');
        row.append('<td>' + formatDate(board.bdate) + '<button onclick="confirmDel(' + board.bnum + ')" type="button" class="btn btn-danger">삭제</button></td>');
        tableBody.append(row);
    });
}

//게시판 테이블 삭제 함수
function confirmDel(bnum){
   if(confirm("삭제하시겠습니까?")){
      $.ajax({
           type: 'POST',
           url: '/ajax/delete',
           data: { bnum: bnum },
           success: function(response) {
               updateBoardList(response);
           },
           error: function(xhr, status, error) {
               console.log('게시물 삭제 실패');
           }
       });
   }
}

// 날짜 포맷
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

// 글쓰기 버튼 내 기능
function showWrite(){
    $(".write-area").toggle(); // 입력 영역을 토글 (보이기 ↔ 숨기기)
    $("#wtitle").val("");
    $("#writer").val("");
    $("#wcontents").val("");
};

 // 게시글 작성
function writeBoard() {
    var formData = $(".write-area form").serialize(); // 폼 데이터 직렬화
    console.log("WriteBoard 동작");
    var isValid = validateForm();
    if(!isValid){
       return false;
    }
    var formData = {
         btitle: $("#wtitle").val(),
         bwriter: $("#writer").val(),
         bcontents: $("#wcontents").val(),
   }
    $.ajax({
        type: 'POST',
        url: '/ajax/write',
        contentType: 'application/json',
        data: JSON.stringify(formData),
        success: function(response) {
            console.log('폼이 성공적으로 제출되었습니다:', response);
            $('form').each(function(){
               this.reset();
            });
            $(".write-area").hide();
            updateBoardList(response);
        },
        error: function(xhr, status, error) {
            console.error('폼 제출 중 오류가 발생했습니다:', error);
        }
    });
}

 // 게시글 입력값 검사
function validateForm() {
    var title = document.getElementById("wtitle").value;
    var writer = document.getElementById("writer").value;
    var contents = document.getElementById("wcontents").value;
    var msg = "";

    if (title === "") {
    	msg += "제목, ";
    }
    if (writer === "") {
    	msg += "작성자, ";
    }
    if (contents === "") {
    	msg += "내용, ";
    }

    if (msg !== "") {
    	msg = msg.slice(0, -2); // 마지막 쉼표와 공백 제거
        alert(msg + "을(를) 입력하세요."); // 누락된 입력값을 알림에 출력
        return false;
    }
    return true;
}

// 상세정보 클릭 함수
$(document).on('click', '.board-title', function() {
    var bnum = $(this).attr('data-bnum');
    console.log(bnum);
    boardDetail(bnum);
});


// 게시글 상세정보 ajax
function boardDetail(bnum) {
    $.ajax({
        type: 'GET',
        url: '/ajax/detail?bnum=' + bnum,
        success: function(response) {
           console.log(response);
           var detailHtml = '<span style="font-weight: bold;">번호</span> <span style="margin-left: 10px"><br>' + response.bnum + '</span><br><br>' +
            '<span style="font-weight: bold;">제목</span> <span style="margin-left: 10px"><br>' + response.btitle + '</span><br><br>' +
            '<span style="font-weight: bold;">작성자</span> <span style="margin-left: 10px"><br>' + response.bwriter + '</span><br><br>' +
            '<span style="font-weight: bold;">내용</span>' +
            '<p>' + response.bcontents + '</p><br>'+
            '<button onclick="closeDetail()" type="button" class="btn btn-primary" style="background-image : var (-bs-gradient);">닫기</button>';
         $('#boardDetail').html(detailHtml);
        },
        error: function(xhr, status, error) {
            console.error('게시글 상세 내용을 가져오는 중 오류가 발생했습니다:', error);
        }
    });
}

// 상세 정보 닫기 기능
function closeDetail() {
    $('#boardDetail').empty(); // #boardDetail 내용 지우기
}

//엔터 키 기본 동작 막기
document.addEventListener("keypress", function(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
});

// 전체선택 기능
function checkSelectAll(){
	var checkboxes = document.querySelectorAll('input[name="RowCheck"]');
	var checked = document.querySelectorAll('input[name="RowCheck"]:checked');
	var selectAll = document.querySelector('input[name="allCheck"]');
	if(checkboxes.length === checked.length){
		selectAll.checked = true;
		
	} else {
		selectAll.checked = false;
	}
}

function selectAll(selectAll) {
    var checkboxes = document.getElementsByName('RowCheck');
    var checked = document.querySelectorAll('input[name="RowCheck"]:checked');
    var checkBnum = [];
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = selectAll.checked;
        if(checkboxes[i].checked){
            checkBnum.push(checkboxes[i].value);
        }
    }
}

function selectDel(){
	var check = document.querySelectorAll('input[name="RowCheck"]:checked');
	var checkBnum = [];
	for(var i = 0; i < check.length; i++){
		checkBnum.push(check[i].value);
	}
	if(checkBnum.length == 0){
		console.log(checkBnum);
		alert("삭제할 대상을 체크하여 주십시오.");
		return false;
	}
	console.log(checkBnum);
	alert(checkBnum);
	$.ajax({
		type: 'POST',
		url: '/ajax/selectDel',
		contentType: 'application/json',
		data: JSON.stringify(checkBnum),
		success: function(response){
			console.log(response);
			updateBoardList(response);
		},
		error: function(error) {
			console.log(error);
		}
	});
}
</script>
<body>
<div style="padding: 0 110px;">
    <h1>게시판</h1>
    <table id="boardTable" class="table table-striped">
    	<thead>
	    	<tr>
	    		<th><input id='allCheck' type='checkbox' name='allCheck' onclick='selectAll(this);'/>전체선택</th>
				<th>번호</th><th>제목</th><th>작성자</th><th>날짜</th>
			</tr>
			<td><button onclick="selectDel()"type="button" class="btn btn-danger" style="background-image : var (-bs-gradient);">선택삭제</button></td>
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
</html>