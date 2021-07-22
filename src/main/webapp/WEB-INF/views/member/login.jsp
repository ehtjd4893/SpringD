<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
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
	<!-- 카카오 로그인 -->
	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
	<script type="text/javascript">
		// 초기화 시키기
		$(document).ready(function(){
			Kakao.init('자바스크립트 앱키 입력');
			Kakao.isInitialized();
		});
		// 카카오 로그인 버튼 생성
		function loginWithKakao(){
			Kakao.Auth.authorize({
				redirectUri: 'http://localhost:8080/user/loginpage_kakao_callback'
			});
		}

	</script>

</head>
<body>

	<!-- 비로그인 화면 -->
	<c:if test="${loginUser == null}">
		<!-- MOOYA HOTEL 로그인 -->
		<div class="login_form">
			<form id="f" action="login.do" method="post">
				<input type="text" name="mId" id="mId" placeholder="ID"><br>
				<input type="password" name="mPw" id="mPw" placeholder="Password"><br><br>
				<button>로그인</button>
			</form>
		</div><br>
		
		<!-- 회원가입, 아이디&비번 찾기 -->
		<div class="joinAndFind">
			<a href="joinPage.do">회원가입</a>
			<a href="findIdAndPwPage.do">아이디/비밀번호 찾기</a>
			<a href="index.do">돌아가기</a>
		</div><br>
		
		<!-- 네이버 로그인 -->
		
		<!-- 카카오 로그인 -->
		<a id="kakaoLogin_btn"></a>
	    <a href="http://developers.kakao.com/logout"></a>

		<script src="//developers.kakao.com/sdk/js/kakao.js"></script>
	    <script type='text/javascript'>
	 		// 발급 받은 JavaScript 키
	        window.Kakao.init('464a8f29a97a043193116da7f11294e8');
	     	// 카카오 로그인 버튼 생성
	        Kakao.Auth.createLoginButton({
	            container: '#kakaoLogin_btn',
	            scope: 'account_email', // 동의 항목(이메일)
	            success: function (authObj) {
	            	url: '/v2/user/me',
	                alert(JSON.stringify(authObj));
	            },
	            fail: function (err) {
	                alert(JSON.stringify(err));
	            }
	        });
		</script>
		
	</c:if>
	
	<!-- 로그인 성공 화면 -->
	<c:if test="${loginUser != null}">
		<h3>${loginUser.MId} 님 환영합니다!</h3>
		<a href="boardPage.do">게시판</a>
		<a href="myPage.do">마이페이지</a>
		<a href="logout.do">로그아웃</a>
	</c:if>

</body>
</html>
