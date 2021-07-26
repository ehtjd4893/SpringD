<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="resources/css/loginWindow.css"> 
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" referrerpolicy="no-referrer" />
	<title>DS - Homepage</title>	
	<style>
		.reply_box{
			border-top: 1px solid black;
			border-bottom: 1px solid black;
			width: 700px;
			font-size: 13px;
			background-color: #f0efed;
		}
		.writer_box{
			font: bold;
			font-weight: 900;
			font-size: 16px;
		}
		.content_box{
			color: blue;
		}
		.date_box{
			font-size: 12px;
			color: #999999;
		}
		.hide{
			display:none;
		}

		.re_re_box{
			padding: 0;
			height: 45px;
			width: 750px;
			justify-content: space-between;
		}
		.re_re_content{
			border: 1px solid black;
			margin: 0 15px;
			height: 30px;
			width: 600px;
		}
		.re_writer_box{
			background-color: black;
			color: white;
			border-radius: 5px;
		}
		.child_writer_box{
			margin-left: 30px;
			font-weight: 900;
			font-size: 16px;
		}
		.child_content_box, .child_date_box{
			margin-left: 60px;
		}
		.child{
			margin: 5px 0 5px 30px;
			padding: 3px 3px 3px 0;
			border: 1px solid black;
			border-radius: 5px;
			background-color: #f0efed;
		}
		.disable {
			color: silver;
		}
		.link {
			cursor: pointer;
		}
		.now_page {
			color: limegreen;
		}
		.re_reply_paging{
			display: flex;
		}
	</style>
	<script>
		$(function(){
			fn_delete();	// 삭제 버튼 클릭시
			fn_update();	// 수정 버튼 클릭시
			fn_reply_no_login();	// 로그인 없이 댓글 달기 시도할 때
			fn_reply_btn();	// 로그인 후 댓글 달기 클릭시
			fn_showLogin();	// 로그인 버튼 클릭시 로그인창이 펴지는 함수
			getDate();		// 시간 보여주는 함수
			fn_closeLogin();	// 로그인창에서 x 클릭시 로그인창 닫힘
			fn_toggle_mode(); 	// 관리자 로그인 모드 / 회원 로그인 모드로 변경하는 버튼
			fn_getReplyList();	// 댓글 출력 함수
		});	// onload

		// 댓글 불러오기 함수
		 function fn_getReplyList(){
				$.ajax({
					url: 'getReplyList.do',
					type: 'get',
					async: false,
					data: 'bIdx=${Board.BIdx}&page=${page}',
					dataType: 'json',
					success: function(resultMap){
						fn_makeReply(resultMap.list);		
						$('#reply_paging').empty();
						$('#reply_paging').html(resultMap.paging);
					},	// end of success
					error: function(){
						alert('목록 불러오기 오류');
					}
				})	// ajax
		} 
		
		
			// 2. 회원 목록 페이징(페이징 링크 처리)
			function fn_paging() {
				$('.re_reply_paging').on('click', '.previous_block', function(){
					re_page = $(this).attr('data-page');
				});
				$('.re_reply_paging').on('click', '.go_page', function(){
					re_page = $(this).attr('data-page');
				});
				$('.re_reply_paging').on('click', '.next_block', function(){
					re_page = $(this).attr('data-page');
					fn_child_reply();
				});
			}
		
		var re_page = 1;
		// 답글 버튼 클릭시 펼치기
		function fn_child_reply(box ,parent){
			
			// 숨겨놨던 대댓글 부분 보이게 해주기.
			$(box).parent().children('.re_reply').toggleClass('hide');
			
			var paging = null;
			
			$.ajax({
				url: 'getChildList.do',
				type: 'post',
				async: false,
				data: 're_page=' + re_page + '&parent=' + parent + '&bIdx=${Board.BIdx}',
				dataType: 'json',
				success: function(resultMap){
					fn_makeReReply(box, resultMap.list, parent);
					
					var paging = resultMap.paging;
					// 대댓글 페이징 만들기
					
					var paging_box = $(box).parent().children('.re_reply').children('.re_reply_paging');
					

					paging_box.empty();

					if(paging.beginPage <= paging.pagePerBlock){
						$('<div>')
						.addClass('disable')
						.text('◀')
						.appendTo(paging_box);
					} else {  // 이전('◀')이 있음
						// class
						// 1. previous_block : click 이벤트에서 활용
						// 2. link : cursor pointer
						$('<div>')
						.addClass('previous_block').addClass('link')
						.attr('data-page', paging.beginPage - 1)
						.attr('onclick', function(){
							re_page = $(this).attr('data-page');
						})
						.text('▶')
						.appendTo(paging_box);
					
					}
					
					for(let p = paging.beginPage; p <= paging.endPage; p++){
						if(p == paging.page) {
							$('<div>')
							.addClass('now_page')
							.text(p)
							.appendTo(paging_box);
						} else {
							// class
							// 1. go_page : click 이벤트에서 활용
							// 2. link : cursor pointer
							$('<div>')
							.addClass('go_page').addClass('link')
							.attr('data-page', p)
							.text(p)
							.appendTo(paging_box);
						}
					}
					// 4) 다음('▶')
					if (paging.endPage == paging.totalPage) {  // 다음('▶')이 없음(마지막 블록)
						// class
						// 1. disable : color silver
						$('<div>')
						.addClass('disable')
						.text('▶')
						.appendTo(paging_box);
					} else {  // 다음('▶')이 있음
						// class
						// 1. next_block : click 이벤트에서 활용
						// 2. link : cursor pointer
						$('<div>')
						.addClass('next_block').addClass('link')
						.attr('data-page', paging.endPage + 1)
						.attr('onclick', function(){
							re_page = $(this).attr('data-page');
						})
						.text('▶')
						.appendTo(paging_box);
					}
					
					
				},	// success
				error: function(){
					alert('답글 펼치기 오류');
				}	// error
			})
		
			
			
			

		}
		
		
		// 대댓글 출력함수
		function fn_makeReReply(box, list, parent){
			// 원래 있던 대댓글 지우고 다시 출력(중복해서 쌓이는것을 방지)
			$(box).parent().children('.re_reply').children('#child' + parent).remove();
			
			$.each(list, function(i, reply){
				
				$('<div class="child" id="child' + parent + '">')
				.append( $('<div class="child_writer_box">').append( $('<i class="fab fa-replyd fa-2x"></i>') ).append( $('<span style="margin-left:10px">').text(reply.mid) )  )
				.append( $('<div class="child_content_box">').append( $('<span>').text(reply.rcontent) )  )
				.append( $('<div class="child_date_box">').append( $('<span>').text(reply.rpostDate) )  )
				.appendTo( $(box).parent().children('.re_reply') );
			});	// each 
		}
		
		// 대댓글 삽입 함수
		function fn_insert_re_re(parent){
			var content = $('#re_re' + parent).val();
			
			if(${loginUser == null && loginAdmin == null}){
				$('.form').toggleClass('hide');	
				$('#mId').focus();
				return;
			}
			
			if(content == null || content == ""){
				alert('댓글 내용을 입력하세요.')
				return;
			}
			
			if(confirm('대댓글을 등록하시겠습니까?')){		
				$.ajax({
					url: 'insertReReply.do',
					type: 'get',
					data: 'bIdx=${Board.BIdx}' + '&mId=${loginUser.MId}' + '&parent=' + parent + '&content=' + content,
					async: false,
					success: function(){
						$('#reply_list').empty();
						fn_getReplyList();
					},
					error: function(){
						
					}
				})
			}
		}	// fn_insert_re_re(parent)
		
		// 댓글 불러오기 함수
		function fn_makeReply(list, paging){

			$.each(list, function(i, reply){
				
				$('<div class="reply_box">')
				.append( $('<div class="writer_box">').append( $('<span>').text(reply.mid) )  )
				.append( $('<div class="content_box">').append( $('<span>').text(reply.rcontent) )  )
				.append( $('<div class="date_box">').append( $('<span>').text(reply.rpostDate) )  )
				.append( $('<input type="button" value="답글" onclick="fn_child_reply(this,' + reply.ridx + ')">'))
				.append( $('<div class="hide re_reply" id=re_reply' + reply.ridx + '>')
						.append( $('<div class="re_re_box">')
								.append( $('<i class="fab fa-replyd fa-2x"></i>') )	
								.append( $('<input type="text" class="re_re_content" id="re_re' + reply.ridx + '">') )		
								.append( $('<input type="button" value="작성" onclick="fn_insert_re_re(' + reply.ridx +')">') )
						)
						.append( $('<div class="re_reply_paging">') )
				)
				.appendTo( $('#reply_list') );
			});	// each 
		}
		
		// 댓글 달기 버튼 클릭시
		function fn_reply_btn(){
			$('#reply_btn').click(function(){
				if(confirm('댓글을 등록하시겠습니까?')){
					$('#f_reply').attr('action', 'insertReply.do');
					$('#f_reply').submit();
				}
			});	// onclick
			
		}
		
		// 로그인 없이 댓글 달려고 할 때,
		function fn_reply_no_login(){
			$('#reply_no_login').focus(function(){
				$('.form').toggleClass('hide');		
			});	// onfocus
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
		
		// 댓글 달기, 데이터베이스에 삽입
		function fn_reply(){
			$('#reply_btn').click(function(){
				$.ajax({
					url: 'writeReply.do',
					data: $('#f').serialize(), 
					type: 'get',
					dataType: 'json',
					success: function(resultMap){
						alert('댓글 달기 성공');
					},
					error: function(){
						alert('댓글 오류 발생');
					}
				});	// ajax
			});	// onclick
		}	// fn_reply
		
		// 멤버 로그인, 관리자 로그인을 변경해주는 함수
		function fn_toggle_mode(){
			$('#mem_to_admin').click(function(){
				$('#mem_mode').toggleClass('disabled');
				$('#admin_mode').toggleClass('disabled');
			});
			
			$('#admin_to_mem ').click(function(){
				$('#mem_mode').toggleClass('disabled');
				$('#admin_mode').toggleClass('disabled');
			});
		}
		
		function fn_closeLogin(){	// 로그인창에서 x 클릭시 로그인창 닫힘
			$('#closeLogin').click(function(){
				$('.form').toggleClass('hide');
			})	// onclick
		}	// fn_closeLogin
		
		function fn_showLogin(){
			$('.showLogin').on('click',function(){
				$('.form').toggleClass('hide');
			});	// onclick
		}	// fn_login_btn
		

	    function getDate() { 
	        date = setInterval(function () { 
	            var dateString = ""; 

	            var newDate = new Date(); 

	            dateString += ("0" + newDate.getHours()).slice(-2) + ":"; 
	            dateString += ("0" + newDate.getMinutes()).slice(-2) ; 
	            //document.write(dateString); 문서에 바로 그릴 수 있다. 
	            $("#date").text(dateString); 
	        }, 1000);	// 1초 단위로  
	    } 
		
	</script>
</head>
<body>
	
		<div class="btn_box">
			<span>Seoul</span>
			<span id="date"></span>
			<c:if test="${loginUser eq null && loginAdmin eq null}">
	 			<input type="button" class="showLogin" value="로그인">
	 		</c:if>
	 		<c:if test="${loginUser ne null || loginAdmin ne null}">
	 			<input type="button" value="로그아웃" onclick="location.href='logout.do'">
			</c:if>
		</div>
		<div id="mem_mode" class="myMenu">
			<form action="login.do" method="post">
  	   	 	<div class="form hide">
  	   	 		<input type="hidden" name="page" value="selectBoard.do">
  	   	 		<input type="hidden" name="bIdx" value="${Board.BIdx}">
  	   	 		<h2 style="text-align:center">회원 로그인</h2>
				<a id="closeLogin"><i class="fas fa-times fa-3x"></i></a>
   				 <div class="form2">
     				<div class="form3">
     					<label for="id">아이디</label><input type="text" name="mId" id="mId">
      					<div class="clear"></div>
      					<label for="password">비밀번호</label><input type="password" name="mPw" id="mPw">
     				</div>	<!-- form3 -->
     				<input type="submit" id="login_btn" value="로그인">
     				<div class="clear"></div>
     				<div class="form4">
      					<div class="clear"></div>
     						<label><input type="button" value="회원가입"></label>
     						<label><input type="button" value="아이디/비밀번호 찾기"></label>
     						<label><input type="button" id="mem_to_admin" value="관리자로 로그인하기"></label>
					</div>	<!-- form4 -->
				</div>	<!-- form2 -->
			</div>	<!-- form -->
			</form>
		</div>	<!-- myMenu -->
		
		<div id="admin_mode" class="myMenu disabled">
			<form action="loginAdmin.do" method="post">
  	   	 	<div class="form hide">
  	   	 		<input type="hidden" name="page" value="selectBoard.do">
  	   	 		<input type="hidden" name="bIdx" value="${Board.BIdx}">
  	   	 		<h2 style="text-align:center">관리자 로그인</h2>
				<a id="closeLogin"><i class="fas fa-times fa-3x"></i></a>
   				 <div class="form2">
     				<div class="form3">
     					<label for="id">아이디</label><input type="text" name="mId" id="mId">
      					<div class="clear"></div>
      					<label for="password">비밀번호</label><input type="password" name="mPw" id="mPw">
     				</div>	<!-- form3 -->
     				<input type="submit" id="login_btn" value="로그인">
     				<div class="clear"></div>
     				<div class="form4">
      					<div class="clear"></div>
     						<label><input type="button" id="admin_to_mem" value="회원으로 로그인하기"></label>
					</div>	<!-- form4 -->
				</div>	<!-- form2 -->
			</div>	<!-- form -->
			</form>
		</div>	<!-- myMenu -->
	
	
	
	<form id="f" method="post" enctype="multipart/form-data">
		<input type="hidden" name="page" value="${page}">
		<input type="hidden" name="bIdx" value="${Board.BIdx}">
		작성자 <input type="text" name="mId" value="${Board.MId}" disabled><br><br>
		<input type="hidden" name="bHit" value="${Board.BHit}" disabled><br><br>
		
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
		
		<input type="button" value="목록으로 돌아가기" onclick='location.href="boardPage.do"'><br><br>
		</form>
		
		<c:if test="${loginUser eq null && loginAdmin eq null}">
			<textarea rows="2" cols="30" id="reply_no_login" name="reply" placeholder="댓글을 입력하시려면 로그인하세요."></textarea>
		</c:if>
		
	<form id="f_reply" method="post"> 
		<input type="hidden" name="bIdx" value="${Board.BIdx}">
		<input type="hidden" name="mode" value="${mode}">

		
		
		<c:if test="${mode eq 'member'}">
			<c:if test="${loginUser ne null}">
				<input type="hidden" name="mId" value="${loginUser.MId}">
				<textarea rows="2" cols="30" id="reply" name="reply" placeholder="댓글을 입력하세요"></textarea>
				<input type="hidden" name="parent" value="0">
				<input type="button" id="reply_btn" value="댓글 달기">
			</c:if>
		</c:if>
		
		<c:if test="${mode ne 'admin'}">
			<c:if test="${loginAdmin ne null}">
				<input type="hidden" name="mId" value="${loginAdmin.MId}">
				<textarea rows="2" cols="30" id="reply" name="reply" placeholder="댓글을 입력하세요"></textarea>
				<input type="hidden" name="parent" value="0">
				<input type="button" id="reply_btn" value="댓글 달기">
			</c:if>
		</c:if>
		<div id="reply_list">
		</div>
		<div id="reply_paging"></div>
	</form>
</body>
</html>