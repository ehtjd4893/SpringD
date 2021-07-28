<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>무야호텔</title>
	
	<link rel="stylesheet" href="resources/css/loginWindow.css"> 
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
	    

		
		// 멤버 로그인, 관리자 로그인을 변경해주는 함수
		function fn_toggle_mode(){
			$('#mem_to_admin').click(function(){
				$('#mem_mode').toggleClass('hide');
				$('#admin_mode').toggleClass('hide');
			});
			
			$('#admin_to_mem ').click(function(){
				$('#mem_mode').toggleClass('hide');
				$('#admin_mode').toggleClass('hide');
			});
		}
		
		function fn_closeLogin(){	// 로그인창에서 x 클릭시 로그인창 닫힘
			$('.form').toggleClass('hide');
		}	// fn_closeLogin
		
		function fn_showLogin(){
			$('.form').toggleClass('hide');
		}	// 로그인 화면 보여주기
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
					
					<c:if test="${loginUser eq null && loginAdmin eq null}">
						<a href="#" onclick='fn_showLogin();'>로그인</a>
			 		</c:if>
			 		<c:if test="${loginUser ne null || loginAdmin ne null}">
			 			<a href="#" onclick="location.href='logout.do'">로그아웃</a>
					</c:if>
					<a href="joinPage.do">회원가입</a>
					<a href="">예약하기</a>
					<a href="boardPage.do">게시판</a>
					<a href="">이벤트</a>
					<a href="roomPage.do">객실</a>
				</div>
				<div class="header_right">
					<span>Seoul</span>
					<span id="date2"></span>
					<c:if test="${loginUser eq null && loginAdmin eq null}">
						<a href="#" onclick='fn_showLogin();'>로그인</a>
			 		</c:if>
			 		<c:if test="${loginUser ne null || loginAdmin ne null}">
			 			<a href="#" onclick="location.href='logout.do'">로그아웃</a>
					</c:if>
					<a href="joinPage.do">회원가입</a>
					<a href="">예약하기</a>
				</div>
				<div class="header_left">
					<a href="boardPage.do">게시판</a>
					<a href="">이벤트</a>
					<a href="roomPage.do">객실</a>
				</div>
			</div>
			
		</header>
		
		<div id="mem_mode" class="myMenu">
			<form action="login.do" method="post">
  	   	 	<div class="form hide">
  	   	 		<h2 style="text-align:center">회원 로그인</h2>
				<a href="#" onclick="fn_showLogin()"><i class="fas fa-times fa-3x"></i></a>
   				 <div class="form2">
     				<div class="form3">
     					<label for="id">아이디</label><input type="text" name="mId" id="mId">
      					<div class="clear"></div>
      					<label for="password">비밀번호</label><input type="password" name="mPw" id="mPw">
     				</div>	<!-- form3 -->
     				<input type="submit" id="login_btn" value="로그인">
     				<div class="clear"></div>
     				<div class="form4">
      					<div class="clear"></div>
     						<label><input type="button" value="회원가입" onclick='location.href="joinPage.do"'></label>
     						<label><input type="button" value="아이디 찾기" onclick='location.href="findIdPage.do"'></label>
     						<label><input type="button" value="비밀번호 찾기" onclick='location.href="findPwPage.do"'></label>
     						<label><input type="button" id="mem_to_admin" value="관리자로 로그인하기"></label>
					</div>	<!-- form4 -->
				</div>	<!-- form2 -->
			</div>	<!-- form -->
			</form>
		</div>	<!-- myMenu -->
		
		<div id="admin_mode" class="myMenu disabled">
			<form action="loginAdmin.do" method="post">
  	   	 	<div class="form hide">
  	   	 		<h2 style="text-align:center">관리자 로그인</h2>
				<a id="closeLogin"><i class="fas fa-times fa-3x"></i></a>
   				 <div class="form2">
     				<div class="form3">
     					<label for="id">아이디</label><input type="text" name="mId" id="mId">
      					<div class="clear"></div>
      					<label for="password">비밀번호</label><input type="password" name="mPw" id="mPw">
     				</div>	<!-- form3 -->
     				<input type="submit" id="login_btn" value="로그인">
     				<div class="clear"></div>
     				<div class="form4">
      					<div class="clear"></div>
     						<label><input type="button" id="admin_to_mem" value="회원으로 로그인하기"></label>
					</div>	<!-- form4 -->
				</div>	<!-- form2 -->
			</div>	<!-- form -->
			</form>
		</div>	<!-- myMenu -->
		
		<section>
	