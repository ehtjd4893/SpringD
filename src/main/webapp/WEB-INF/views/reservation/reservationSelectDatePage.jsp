<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>예약 페이지</title>
<style type="text/css">
    table,tr,td{
    	border: 1px solid pink;
    	text-align: center;
    }
    input[type="text"]{
    	width: 30px;
    	text-align: center;
    }
    
</style>
<script type="text/javascript">

	//로드
	$(document).ready(function(){
		fn_selectDate();
	});
  	
	
	
	//조회하기 버튼 누름
	function fn_selectDate(){
		$('#selectDate_btn').click(function(){
			
			if($('#start_year').val()=='' || $('#start_month').val()=='' || $('#start_day').val()==''){
    			alert('체크인 날짜를 선택해주세요');
    			return false;
    		}else if($('end_year').val()=='' || $('end_month').val()=='' ||$('end_day').val()=='' ){
    			alert('체크아웃 날짜를 선택해주세요');
    			return false;
    		} 
			
			//체크인,체크아웃 값이 있을시 페이지 이동
			$('#f').attr('action','reservationRoomPage.do');
			$('#f').submit();
		});
	}
	
</script>
</head>
<body>



	<form id="f">
		<table>
			<tr>
				<td>체크인(ex 2021-07-05)</td>
				<td>체크아웃</td>
				<td>인원</td>
				<td rowspan="2"><input type="button" value="조회하기" id="selectDate_btn"></td>
			</tr>
			<tr>
				<td id="start_btn"> 
					<!-- 체크인 -->
					<input type="text" id="start" name="start"> 
				</td>
				<td id="end_btn">
					<!-- 체크아웃 -->
			 		<input type="text" id="end" name="end">
			 	</td>
				<td>
					<!-- 숙박인원수  -->
					<input type="text" value="2" size="1" name="people"> 
				</td>
				
			</tr>
		</table>
	</form>





 
</body>
</html>