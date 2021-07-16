<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		// 페이지 로드
		$(document).ready(function(){
			fn_presentPwCheck();
			fn_updatePw();
			fn_updateMember();
			fn_leave();
		});
		// 현재 비밀번호 확인(presentPwCheck)
		var presentPwPass = false;
		function fn_presentPwCheck(){
			$('#mPw0').on('keyup', function(){
				var obj = { // 현재 비밀번호 객체 생성
						mPw: $('#mPw0').val()
				};
				$.ajax({
					url: 'presentPwCheck.do',
					type: 'post',
					data: JSON.stringify(obj), // 보내는 data 문자열화
					contentType: 'application/json',  // 보내는 데이터가 json일 때 필수 옵션
					dataType: 'json', // 받는 data
					success: function(resultMap){
						if(resultMap.isCorrect){ // session에 저장된 암호화 된 비밀번호와 일치할 경우 통과
							presentPwPass = true;
						} else{
							presentPwPass = false;
						}
					}
				});
			});
		}
		// 비밀번호 변경(updatePw)
		function fn_updatePw(){
			$('#pw_btn').on('click', function(){
				if($('#mPw0').val() == ''){ // 현재 비밀번호를 입력하지 않을 경우
					alert('현재 비밀번호를 입력하세요.');
					$('#mPw0').focus();
					return false;
				} else if(!presentPwPass){ // 위 현재 비밀번호 통과를 못 했을 경우(기존 비밀번호와 일치하지 않을 경우)
					alert('현재 비밀번호가 일치하지 않습니다. 확인해주세요.');
					$('#mPw0').focus();
					return false;
				} else if($('#mPw').val() == ''){ // 새로운 비밀번호를 입력하지 않을 경우
					alert('새 비밀번호를  입력하세요.');
					$('#mPw').focus();
					return false;
				} else if($('#mPw').val() != $('#mPw1').val()){ // 새로 입력한 비밀번호와 확인 검증이 이뤄지지 않을 경우
					alert('새로 입력한 비밀번호가 일치하지 않습니다. 확인해주세요.');
					return false;
				} else{
					$('#f').attr('action', 'updatePw.do');
					$('#f').submit();
				}
			});
		}
		// 회원 정보 변경(updateMember)
		function fn_updateMember(){
			$('#update_btn').on('click', function(){
				if($('#mName').val() == '' 
				   || $('#mPhone').val() == ''
				   || $('#mEmail').val() == ''){ // 이름, 전화번호, 이메일 중 하나라도 공백일 경우
					  alert('이름, 전화번호, 이메일은 필수정보 입니다. 내용을 입력하세요.');
					  return false;
				} else if($('#mName').val() == '${loginUser.MName}'
						  && $('#mPhone').val() == '${loginUser.MPhone}'
						  && $('#mEmail').val() == '${loginUser.MEmail}'){ // 기존에 값과 같을 경우
							 alert('변경된 정보가 없습니다.');
							 return false;
				} else{ // 변경된 정보가 있을 경우
					$('#f').attr('action', 'updateMember.do');
					$('#f').submit();
				}
			});
		}
		// 회원 탈퇴(leave)
		function fn_leave(){
			$('#leave_btn').on('click', function(){
				if (confirm('탈퇴하시겠습니까?')) {
					location.href = 'leave.do?mNo=${loginUser.MNo}';					
				}
			});
		}
	</script>
</head>
<body>
	
	<!-- 마이페이지 화면 -->
	<h3>${loginUser.MId} 님 환영합니다!</h3>
	<form id="f" method="post">
	
		이름<br>
		<input type="text" name="mName" id="mName" value="${loginUser.MName}"><br><br>
		
		아이디<span>(아이디는 수정 불가)</span><br>
		<input type="text" name="mId" id="mId" value="${loginUser.MId}" readonly><br><br>
		
		현재 비밀번호<br>
		<input type="password" name="mPw0" id="mPw0"><br><br>
		새 비밀번호<br>
		<input type="password" name="mPw" id="mPw"><br><br>
		새 비밀번호 확인<br>
		<input type="password" name="mPw1" id="mPw1"><br><br>
		<input type="button" id="pw_btn" value="비밀번호 변경하기"><br><br>
		
		전화번호<br>
		<input type="text" name="mPhone" id="mPhone" value="${loginUser.MPhone}"><br><br>
		
		이메일<br>
		<input type="text" name="mEmail" id="mEmail" value="${loginUser.MEmail}"><br><br>
		
		가입일 : ${loginUser.MRegdate}<br><br>
		
		<input type="hidden" name="mNo" value="${loginUser.MNo}">
		<input type="button" id="update_btn" value="정보변경하기">
		<input type="button" id="leave_btn" value="회원탈퇴">
		<input type="button" value="돌아가기" onclick="location.href='loginPage.do'">
	</form>
	
</body>
</html>
