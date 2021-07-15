<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
	
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script type="text/javascript">
    	
    </script>
</head>
<body>

	<h1>룸 가격 페이지</h1>
	
	<form id="f" method="post">
	
		<input type="hidden" name="no" value="${roomDTO.RNo}">
		
		룸 이름<br>
		<input type="text" name="rName" value="${roomDTO.RName}"><br><br>
		
		룸 가격<br>
		<input type="number" name="rPrice" value="${roomDTO.RPrice}"><br><br>
		
		룸 등급<br>
		<input type="number" name="rGrade" value="${roomDTO.RGrade}"><br><br>
		
		룸 이미지<br>
		<img alt="룸 이미지" src="${roomDTO.RImg}"><br><br>
		
		룸 수용인원<br>
		<input type="number" name="rAccept" value="${roomDTO.RAccept}"><br><br>
		
		룸 사이즈<br>
		<input type="number" name="rSize" value="${roomDTO.RSize}"><br><br>		
	
	</form>
	
</body>
</html>