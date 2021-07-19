<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta  charset=UTF-8>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		fn_ch();
		fn_emailCheck();
		fn_email_code();
		fn_email_auth();
		fn_doReservation();
	});
	
	//체크박스('회원정보와 동일하다') 클릭시, 정보 뿌려줌
	function fn_ch(){
		$('#sameUser_box').click(function(){
			if($("input:checkbox").is(":checked") == true) {
				
				//로그인 안되어있을시 , 컨펌 띄우고(확인누를시 로그인 페이지로 이동/아닐시 페이지 유지)
				<c:if test="${empty loginUser}">
					if(confirm('로그인 하시겠습니까 ?')){
						location.href="loginPage.do";
					} 
					$('input').prop("checked", false);	//로그인 안할시, 체크박스 해제
				</c:if>

				//로그인 되어있을시, 그냥 회원정보 띄워주기
				<c:if test="${ not empty loginUser}">
					$('#booker').val('${loginUser.getMName()}');
					$('#email').val('${loginUser.getMEmail()}');
					$('#tel').val('${loginUser.getMPhone()}');
				</c:if>
				
			}//if끝
		});
	}
	
	//이메일 형식 검사	
	function fn_emailCheck(){
		$('#email').blur(function(){
			var regEmail =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(!regEmail.test($('#email').val())){ // email정규식 조건을 통과하지 못 했을 경우
				$('.email_result').text('이메일 형식이 잘못입력되었습니다.');
				return false;
			}else{//정규식 통과시
				$('.email_result').text('');
			}
			fn_email_code();
		});
	}
		
	
	// 이메일 인증코드 받기(emailCode)
	// 이메일 인증코드 받기(root-context에서 이메일 bean 생성)
	function fn_email_code(){
		$('#email_code_btn').click(function(){
			if($('#email').val() == ''){
				alert('이메일을 입력하세요.');
				$('#email').focus();
				return false;
			}
			$.ajax({
				url: 'emailCode.do',
				type: 'get',
				data: 'mEmail=' + $('#email').val(),
				dataType: 'json',
				success: function(resultMap){
					alert('인증코드가 발송되었습니다. 메일을 확인하세요.');
					fn_email_auth(resultMap.authCode);
				},
				error: function(xhr, textStatus, errorThrown) {
					
				}
			});
		});
	}
	// 이메일 인증(emailAuth)
	var authPass = false;
	function fn_email_auth(authCode){
		$('#email_auth_btn').click(function(){
			if(authCode == $('#user_key').val()){
				$('.emailAuth_result').text('인증되었습니다.');
				authPass = true;
			} else{
				$('.emailAuth_result').text('인증에 실패했습니다. 다시 시도해주세요.');
				authPass = false;
			}
		});
	}
		
	
	//이메일 인증했는지 + (이름,휴대폰 적었는지) => 됐다면 (영수증)페이지 이동 / 아니라면 안내문자
	function fn_doReservation(){
		$('#doReservation_btn').click(function(){
			$('#f').attr('action','receiptPage.do');
			$('#f').submit();
		});
	}
	
	
	
	
	
	
	</script>
	<style type="text/css">
		table,tr,td{
		 border: 1px solid pink;
		 text-align: center;
		}
	</style>
</head>
<body>

	<h1>예약정보</h1>
	<form id="f">
	<!-- <input type="hidden" name="page" value="reservation/revInfoPage"> -->
		<input type="hidden" id="rNo" name="rNo" value="${rNo}">
	 	<input type="hidden" name="checkIn" value="${checkIn}">
	 	<input type="hidden" name="checkOut" value="${checkOut}">
	 	<input type="hidden" name="people" value="${people}">
	 	<input type="hidden" name="food" value="${food}">
	 	<input type="hidden" name="totalPay" value="${totalPay}">
	 	<input type="hidden" name="name" value="${loginUser.getMName()}">
	 	
		<table>
			<thead>
				<tr>
					<!-- 체크시 ${loginUser}의 이름/이메일/휴대폰  뿌려줌 -->
					<td colspan="2"> <label><input type="checkbox" id="sameUser_box"> 회원정보와 동일합니다 </label> </td> 
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>이름</td>
					<td><input type="text" name="booker" id="booker"> </td>
				</tr>
				<tr>
					<td>이메일</td>
					<!-- 이메일 인증할 계정 + 이메일 정규식 적용 -->
					<td> 
					<input type="text" name="email" id="email"> 
					<input type="button" id="email_code_btn"  value="인증번호 전송"><br>
					<span class="email_result"></span>  
					</td>
				</tr>
				<tr>
					<td>이메일 인증코드</td>
					<!-- 이메일 인증하기 -->
					<td> 
						<input type="text" id="user_key">
						<input type="button" id="email_auth_btn" value="인증확인"> <br>
						<span class="emailAuth_result"></span> 
						
					</td>
				</tr>
				<tr>
					<td>휴대폰 </td>
					<td><input type="text" name="tel" id="tel"> </td>
				</tr>
				<tr>
					<td>요청사항</td>
					<td><textarea rows="" cols=""></textarea> </td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2"> <input type="button" id="doReservation_btn" value="예약하기"> </td>
				</tr>
			</tfoot>
		</table>
	</form>

</body>
</html>