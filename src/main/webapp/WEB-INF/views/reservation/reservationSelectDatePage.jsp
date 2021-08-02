<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 동적 페이지 포함(파라미터 title을 전달할 수 있다) --%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="홈페이지제목" name="title" />
</jsp:include>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>예약 페이지</title>
<style type="text/css">
	body{
		margin: 0;
    	padding: 0;
	}
    table,tr,td{
    	border: 1px solid  #c2ad99;
    	text-align: center;
    	margin: 150px auto;
    }
    input[type="text"]{
    	width: 70px;
    	text-align: center;
    }
    #box_middle{
    	margin: auto;
    	padding: auto;
    	border: 1px solid pink;
    }
</style>
<script type="text/javascript">
	$(document).ready(function(){
		fn_selectDate();
	});
  	
	
	
	//조회하기 버튼 누름
	function fn_selectDate(){
		$('#selectDate_btn').click(function(){
			if($('#checkIn').val()=='' ){
	             alert('체크인 날짜를 선택해주세요');
	             return false;
	        }else if($('#checkOut').val()=='' ){
	             alert('체크아웃 날짜를 선택해주세요');
	             return false;
	        }
			$('#f').attr('action','reservationRoomPage.do');
			$('#f').submit();
		});
	}
</script>
</head>
<body>


	<div id="box_middle">
	<form id="f">
		<table>
			<tr>
				<td>체크인(ex. 2021-07-05)</td>
				<td>체크아웃(ex. 2021-07-07)</td>
				<td>인원</td>
				<td rowspan="2"><input type="button" value="조회하기" id="selectDate_btn"></td>
			</tr>
			<tr>
				<td id="start_btn"> 
						<input type="text" id="checkIn" name="checkIn"> 
				</td>
				<td id="end_btn">
			 			<input type="text" id="checkOut" name="checkOut">
			 	</td>
				<td><input type="text" value="2" size="1" name="people"> </td>
				
			</tr>
		</table>
	</form>
</div>

 
</body>
</html>
	
<%-- 정적 페이지 포함(파라미터 전달이 불가능하다) --%>
<%@ include file="../layout/footer.jsp" %> 