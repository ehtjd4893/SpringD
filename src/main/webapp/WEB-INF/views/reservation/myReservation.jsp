<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>예약 리스트</title>
	
	
</head>
<body>
 	<c:if test="${empty myReservationList}">
 		예약하신 기록이 없습니다.
 		<input type="button" value="이전으로" id="pre">
 	</c:if>
 	<c:if test="${not empty myReservationList}">
 		<c:forEach var="my" items="${myReservationList}">
 			 
	 			<h1>예약 번호 ${my.getReNo()}</h1>
	 			${my.getRNo()}(방번호)
	 			<img alt="" src="">
	 			회원번호  ${my.getMNo()} ￦/
	 			예약자  ${my.getBooker()} /
	 			인원 ${my.getPeople()} /
	 			체크인   [${my.getCheckIn()} ]/
	 			체크아웃 ${my.getCheckOut()}
	 			조식 ${my.getFood()} /
	 			요청사항  ${my.getNote()} /
	 			총가격 ${my.getTotalPay()} /<br>
 			 	<a href="">예약 취소</a>
 			 
 			 
 			<hr>
 		</c:forEach>
 	</c:if>

</body>
</html>