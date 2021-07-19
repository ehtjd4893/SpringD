<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>결제 완료</title>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_indexPage();
		});
		
		function fn_indexPage(){
			$('#indexPage_btn').click(function(){
				location.href="index.do";
			});
		}
	</script>
	<style type="text/css">
		table,tr,td{
			border: 1px solid pink;
		}
	</style>
</head>
<body>
	
	<h1>결제완료</h1>
	<p>예약이 완료되었습니다.</p>
	<table>
		<tbody>
			<tr>
				<td>예약번호</td>
				<td>${reno}</td>
			</tr>
			<tr>
				<td>예약자명</td>
				<td>${reservationDTO.getBooker()}</td>
			</tr>
			<tr>
				<td>예약하신 방</td>
				<td>${selectRoom.getRName()}</td>
			</tr>
			<tr>
				<td>인원</td>
				<td>${reservationDTO.getPeople()}</td>
			</tr>
			<tr>
				<td>체크인</td>
				<td>${reservationDTO.getCheckIn()}</td>
			</tr>
			<tr>
				<td>체크아웃</td>
				<td>${reservationDTO.getCheckOut()}</td>
			</tr>
			<tr>
				<td>조식</td>
				<td> ${reservationDTO.getFood()} 명</td>
			</tr>
			<tr>
				<td>총금액</td>
				<td> ${reservationDTO.getTotalPay()}</td>
			</tr>
		</tbody>
	</table>
	
	<h2>감사합니다</h2>
	<button id="indexPage_btn">메인페이지</button>
</body>
</html>