<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 동적 페이지 포함(파라미터 title을 전달할 수 있다) --%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="홈페이지제목" name="title" />
</jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>예약 리스트</title>
	<script type="text/javascript">
	$(document).ready(function(){
		fn_pre();	// 예약취소 버튼
	});
	
	
	
	function fn_pre(){
		$('#myList_btn').click(function(){
			$('#f').attr('action','myReservation.do');
			$('#f').submit();
		});
	}
</script>
</head>
<body>

	<div>
		<form id="f">
			예약이 취소 되었습니다.
			<input type="hidden" name="mNo" value="${loginUser.getMNo()}" >
			<input type="button" value="회원님의 예약리스트 이동" id="myList_btn">
		</form>
	</div>


</body>
</html>
<%-- 정적 페이지 포함(파라미터 전달이 불가능하다) --%>
<%@ include file="../layout/footer.jsp" %> 