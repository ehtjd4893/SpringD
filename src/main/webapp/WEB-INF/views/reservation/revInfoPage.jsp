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
	<style type="text/css">
		table,tr,td{
		 border: 1px solid pink;
		 text-align: center;
		}
	</style>
</head>
<body>

	<h1>예약정보</h1>
	
	<form id="f">
		<table>
			<thead>
				<tr>
					<!-- 체크시 ${loginUser}의 이름/이메일/휴대폰  뿌려줌 -->
					<td colspan="2"> <label><input type="checkbox" id="sameUser_box"> 회원정보와 동일합니다 </label> </td> 
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" id="name"> </td>
				</tr>
				<tr>
					<td>이메일</td>
					<!-- 이메일 인증할 계정 + 이메일 정규식 적용 -->
					<td> <input type="text" name="email" id="email"> <input type="button" value="인증번호 전송">  </td>
				</tr>
				<tr>
					<td>이메일 인증코드</td>
					<!-- 이메일 인증하기 -->
					<td> <input type="text" id="email_code"> <input type="button" value="인증확인">  </td>
				</tr>
				<tr>
					<td>휴대폰 </td>
					<td><input type="text" name="tel" id="tel"> </td>
				</tr>
				<tr>
					<td>요청사항</td>
					<td><textarea rows="" cols=""></textarea> </td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2"> <input type="button" value="예약하기"> </td>
				</tr>
			</tfoot>
		</table>
	</form>

</body>
</html>