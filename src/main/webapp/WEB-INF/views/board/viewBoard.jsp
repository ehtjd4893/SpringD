<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="resources/css/loginWindow.css"> 
	<title>게시글</title>
	
	<script>
		$(function(){
			fn_insert_board();	// 새 글 작성 버튼 클릭시 로그인창 켜지거나 페이지 이동하는 함수
			fn_showLogin();	// 로그인 버튼 클릭시 로그인창이 펴지는 함수
			getDate();	// 로그인창에서 x 클릭시 로그인창 닫힘
			fn_closeLogin();
		})	// onload 함수의 끝
		
		function fn_closeLogin(){	// 로그인창에서 x 클릭시 로그인창 닫힘
			$('#closeLogin').click(function(){
				$('.form').toggleClass('hide');
			})	// onclick#
		}	// fn_closeLogin
		
		function fn_showLogin(){
			$('.showLogin').on('click',function(){
				$('.form').toggleClass('hide');
			});	// onclick
		}	// fn_login_btn
		
		function fn_insert_board(){
			$('#insert_board_btn').on('click', function(){
				if(${loginUser == null}){
					
				}	// loginUser eq null
			});	// onclick
		}	// fn_insert_board 

	    function getDate() { 
	        date = setInterval(function () { 
	            var dateString = ""; 

	            var newDate = new Date(); 

	            dateString += ("0" + newDate.getHours()).slice(-2) + ":"; 
	            dateString += ("0" + newDate.getMinutes()).slice(-2) ; 
	            //document.write(dateString); 문서에 바로 그릴 수 있다. 
	            $("#date").text(dateString); 
	        }, 1000);	// 1초 단위로  
	    } 

	</script>
	
<body>
 
	
	<h1>게시판</h1>

		<div class="btn_box">
			<span>Seoul</span>
			<span id="date"></span>
	 		<input type="button" class="showLogin" value="로그인">
		</div>
		<div class="myMenu">
			<form action="insertBoard.do" method="post">
  	   	 	<div class="form hide">
  	   	 		<h2 style="text-align:center">로그인</h2>
				<a id="closeLogin"><i class="fas fa-times fa-3x"></i></a>
   				 <div class="form2">
     				<div class="form3">
     					<label for="user">아이디</label><input type="text" id="user">
      					<div class="clear"></div>
      					<label for="user">비밀번호</label><input type="password" id="user">
     				</div>	<!-- form3 -->
     				<input type="submit" id="login_btn" value="로그인">
     				<div class="clear"></div>
     				<div class="form4">
      					<div class="clear"></div>
     						<label><input type="button" value="회원가입"></label>
     						<label><input type="button" value="아이디/비밀번호 찾기"></label>
					</div>	<!-- form4 -->
				</div>	<!-- form2 -->
			</div>	<!-- form -->
			</form>
		</div>	<!-- myMenu -->

	<table>
		<thead>
			<tr>
				<td> 글번호 </td>
				<td> 작성자 </td>
				<td> 제목 </td>
				<td> 조회수 </td>
				<td> 작성일 </td>
			</tr>
		</thead>
	
		<tbody id="list">
			
		</tbody>
	</table>
	<input type="button" id="inset_board_btn" value="새 글 작성">
</body>
</html>