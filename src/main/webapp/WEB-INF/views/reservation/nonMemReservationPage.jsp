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
	
	function fn_next(){
		$('#code_check').click(function(){
			$('#code_f').attr('action','nonMemReservationPage.do');
			$('#code_f').submit();
			alert('a');
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

	<!-- 비회원 예약 내역 -->
       <div>
	       <h1>예약내역</h1>
	       
       </div>
</body>
</html>