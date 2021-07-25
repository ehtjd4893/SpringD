<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="로그인" name="title" />
</jsp:include>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		// 페이지 로드
		$(document).ready(function(){
			fn_login();
		});
		// 로그인(login)
		function fn_login(){
			$('#f').submit(function(e){
				if($('#mId').val() == '' || $('#mPw').val() == ''){
					alert('아이디와 비밀번호는 필수입니다.');
					e.preventDefault();
					$('#mId').focus();
					return false;
				}
			});
		}
	</script>
	<!-- 카카오 API -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript">
		function fn_kakaoLogin(){
			window.parent.location.href="https://"
		}

	</script>
	
	<link rel="stylesheet" href="resources/css/layout.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" referrerpolicy="no-referrer" />
	<style>
		.container{
			margin: 0 auto;
			width: 1200px;
			height: 500px;
			margin-top: 100px;
		}
		.login_form{
			margin: 0 auto;
			width: 400px;
			padding-top: 100px;
			text-align: center;
		}
		#f input{
			width: 300px;
			height: 50px;
			border: 1px solid black;
		}
		#f button{
			width: 300px;
			height: 50px;
			background-color: #f1e3c4;
			border: none;
		}
		#f button:hover {
			cursor: pointer;
		}
	</style>
	
	
	<div class="container">
		<div class="login_form">
			<!-- 비로그인 화면 -->
			<c:if test="${loginUser == null}">
				<!-- MOOYA HOTEL 로그인 -->
				<form id="f" action="login.do" method="post">
					<input type="text" name="mId" id="mId" placeholder="ID"><br><br>
					<input type="password" name="mPw" id="mPw" placeholder="Password"><br><br>
					<button>로그인</button>
				</form>
				<br>
				
				<!-- 네이버 로그인 -->
				
				<!-- 카카오 로그인 -->
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=9ab84d473da9b37db0b56a531ebd800d
            			&redirect_uri=http://localhost:9090/loginPage.do&response_type=code">
				    <img src="//k.kakaocdn.net/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300px;"/>
				</a>
				<br>
				
				<!-- 아이디&비번 찾기 -->
				<div class="find_form">
					<a href="findIdAndPwPage.do">아이디/비밀번호 찾기</a>
				</div><br>
			</c:if>
			
			<!-- 로그인 성공 화면 -->
			<c:if test="${loginUser != null}">
				<h3>${loginUser.MId} 님 환영합니다!</h3>
				<a href="myPage.do">마이페이지</a>
				<a href="logout.do">로그아웃</a>
			</c:if>
		</div>
	</div>
<%@ include file="../layout/footer.jsp" %> 

