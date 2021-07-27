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
		fn_next();
	});
	
	//확인 클릭
	function fn_next(){
		$('#code_check').click(function(){
			fn_revCheck();
		});
	}
	
	//예약번호 확인
	function fn_revCheck(){
		$.ajax({
			url: 'emailRevCode.do',
			type: 'get',
			data: 'reCode=' + $('#reCode').val(),
			dataType: 'json',
			success: function(res){
				if(res.result == 0){
					//있는 예약이면 페이지 이동
					$('#code_f').attr('action','nonMemReservationPage.do');
					$('#code_f').submit();
				} else{
					//없는 예약코드시 
					alert('존재하지 않는 예약번호입니다.');
					return false;
				}
			},
			error: function(xhr, textStatus, errorThrown) {
				
			}
		});
	}
 
</script>
<style type="text/css">
	body{
		padding: auto;
		margin: auto;
	}
	#subData{
		padding: auto;
		margin: auto;
		border: 1px solid black;
		width: 500px;
		height:100px;
		text-align: center;
		line-height: 50px;
	}
</style>
</head>
<body>

	<!-- 비회원 예약 코드 -->
        <div id="subData">
	        <form id="code_f">
	        	<div id="popup_title">이메일로 발송된 예약 코드 </div>
	        	<a id="close"><i class="fas fa-times fa-3x"></i></a>
	        	예약 코드 <input type="text" id="reCode" >
	        	<input type="button" value="확인" id="code_check" >
	        </form>
       </div>
</body>
</html>