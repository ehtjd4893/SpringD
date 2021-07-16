<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>DS - Homepage</title>
	<script>
		$(function(){
			fn_delete();
		});	// onload
		
		// 삭제 버튼 클릭시 작동 함수
		function fn_delete(){
			$('#delete_btn').click(function(){
				if(confirm('정말 게시물을 삭제하시겠습니까?'))
					$('#f').submit();
			});	// onclick
		}	// fn_delete
		
		function fn_reply(){
			$('#reply_btn').click(function(){
				$.ajax({
					url: 'writeReply.do',
					data: $('#f').serialize(), 
					type: 'get',
					dataType: 'json',
					success: function(resultMap){
						alert(resultMap.message);
					},
					error: function(){
						alert('댓글 오류 발생');
					}
				});	// ajax
			});	// onclick
		}	// fn_reply
	</script>
</head>
<body>

	<form id="f" action="deleteBoard.do" method="post" enctype="multipart/form-data">
		글번호 <input type="text" value="${Board.BIdx}" disabled>
		작성자 <input type="text" name="writer" value="${Board.MId}" disabled><br><br>
		조회수 <input type="text" name="hit" value="${Board.BHit}" disabled><br><br>
		
		제목 <input type="text" name="title" value="${Board.BTitle}" disabled>
		작성일 <input type="text" name="postdate" value="${Board.BPostDate}" disabled>
		<br><br>
		내용<br>
		<textarea  cols="50" rows="10" disabled>${Board.BContent}</textarea><br><br>
		<c:if test="${Board.BFileName1 ne 'null'}">
			첨부 이미지<br>
			<img name="image" alt="${Board.BFileName1}" src="resources/archive/board/${Board.BFileName1}" style="width: 300px">
			<input type="hidden" name="filename1" value="${Board.BFileName1}">
		</c:if>
		<c:if test="${Board.BFileName2 ne 'null'}">
			첨부 이미지<br>
			<img name="image" alt="${Board.BFileName2}" src="resources/archive/board/${Board.BFileName2}" style="width: 300px">
			<input type="hidden" name="filename2" value="${Board.BFileName2}">
		</c:if>
		<c:if test="${Board.BFileName3 ne 'null'}">
			첨부 이미지<br>
			<img name="image" alt="${Board.BFileName3}" src="resources/archive/board/${Board.BFileName3}" style="width: 300px">
			<input type="hidden" name="filename3" value="${Board.BFileName3}">
		</c:if>
		<br><br>
		
		<c:if test="${mode eq 'member'}">
			<c:if test="${loginUser.MId == Board.MId}">
				<input id="update_btn" type="button" value="수정하기" onclick='location.href="updateBoardPage.do?bIdx=${Board.BIdx}"'>
				<input id="delete_btn" type="button" value="삭제하기" >
			</c:if>
		</c:if>
		<c:if test="${mode eq 'admin'}">
			<c:if test="${loginAdmin.MId == Board.MId}">
				<input id="update_btn" type="button" value="수정하기" onclick='location.href="updateBoardPage.do?bIdx=${Board.BIdx}"'>
				<input id="delete_btn" type="button" value="삭제하기" >
			</c:if>
		</c:if>
		<input type="button" value="목록으로 돌아가기" onclick='history.back()'>
		
		<input type="hidden" name="bIdx" value="${Board.BIdx}">
		<input type="hidden" name="content" value="${Board.BContent}">
		<input type="hidden" name="replyWriter" value="${loginUser.MId}">
		<c:if test="${mode eq 'member'}">
			<c:if test="${loginUser ne null}">
				<textarea rows="2" cols="30" id="reply" name="reply" placeholder="댓글을 입력하세요"></textarea>
				<input type="button" id="reply_btn" value="댓글 달기">
			</c:if>
		</c:if>
		<c:if test="${mode ne 'admin'}">
			<c:if test="${loginAdmin ne null}">
				<textarea rows="2" cols="30" id="reply" name="reply" placeholder="댓글을 입력하세요"></textarea>
				<input type="button" id="reply_btn" value="댓글 달기">
			</c:if>
		</c:if>
	</form>
</body>
</html>