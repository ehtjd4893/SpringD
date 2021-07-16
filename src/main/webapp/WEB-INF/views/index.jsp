<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Homepage</title>

<body>
	<h1> TEST </h1>
 
	<c:if test="${loginUser eq null}">
		<a href="loginPage.do">로그인</a>
	</c:if>


	<a href="boardPage.do">게시판</a>	 	
	
	<a href="roomPage.do">방 페이지 이동</a>
	
	<a href="joinPage.do">회원가입</a>
	
	<a href="reservationSelectDatePage.do">예약하기</a>	
	
</body>
</html>