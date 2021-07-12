<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>myPage</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		// 페이지 로드
		$(document).ready(function(){
			fn_update();
			fn_presentPwCheck();
			fn_updatePw();
			fn_delete();
		});
		// 회원 정보 변경(이름, 전화번호, 주소)
		function fn_update(){
			$('#update_btn').click(function(){
				if(confirm('수정하시겠습니까?')){
					$('#f').attr('action', 'updateMember.do');
					$('#f').submit();
				}
			});
		}
		// 현재 비밀번호 확인
		var presentPwPass = false;
		function fn_presentPwCheck(){
			$('#mPw0').keyup(function(){
				var obj = { // 현재 비밀번호 객체 생성
					pw: $('#mPw0').val()
				};
				$.ajax({
					url: 'presentPwCheck.do',
					type: 'post',
					contentType: 'application/json',
					data: JSON.stringify(obj),
					dataType: 'json',
					success: function(resultMap){
						if(resultMap.isCorrect){
							presentPwPass = true;
						} else{
							presentPwPass = false;
						}
					}
				});
			});
		}
		// 비밀번호 변경
		function fn_updatePw(){
			$('#pw_btn').click(function(){
				if(!presentPwPass){
					alert('현재 비밀번호가 일치하지 않습니다. 확인해주세요.');
					$('#mPw0').focus();
					return false;
				} else if($('#mPw').val() == ''){
					alert('비밀번호를  입력하세요.');
					$('#mPw').focus();
					return false;
				} else if($('#mPw').val() != $('#mPw1').val()){
					alert('새로 입력한 비밀번호가 일치하지 않습니다. 확인해주세요.');
					return false;
				} else{
					$('#f').attr('action', 'updatePw.do');
					$('#f').submit();
				}
			});
		}

	</script>
</head>
<body>
	
	<!-- 마이페이지 화면 -->
	<c:if test="${loginUser != null}">
		<h3>${loginUser.MId} 님 환영합니다!</h3>
		<form id="f" method="post">
			이름<br>
			<input type="text" value="${loginUser.MName}"><br><br>
			
			아이디<br>
			<input type="text" value="${loginUser.MId}" readonly><br><br>
			
			현재 비밀번호<br>
			<input type="password" name="mPw0" id="mPw0"><br><br>
			새 비밀번호<br>
			<input type="password" name="mPw" id="mPw"><br><br>
			새 비밀번호 확인<br>
			<input type="password" name="mPw1" id="mPw1"><br><br>
			<input type="button" id="pw_btn" value="비밀번호 변경하기"><br><br>
			
			전화번호<br>
			<input type="text" name="mPhone" value="${loginUser.MPhone}"><br><br>
			
			이메일<br>
			<input type="text" name="mEmail" value="${loginUser.MEmail}"><br><br>
			
			<input type="hidden" name="mNo" value="${loginUser.MNo}">
			<input type="button" value="정보변경하기" id="update_btn">
			<input type="button" value="돌아가기" onclick="location.href='index.do'">
		</form>
	</c:if>
	
</body>
</html>
