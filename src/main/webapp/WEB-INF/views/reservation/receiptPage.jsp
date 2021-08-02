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
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>결제 완료</title>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_indexPage();	//메인 페이지 이동
		});
		
		function fn_indexPage(){
			$('#indexPage_btn').click(function(){
				location.href="index.do";
			});
		}
	</script>
	<style type="text/css">
		 
		#box_middle{
			margin:  auto 20%;
	    	padding: 5% 10%;
	    	border: 1px solid #c2ad99;
		}
		#f{
			padding: 5% 7%;
		}
		table,tr,td{
		margin:auto;
		 border: 1px solid #c2ad99;
		 text-align: center;
		}
		h2{
			text-align:  center;
		}
	</style>
	
</head>
<body>
	<div id="box_middle">
		<h1>결제완료</h1>
		<p>예약이 완료되었습니다.</p>
		<table>
			<tbody>
				<tr>
					<td>예약번호</td>
					<td>${book.getReNo()}</td>
				</tr>
				<tr>
					<td>예약자명</td>
					<td>${book.getBooker()}</td>
				</tr>
				<tr>
					<td>예약하신 방</td>
					<td>${selectRoom.getRName()}</td>
				</tr>
				<tr>
					<td>인원</td>
					<td>${book.getPeople()}</td>
				</tr>
				<tr>
					<td>체크인</td>
					<td>${book.getCheckIn()}</td>
				</tr>
				<tr>
					<td>체크아웃</td>
					<td>${book.getCheckOut()}</td>
				</tr>
				<tr>
					<td>조식</td>
					<td> ${book.getFood()} 명</td>
				</tr>
				<tr>
					<td>요청사항</td>
					<td> ${book.getNote()} </td>
				</tr>
				<tr>
					<td>총금액</td>
					<td> ${book.getTotalPay()} 원</td>
				</tr>
			</tbody>
		</table>
		
		<h2>감사합니다</h2>
		<button id="indexPage_btn">메인페이지</button>
	</div>
</body>
</html>
<%-- 정적 페이지 포함(파라미터 전달이 불가능하다) --%>
<%@ include file="../layout/footer.jsp" %> 