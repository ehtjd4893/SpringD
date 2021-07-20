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
			fn_update();
			fn_reply_no_login();
		});	// onload

		function fn_reply_no_login(){
			$('#reply_no_login').click(){
				
			}
		}
		
		function fn_update(){
			$('#update_btn').click(function(){
				if(confirm('게시물 수정 페이지로 이동하시겠습니까?')){
					$('#f').attr('action', 'updateBoardPage.do');
					$('#f').submit();
				}
			});	// onclick
		}	// fn_update
		
		// 삭제 버튼 클릭시 작동 함수
		function fn_delete(){
			$('#delete_btn').click(function(){
				if(confirm('정말 게시물을 삭제하시겠습니까?')){
					$('#f').attr('action', 'deleteBoard.do');
					$('#f').submit();
				}
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

	<form id="f" method="post" enctype="multipart/form-data">
		글번호 <input type="hidden" name="bIdx" value="${Board.BIdx}" disabled>
		작성자 <input type="text" name="mId" value="${Board.MId}" disabled><br><br>
		조회수 <input type="hidden" name="bHit" value="${Board.BHit}" disabled><br><br>
		
		제목 <input type="text" name="bTitle" value="${Board.BTitle}" disabled>
		작성일 <input type="text" name="bPostdate" value="${Board.BPostDate}" disabled>
		<br><br>
		내용<br>
		<textarea name="bContent" cols="50" rows="10" disabled>${Board.BContent}</textarea><br><br>
		<c:if test="${Board.BFileName1 ne 'null'}">
			첨부 이미지<br>
			<img name="image1" alt="${Board.BFileName1}" src="resources/archive/board/${Board.BFileName1}" style="width: 300px">
			<input type="hidden" name="bFileName1" value="${Board.BFileName1}">
		</c:if>
		<c:if test="${Board.BFileName2 ne 'null'}">
			<br>첨부 이미지<br>
			<img name="image2" alt="${Board.BFileName2}" src="resources/archive/board/${Board.BFileName2}" style="width: 300px">
			<input type="hidden" name="bFileName2" value="${Board.BFileName2}">
		</c:if>
		<c:if test="${Board.BFileName3 ne 'null'}">
			<br>첨부 이미지<br>
			<img name="image3" alt="${Board.BFileName3}" src="resources/archive/board/${Board.BFileName3}" style="width: 300px">
			<input type="hidden" name="bFileName3" value="${Board.BFileName3}">
		</c:if>
		<br><br>
		
		<c:if test="${mode eq 'member'}">
			<c:if test="${loginUser.MId == Board.MId}">
				<input id="update_btn" type="button" value="수정하기">
				<input id="delete_btn" type="button" value="삭제하기" >
			</c:if>
		</c:if>
		
		<c:if test="${mode eq 'admin'}">
			<c:if test="${loginAdmin.MId == Board.MId}">
				<input id="update_btn" type="button" value="수정하기">
				<input id="delete_btn" type="button" value="삭제하기" >
			</c:if>
		</c:if>
		
		<input type="button" value="목록으로 돌아가기" onclick='history.back()'><br><br>
		
		<input type="hidden" name="bIdx" value="${Board.BIdx}">
		<input type="hidden" name="content" value="${Board.BContent}">
		<input type="hidden" name="replyWriter" value="${loginUser.MId}">
		
		<c:if test="${mode eq null}">
			<c:if test="${loginUser eq null && loginAdmin eq null}">
				<textarea rows="2" cols="30" id="reply_no_login" name="reply" placeholder="댓글을 입력하시려면 로그인하세요."></textarea>
			</c:if>
		</c:if>
		
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