<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./common/common.jsp" %>
<%@ include file="./common/nav.jsp" %>
<%@ page import = "java.util.*" %>
<%
    int year = 0; 
    int month = 0; // 0 ~ 11
    
    // 년도, 월 중 하나라도 지정(넘겨져 오지)되지 않으면 오늘날짜 기준으로 월달력 출력
    if(request.getParameter("year") == null || request.getParameter("month") == null) {
        Calendar today = Calendar.getInstance();
        year = today.get(Calendar.YEAR);
        month = today.get(Calendar.MONTH);
    } else {
        // 출력하고자 하는 달력의 년도와 월
        year = Integer.parseInt(request.getParameter("year")); // 2022,..
        month = Integer.parseInt(request.getParameter("month")); // 0 ~ 11
        
        // 이전달 클릭 year, month-1 / 다음달 클릭 year, month+1
        // -1 -> 11,year--  12 -> 0,year++
        if(month == -1) {
            month = 11;
            year = year-1;
        }
        if(month == 12) {
            month = 0;
            year = year+1;
        }
    }
    // 출력하고자 달의 1일 객체 + 1일 요일 + 마지막 날짜
    Calendar firstDate = Calendar.getInstance();
    firstDate.set(Calendar.YEAR, year);
    firstDate.set(Calendar.MONTH, month);
    firstDate.set(Calendar.DATE, 1);
    int firstDay = firstDate.get(Calendar.DAY_OF_WEEK); // 1일의 요일 정보(1일,2월,....,7토)
    int lastDate = firstDate.getActualMaximum(Calendar.DATE);
    
    // 출력 알고리즘(td의 개수 구하기)
    int startBlankCnt = firstDay - 1;
    int endBlankCnt = 0;
    if((startBlankCnt+lastDate)%7 != 0) {
        endBlankCnt = 7 - (startBlankCnt+lastDate) % 7;
    }
    int tdCnt = startBlankCnt + lastDate + endBlankCnt;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
     td{
        width:100px;
        height:100px;
        cursor: pointer;
     }
     
     th{
        height:30px;
        font-weight: normal;
     }
     
     #scheduleTable td{
     	height:30px;
     }
     
     #importantCheckbox:checked + #importantLabel::before {
    content: "*";
    color: red; /* * 표시의 색상 */
}
     
</style>
</head>
<body>
<div class="calendarDiv" style="padding : 0 110px 0 110px;">
    <h1 style="text-align: center; padding:0 0 15px 0;"><%=year %></h1>
    <div style="text-align: center; padding: 0 0 50px 0;">
        <span >
            <a class="btn btn-outline-dark btn-sm" href="<%=request.getContextPath()%>/calendar?year=<%=year%>&month=<%=month-1%>">
			    [이전달]
			</a>
        </span>
        <span><%=month + 1%>월</span>
        <span>
            <a class="btn btn-outline-dark btn-sm" href="<%=request.getContextPath()%>/calendar?year=<%=year%>&month=<%=month+1%>">
                [다음달]
            </a>
        </span>
    </div>
    <div id="calendarContent">
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
            <tr>
                <%
                    for(int i=1; i<=tdCnt; i++) {
                %>
                <%
                    boolean isEmpty = (i <= startBlankCnt || i > startBlankCnt + lastDate);
                %>
                <td<% if (!isEmpty) { %> onclick="showModal(<%= year %>,<%= month+1 %>,<%= i-startBlankCnt %>)" <% } %>>
                    <%
                        if (!isEmpty) {
                            if(i%7 == 0) {
                    %>
                                <span class="text-primary"><%=i-startBlankCnt%></span>
                    <%
                            } else if(i%7 == 1) {
                    %>
                                <span class="text-danger"><%=i-startBlankCnt%></span>
                    <%
                            }else {
                    %>
                                <span><%=i-startBlankCnt%></span>
                    <%
                            }   
                        } else {
                    %>
                            &nbsp;
                    <%
                        }
                    %>
                </td>
                <%
                        if(i!=tdCnt && i%7 == 0) {
                %>
                        </tr><tr>
                <%
                        }
                    }
                %>
            </tr>
        </table>
    </div>
</div>
<!-- <div class="modal" tabindex="-1">-->
<div class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">스케줄 입력</h5>
        <p class="modal-ymd"></p>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeModal();"></button>
      </div>
      <div class="modal-body">
        <table style="width:100%; padding:0;">
        	<tr>
        		<th style="width:20%;"><b>시간</b></th>
        		<th style="width:60%;"><b>내용</b></th>
        		<th style="width:10%;"><b>중요</b></th>
        		<th style="width:10%;"><b>삭제</b></th>
        	</tr>
        	<tbody id="scheduleTable"></tbody>
        </table>
        <br>
        <div class="modal-input">
	        <label>시간</label><br>
	        <input type="time"><br><br>
	        <label>내용</label><br>
	      	<input style="width:100%;" type="text" placeholder="스케줄 내용을 입력해 주세요."><br><br>
	      	<input type="checkbox" id="importantCheckbox">
			<label>중요 스케줄(체크시 <font color="#ff0000">*</font>표시 됩니다.)</label>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="closeModal();">취소</button>
        <button type="button" class="btn btn-primary" onclick="saveSchedule();">저장</button>
      </div>
    </div>
  </div>
</div>
</body>
<script>
$(document).ready(function() {
	getAllSchedule();
});

// 현재 월 스케줄 전부 가져오기
function getAllSchedule(){
	$.ajax({
        type: "POST",
        url: "<%=request.getContextPath()%>/getAllSchedule",
        data: { year: <%=year%>, month: <%=month + 1%> },
        dataType: "json",
        success: function(data) {
        	console.log(data);
            $.each(data, function(index, item){
                var year = item.calyear;
                var month = item.calmonth;
                var day = item.calday;
                if(year === "<%=year%>" && month === "<%=month+1%>"){
                    $("td").each(function() {
                        var tdText = $(this).find("span").text(); // td 내의 span 요소의 텍스트 값 가져오기
                        if (tdText === day) {
                        	$(this).addClass("bg-success p-2 text-dark bg-opacity-50");
                        }
                    });
                }
            })
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
        }
    });
}

// 해당 날짜 스케줄 가져오기
function loadSchedule(year, month, day) {
	console.log(year, month, day);
    $.ajax({
        type: "POST",
        url: "<%=request.getContextPath()%>/getSchedule",
        data: { year: year, month: month, day: day },
        dataType: "json",
        success: function(data) {
            var tableBody = $("#scheduleTable");
            console.log(data);
            tableBody.empty(); // 테이블 내용 초기화

            // 스케줄 데이터를 테이블에 추가
            $.each(data, function(index, item) {
                var row = $("<tr>");
                row.append($("<td>").text(item.caltime));
                row.append($("<td>").text(item.calcontents));
                row.append($("<td>").text(item.calreq === 'true' ? "중요" : "일반"));
                var deleteButton = $("<button>").text("삭제").click(function() {
                	deleteSchedule(item.calno);
                });
                row.append($("<td>").append(deleteButton));
                tableBody.append(row);
            });
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
        }
    });
}

//스케줄 작성
function saveSchedule() {
	var time = $('input[type="time"]').val();
	var contents = $('input[type="text"]').val();
	var reg = $('input[type="checkbox"]').prop('checked');
	var msg = "";

    if (time === "") {
    	msg += "시간, ";
    }
    if (contents === "") {
    	msg += "내용, ";
    }

    if (msg !== "") {
    	msg = msg.slice(0, -2); // 마지막 쉼표와 공백 제거
        alert(msg + "을(를) 입력하세요."); // 누락된 입력값을 알림에 출력
        return false;
    }
    var dataForm = {
   		calyear: $(".modal").data("year"),
       	calmonth: $(".modal").data("month"),
       	calday: $(".modal").data("day"),
       	caltime: $('input[type="time"]').val(),
       	calreq: $('input[type="checkbox"]').prop('checked'),
       	calcontents: $('input[type="text"]').val()
   	}
   	$.ajax({
        type: 'POST',
        url: 'calendar/write',
        contentType: 'application/json',
        data: JSON.stringify(dataForm),
      	success: function(response) {
          	console.log("저장 성공");
          	closeModal();
        },
        error: function(xhr, status, error) {
            console.log("저장 실패");
        }
   	});
}

// 스케줄 삭제
function deleteSchedule(calno){
	var dataForm = {
	   		calno: calno,
	   		calyear: $(".modal").data("year"),
	       	calmonth: $(".modal").data("month"),
	       	calday: $(".modal").data("day")
	   	}
   	$.ajax({
   	   	type: 'POST',
   	   	url: 'calendar/delete',
   	   	contentType: 'application/json',
   	   	data: JSON.stringify(dataForm),
   	   	success: function(response){
   	   	   	console.log("삭제 성공");
   	   		loadSchedule($(".modal").data("year"), $(".modal").data("month"), $(".modal").data("day"));
   	   		updateCalendar($(".modal").data("year"), $(".modal").data("month"), $(".modal").data("day"));
   	   	},
   	   	error: function(xhr, status, error) {
   	   	   	console.log("삭제 실패");
   	   	}
	});
}

function updateCalendar(year, month, day) {
    var dateCell = $("td").filter(function() {
        var spanText = $(this).find("span").text();
        return spanText === day.toString();
    });

    // 해당 td 요소의 클래스 제거
    dateCell.removeClass("bg-success p-2 text-dark bg-opacity-50");
}

function showModal(year, month, day){
    loadSchedule(year, month, day);
    $(".modal").css("display", "block");
    $(".modal").data("year", year);
    $(".modal").data("month", month);
    $(".modal").data("day", day);
    $(".modal-ymd").html(year + "년 " + month + "월 " + day + "일");
}
function closeModal() {
	$(".modal").css("display", "none");
	$('input[type="time"]').val('');
    $('input[type="text"]').val('');
    $('input[type="checkbox"]').prop('checked', false);
    getAllSchedule();
}
</script>
</html>
