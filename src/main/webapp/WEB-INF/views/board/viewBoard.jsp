<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Homepage</title>
	<style>
		.menu a{
			cursor: pointer;
		}
		
		.menu .hide{
			display: none;
		}
	</style>
	
	<script>
		$(function(){
			fn_insert_board();	// 새 글 작성 버튼 클릭시 로그인창 켜지거나 페이지 이동하는 함수
			fn_login_btn();	// 로그인 버튼 클릭시 로그인창이 펴지는 함수
		})	// onload 함수의 끝
		
		function fn_login_btn(){
			$('.menu>a').on('click',function(){
				var submenu = $(this).next('ul').toggleClass('hide');
			});	// onclick
		}	// fn_login_btn
		
		function fn_insert_board(){
			$('#insert_board_btn').on('click', function(){
				if(${loginUser == null}){
					
				}	// loginUser eq null
			});	// onclick
		}	// fn_insert_board 
	</script>
<body>
 
	
	<h1>게시판</h1>
	<div>
		<ul>
			<li class="menu"><a>로그인</a>
					<form id="f">
			<ul class="hide">
						<li>ID</li>
						<li>PW</li>
					</form>	
					<input type="button" id="join_btn" value="회원가입">
					<input type="button" id="find_pw_btn" value="ID 찾기">
					<input type="button" id="find_id_btn" value="PW 찾기">
					
			</ul>
		</ul>
	</div>
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