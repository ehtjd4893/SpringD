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
			fn_findId();
		})
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
				var obj = { // 이름과 이메일 객체 생성
						mName = $('#mName').val(),
						mEmail = $('#mEmail').val()
				};
				$.ajax({
					url: 'findId.do',
					type: 'post',
					data: JSON.stringify(obj), // 보내는 data 문자열화
					contentType : 'application/json; charset=utf-8', // 보내는 데이터가 json일 때 필수 옵션
					dataType: 'json', // 받는 data
					success: function(resultMap){
						if(resultMap.status == 500){
							alert('입력하신 정보와 일치하는 계정이 없습니다.');
							return false;
						} else if(resultMap.status == 200){
							alert("회원님이 찾으시는 ID는" + resultMap.mId + "입니다.");
							return false;
						}
					},
					error: function(xhr, textStatus, errorThrown) {
						
					}
				});
			});
		}
	</script>
</head>
<body>

	<h3>아이디/비밀번호 찾기</h3>
	
	<div class="find_form">
		<!-- 아이디 찾기 -->
		<div class="findId_form">
			<input type="radio" name="search" id="searchId" onclick="search_click(1)" checked>
			<label for="searchId">아이디 찾기</label>
		</div>
		
		<!-- 비밀번호 찾기 -->
		<div class="findId_form">
			<input type="radio" name="search" id="searchPw" onclick="search_click(2)">
			<label for="searchPw">비밀번호 찾기</label>
		</div>
	</div>
	
	<input type="button" value="로그인" onclick="location.href='index.do'">
	<input type="button" value="회원가입" onclick="location.href='joinPage.do'">


</body>
</html>

