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
                <td onclick="showDate('<%= year %>-<%= month+1 %>-<%= i-startBlankCnt %>')">
                    <%
                        if(i>startBlankCnt && i<=startBlankCnt+lastDate) {
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
</body>
<script>
$(document).ready(function() {
    $.ajax({
        type: "POST",
        url: "<%=request.getContextPath()%>/getSchedule",
        data: { year: <%=year%>, month: <%=month + 1%> },
        dataType: "json",
        success: function(data) {
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
});
function showDate(date){
    console.log(date);    
}
</script>
</html>
