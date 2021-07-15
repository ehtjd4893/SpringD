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
		fn_cal();	// 숙박비 + 조식 비용 계산 함수
		fn_de();	// 초기화 함수
		fn_next();	// 
	});
	
	// 초기화 함수
	function fn_de(){
		$('#dining_price').text(0);
		$('#total_sum').text($('#room_price').text());
		$('#people_count').text(0);
	}
	
	
	// 조식 몇명인지 입력받을 때,
	// 숙박비 + 조식 비용 계산해서 출력해주는 함수
	function fn_cal(){
		$('#food').keyup(function(){
			$('#dining_price').val('');
			$('#people_count').val('');
			
			$('#people_count').text($('#food').val());
			var food_sum=$('#food').val()*50000;
			$('#dining_price').text(food_sum);
			var total=($('#food').val()*50000)+Number($('#room_price').text());
				$('#total_sum').text(total);
		});
	}
	
	// 다음 버튼 클릭시 form을 제출해줌
	function fn_next(){
		$('#next_btn').click(function(){
			$('#f').attr('action','revInfoPage.do');
			$('#f').submit();
		});	
	}
	
	</script>
	<style type="text/css">
		#food{
			width: 20px;
			text-align: center;
		}
		table,td,tr{
			border: 1px solid pink;
		}
	</style>
<title>Insert title here</title>
</head>
<body>
 	<h1>옵션</h1>
 	
 	<form id="f">
	 	조식<br> 
	 	<input type="text" id="food" name="food" value="0"> 명
 	
 	<br><br>
 	
 	<table>
 		<thead>
 			<tr>
 				<td colspan="5"><h3>총 가격</h3></td>
 			</tr>
 		</thead>
 		<tbody>
 			<tr>
 				<td>선택</td>
 				<td></td>
 				<td> </td>
 				<td> </td>
 				<td>가격</td>
 			<tr>
 			<tr>
 				<td>${selectRoom.rName}</td>
 				<td></td>
 				<td></td>
 				<td> </td>
 				<td><span id="room_price">${selectRoom.rPrice}</span></td>
 			</tr>
 			<tr>
 				<td>조식 	</td>
 				<td><span id="people_count"> </span> 명 </td>
 				<td> *</td>
 				<td>50000원</td>
 				<td><span id="dining_price"> </span></td>
 			<tr>
 		</tbody>
 		<tfoot>
 			<tr>
 				<td colspan="5"><h1>총  	 <span id="total_sum"> </span> 원</h1> 	 </td>
 			</tr>
 		</tfoot>
 	</table>
 	
 	<input type="button" value="다음" id="next_btn">
 	</form>
				 		 
 	
</body>
</html>