<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디 찾기</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		// 페이지 로드
		$(document).ready(function(){
			fn_find_check();
			fn_findId();
			fn_email_code();
			fn_findPw();
		})
		// 아이디/비밀번호 찾기 radio 체크에 따른 화면 전환
		function fn_find_check(){
			$('input[type=radio][name=find]').on('click', function(){
				var chkValue = $('input[type=radio][name=find]:checked').val();
				if(chkValue == '1'){
					$('#findId_form').css('display', 'block');
					$('#findPw_form').css('display', 'none');
				} else if(chkValue == '2'){
					$('#findId_form').css('display', 'none');
					$('#findPw_form').css('display', 'block');
				}
			});
		}
		// 아이디 찾기(findId)
		function fn_findId(){
			$('#findId_btn').click(function(){
				if($('#mName').val() == ''){
					alert('이름을 입력하세요');
					$('#mName').focus();
					return false;
				} else if($('#mEmail').val() == ''){
					alert('이메일을 입력하세요.');
					$('#mEmail').focus();
					return false;
				}
				// 이름과 이메일 객체 생성(post 방식) : presentPwCheck와 마찬가지로 jackson lib 오류
				/*var obj = { 
						mName : $('#mName').val(),
						mEmail : $('#mEmail').val()
				}; */
				$.ajax({
					url: 'findId.do',
					type: 'get',
					// data: JSON.stringify(obj), // 보내는 data 문자열화
					data: 'mName=' + $('#mName').val() + '&mEmail=' + $('#mEmail').val(),
					contentType : 'application/json', // 보내는 데이터가 json일 때 필수 옵션
					dataType: 'json', // 받는 data
					success: function(resultMap){
						if(resultMap.status == 500){ // 이름과 이메일이 일치하지 않을 경우
							alert('입력하신 정보와 일치하는 계정이 없습니다.');
							$('#mName').val('');
							$('#mEmail').val('');
							return false;
						} else if(resultMap.status == 200){ // 이름과 이메일이 일치할 경우 mId 반환
							alert("회원님이 찾으시는 아이디는 " + resultMap.mId + " 입니다.");
							$('#mName').val('');
							$('#mEmail').val('');
						}
					},
					error: function(xhr, textStatus, errorThrown) {
						
					}
				});
			});
		}
		// 비밀번호 찾기(findPw) : 이메일 인증 필요
		function fn_findPw(){
			$('#mEmail2').keyup(function(){
				$.ajax({
					url: 'findPw.do',
					type: 'get',
					data: 'mId=' + $('#mId').val() + '&mEmail=' + $('#mEmail').val(),
					contentType : 'application/json',
					dataType: 'json',
					success: function(resultMap){
						if(resultMap.status == 500){
							$('.mEmail2_result').text('입력하신 아이디와 이메일이 일치하지 않습니다. 확인하세요.');
							return false;
						} else if(resultMap.status == 200){
							alert("회원님의 이메일로 임시 비밀번호를 전송하였습니다. 로그인하세요.");
							$('#mId').val('');
							$('#mEmail').val('');
						}
					},
					error: function(xhr, textStatus, errorThrown) {
						
					}
				});
			});
		}
		// 이메일 인증코드 받기(emailCode)
		function fn_email_code(){
			$('#email_code_btn').click(function(){
				if ($('#mId').val() == '' || $('#mEmail').val() == '') { // 아이디, 이메일 중 하나라도 입력 값이 없다면
					alert('아이디와 이메일 모두 입력하세요.');
					return false;
				}
				$.ajax({
					url: 'emailCode.do',
					type: 'get',
					data: 'mEmail=' + $('#mEmail').val(),
					dataType: 'json',
					success: function(resultMap) {
						alert('인증코드가 발송되었습니다.');
						fn_email_auth(resultMap.authCode);
					},
					error: function(xhr, textStatus, errorThrown) {
						
					}
				});
			});
		}
		// 이메일 인증(emailAuth)
		function fn_email_auth(authCode) {
			$('#email_auth_btn').click(function() {
				if(authCode == $('#user_key').val()) {
					alert('인증되었습니다. 비밀번호 변경 페이지로 이동합니다.');
					$('#f').attr('action', 'changePwPage.do');
					$('#f').submit();
				} else{
					alert('인증에 실패했습니다. 인증코드를 정확히 입력하세요.');
					history.back();
				}
			});
		}
	</script>
</head>
<body>

	<h3>아이디/비밀번호 찾기</h3>
	
	<div class="find_form">
		<!-- 아이디 찾기 -->
		<input type="radio" name="find" id="findId" value="1" checked="checked">
		<label for="findId">아이디 찾기</label>
		<!-- 비밀번호 찾기 -->
		<input type="radio" name="find" id="findPw" value="2">
		<label for="findPw">비밀번호 찾기</label>
	</div>
	<hr>
	
	<!-- 아이디 찾기 화면 -->
	<div id="findId_form">
		<p>가입 당시 이름과 이메일을 입력하세요.</p>
		<form id="f1">
			<!-- 이름 -->
			<div class="form_group">
				<label for="mName">이름</label><br>
				<input type="text" name="mName" id="mName" placeholder="ex) 홍길동">
			</div><br>
			<!-- 이메일 -->
			<div class="form_group">
				<label for="mEmail">이메일</label><br>
				<input type="text" name="mEmail" id="mEmail" placeholder="ex) example@naver.com">
			</div><br>
			<!-- 확인 버튼 -->
			<div class="form_group">
				<input type="button" id="findId_btn" value="확인">
			</div>
		</form>
	</div>
	<br><br>
	
	<!-- 비밀번호 찾기 화면 -->
	<div id="findPw_form" style="display: none;"> <!-- 처음에는 보이지 않고 비번찾기 시에 화면 나타내기 -->
		<form id="f2">
			<p>가입 당시 아이디와 이메일을 입력하세요.(이메일 인증 필요)</p>
			<!-- 아이디 -->
			<div class="form_group">
				<label for="mId">아이디</label><br>
				<input type="text" name="mId" id="mId" placeholder="ex) hong">
			</div><br>
			<!-- 이메일 -->
			<div class="form_group">
				<label for="mEmail2">이메일</label><br>
				<input type="text" name="mEmail2" id="mEmail2" placeholder="ex) example@naver.com"><br>
				<span class="mEmail2_result"></span>
				<input type="button" value="인증번호 받기" id="email_code_btn"><br>
				<input type="text" name="user_key" id="user_key">
				<input type="button" value="인증하기" id="email_auth_btn"><br><br>
				<span class="emailAuth_result"></span><br>
			</div><br>
		</form>
	</div>
	<br><br>
	
	<input type="button" value="로그인" onclick="location.href='index.do'">
	<input type="button" value="회원가입" onclick="location.href='joinPage.do'">

</body>
</html>

