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
 //빼온 룸들 조회하기
 
 
</script>
</head>
<body>
 	<c:if test="${empty room }">
 		예약가능한 방이 없습니다.
 		<input value="이전으로" id="pre">
 	</c:if>
 	<c:if test="${not empty room}">
 		
 		<c:forEach var=r items="${room}">
 			${r.rno}
 		</c:forEach>
 	</c:if>
 	

</body>
</html>