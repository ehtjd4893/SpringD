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
	
	
	</script>
	<style type="text/css">
		#food{
			width: 20px;
			text-align: center;
		}
	</style>
<title>Insert title here</title>
</head>
<body>
 	<h1>옵션</h1>
 	
 	<form id="f">
	 	조식<br> 
	 	<input type="text" id="food" name="food" value="0"> 명
 	</form>
 	
 	
 	<br><br>
 	<h3>총 가격</h3>
 	
 	${selectRoom.rName}    ${selectRoom.rPrice}￦ <br>
	조식 						0명 * 50000원<br>

------------------------------------<br>
	<h1>총 0000원</h1> 	
 	
</body>
</html>