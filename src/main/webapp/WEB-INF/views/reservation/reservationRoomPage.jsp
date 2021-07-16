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
		
	});
	
	
 
</script>
</head>
<body>
다음페이지<br><br>
 	<c:if test="${empty room}">
 		예약가능한 방이 없습니다.
 		<input type="button" value="이전으로" id="pre">
 	</c:if>
 	<c:if test="${not empty room}">
 		<c:forEach var="r" items="${room}">
 			 
	 			${r.RNo}
	 			<h1>${r.RName}</h1>
	 			<img alt="" src="">
	 			가격   ${r.RPrice} ￦/
	 			등급  ${r.RGrade} /
	 			최대 인원   [${r.RAccept} ]/
	 			방 크기 ${r.RSize} <br>
 			 	<a href="optionPage.do?rNo=${r.RNo}&checkIn=${checkIn}&checkOut=${checkOut}&people=${people}">예약하기</a>
 			 
 			 
 			<hr>
 		</c:forEach>
 	</c:if>
 	

</body>
</html>