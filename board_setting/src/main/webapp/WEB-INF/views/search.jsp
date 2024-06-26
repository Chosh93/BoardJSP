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
	.web-search {
    display: flex;
    flex-direction: column;
	}
	.web-search img{
		width: 20%;
		height: 20%;
	}
</style>
</head>
<body>
<div class="searchDiv" style="padding : 0 110px 0 110px;">
	<div class="search-header" style="text-align: center; padding: 35px 0 25px 0; width: 100%; height: 50px">
		<a href="http://localhost:8080/search"><img src="../../../img/wooriict.png" style="height: 40px;"></a>
		<input type="text" class="searchInput" onkeypress="handleKeyPress(event)" style="margin-left: 40px; width: 50%;">
		<button onclick="searchWeb();" style="margin-left: 10px;">검색</button>
	</div>
	<ul class="nav nav-tabs" style="margin-top: 40px;">
		<li role="presentation" class="web"><a onclick="searchWeb();" style="cursor: pointer">웹 문서</a></li>
		<li role="presentation" class="vclip"><a onclick="searchVclip();" style="cursor: pointer">동영상</a></li>
		<li role="presentation" class="image"><a onclick="searchImage();" style="cursor: pointer">이미지</a></li>
	</ul>
	<div class="web-search" style="padding-top: 30px;"></div>
	<div class="more-search" style="text-align: center;"></div>
</div>
</body>
<script>
var currentPage = 1;

function searchWeb(){
	if(vaildateWord()){
		currentPage = 1;
		sendSearchWeb();
	}
}

function moreWebPage(){
	currentPage++;
	sendSearchWeb();
}

function searchVclip(){
	if(vaildateWord()){
		currentPage = 1;
		sendSearchVclip();
	}
}

function moreVclipPage(){
	currentPage++;
	sendSearchVclip();
}

function searchImage(){
	if(vaildateWord()){
		currentPage = 1;
		sendSearchImage();
	};
}

function moreImgPage(){
	currentPage++;
	sendSearchImage();
}

function vaildateWord(){
	var word = $(".searchInput").val();
	if(word === ""){
		alert("검색어를 입력해 주세요.");
		return false;
	}
	return true;
}

function sendSearchWeb(){
	var page = 1;
	$.ajax({
		type:"GET",
		url: "https://dapi.kakao.com/v2/search/web?sort=accuracy",
		headers: {Authorization: "KakaoAK c6cee192b1d1e6271a03a17adce07537"},
		data: {
			query: $(".searchInput").val(),
			page: currentPage
		},
		success: function(response){
			updateWebSearchList(response);
			$(".nav-tabs .web").addClass("active").siblings().removeClass("active");
		},
		error: function(xhr, status, error){
			console.log(error);
		}
	})
}

function updateWebSearchList(searchList){
	var searchBody = $('.web-search');
	var moreBody = $('.more-search');
	searchBody.empty();
	$.each(searchList.documents, function(index, search) {
        var cleanTitle = $('<div>').html(search.title).text();
        var cleanContents = $('<div>').html(search.contents).text();
        var title = $('<a>').attr('href', search.url).text(cleanTitle).css('font-size', '20px');
        var contents = $('<p>').text(cleanContents);
        var urlLink = $('<a>').attr('href', search.url).text(search.url);
        var datetime = $('<span>').text('작성일: ' + search.datetime);

        searchBody.append(title);
        searchBody.append(urlLink);
        searchBody.append(contents);
        searchBody.append(datetime);
		searchBody.append('<br><br>');
    });
    if(!searchList.meta.is_end){
        var more = $('<a>').attr('onclick', 'moreWebPage()').text('더보기').css({
        	'font-size': '20px',
        	'cursor': 'pointer'
        });
        moreBody.empty().append(more);
    }
}

function sendSearchVclip(){
	var text = $(".searchInput").val();
	$.ajax({
		type:"GET",
		url: "https://dapi.kakao.com/v2/search/vclip?sort=accuracy",
		headers: {Authorization: "KakaoAK c6cee192b1d1e6271a03a17adce07537"},
		data: {
			query: $(".searchInput").val(),
			page: currentPage
		},
		success: function(response){
			updateVclipSearchList(response);
			$(".nav-tabs .vclip").addClass("active").siblings().removeClass("active");
		},
		error: function(xhr, status, error){
			console.log(error);
		}
	})
}

function updateVclipSearchList(searchList){
    var searchBody = $('.web-search');
    var moreBody = $('.more-search');
    searchBody.empty();
    console.log(searchList);
    $.each(searchList.documents, function(index, search) {
    	var container = $('<div>').css('display', 'flex');
        var title = $('<a>').attr('href', search.url).text(search.title).css('font-size', '20px');
        var image = $('<img>').attr('src', search.thumbnail).css('cursor', 'pointer');
        image.click(function(){
			window.open(search.url, '_blank');
        })
        var urlLink = $('<a>').attr('href', search.url).text(search.url);
        var playtime = $('<p>').text('playtime: ' + search.play_time).css('margin', '0');;
        var datetime = $('<p>').text('작성일: ' + search.datetime).css('margin', '0');;
        var infoContainer = $('<div>').css({
            'display': 'flex',
            'flex-direction': 'column', // 수직 방향으로 배치
            'margin-left': '10px' // 요소들 사이의 간격 설정
        });
        
        container.append(image); // 이미지 추가
        infoContainer.append(title);
        infoContainer.append(urlLink);
        infoContainer.append(playtime);
        infoContainer.append(datetime);
        container.append(infoContainer);
        searchBody.append(container);
        searchBody.append('<br><br>');
    });
    if(!searchList.meta.is_end){
        var more = $('<a>').attr('onclick', 'moreVclipPage()').text('더보기').css({
        	'font-size': '20px',
        	'cursor': 'pointer'
        });
        moreBody.empty().append(more);
    }
}

function sendSearchImage(){
	var text = $(".searchInput").val();
	$.ajax({
		type:"GET",
		url: "https://dapi.kakao.com/v2/search/image?sort=accuracy",
		headers: {Authorization: "KakaoAK c6cee192b1d1e6271a03a17adce07537"},
		data: {
			query: $(".searchInput").val(),
			page: currentPage
		},
		success: function(response){
			updateImgSearchList(response);
			$(".nav-tabs .image").addClass("active").siblings().removeClass("active");
		},
		error: function(xhr, status, error){
			console.log(error);
		}
	})
}

function updateImgSearchList(searchList){
    var searchBody = $('.web-search');
    var containGrid = $('<div>').css({
    	'display': 'grid',
	    'margin-top': '10px',
	    'align-content': 'center',
	    'justify-content': 'center',
	    'grid-template-columns': 'repeat(auto-fit, 150px)',
	    'gap': '1rem'
    });
    var moreBody = $('.more-search');
    searchBody.empty();
    $.each(searchList.documents, function(index, search) {
        var view = $('<div>').css({
        	'display': 'flex',
        	'flex-direction': 'column'
        });
        var image = $('<img>').attr('src', search.thumbnail_url).css({
            'width': '100px',
            'height': '100px',
            'cursor': 'pointer'
        });
        image.click(function(){
			window.open(search.doc_url, '_blank');
        })
        view.append(image);
        containGrid.append(view);
    });
    searchBody.append(containGrid);
    if(!searchList.meta.is_end){
        var more = $('<a>').attr('onclick', 'moreImgPage()').text('더보기').css({
        	'font-size': '20px',
        	'cursor': 'pointer'
        });
        moreBody.empty().append(more);
    }
}

function handleKeyPress(event) {
	if (event.keyCode === 13){
		searchWeb();
	}
}
</script>
</html>