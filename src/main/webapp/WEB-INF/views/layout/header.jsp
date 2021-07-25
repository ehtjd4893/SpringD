<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/layout.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" referrerpolicy="no-referrer" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
	    onload = function(){
			getDate();
			
			document.getElementById('privacy').onclick = function(){
		    	window.open('privacy.do', '', 'width=640, height=480, resizable=no');
			}
			document.getElementById('term').onclick = function(){
		    	window.open('term.do', '', 'width=640, height=480, resizable=no');
			}
			document.getElementById('noEmail').onclick = function(){
		    	window.open('noEmail.do', '', 'width=400, height=352, resizable=no');
			}
		}
	    
	    function getDate() { 
	           date = setInterval(function () { 
	               var dateString = ""; 

	               var newDate = new Date(); 

	               dateString += ("0" + newDate.getHours()).slice(-2) + ":"; 
	               dateString += ("0" + newDate.getMinutes()).slice(-2) ; 
	               //document.write(dateString); 문서에 바로 그릴 수 있다. 
	               $("#date1").text(dateString); 
	               $("#date2").text(dateString); 
	           }, 1000);   // 1초 단위로  
	    }   
    </script>
</head>
<body>

	<header>
		
		<div class="header">
			<h1 class="logo">
				<a href="index.do">MOOYA HOTEL</a>
			</h1>
			<div class="small_header_right">
				<span>Seoul</span>
				<span id="date1"></span>
				<a href="loginPage.do">로그인</a>
				<a href="joinPage.do">회원가입</a>
				<a href="">예약하기</a>
				<a href="">게시판</a>
				<a href="">이벤트</a>
				<a href="">객실</a>
			</div>
			<div class="header_right">
				<span>Seoul</span>
				<span id="date2"></span>
				<a href="loginPage.do">로그인</a>
				<a href="joinPage.do">회원가입</a>
				<a href="">예약하기</a>
			</div>
			<div class="header_left">
				<a href="">게시판</a>
				<a href="">이벤트</a>
				<a href="">객실</a>
			</div>
		</div>
	
	</header>
	
	<section id="section">
	