<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="../layout/header2.jsp">
	<jsp:param value="회원가입" name="title" />
</jsp:include>

	<link rel="stylesheet" href="resources/css/layout.css">
	<link rel="stylesheet" href="resources/css/join.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" referrerpolicy="no-referrer" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript" src="resources/js/join.js"></script>
	<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script> <!-- 카카오 API -->

	<!-- 회원가입 화면  -->
	<div class="join_form">
		<form id="f" method="post">
			<span class="naming">이름</span><br>
			<input type="text" name="mName" id="mName" placeholder="ex) 홍길동 or hong"><br>
			<span class="name_result"></span><br><br>
			
			<span class="naming">아이디</span><br>
			<input type="text" name="mId" id="mId" placeholder="ex) hong123"><br>
			<span class="id_result"></span><br><br>
			
			<span class="naming">비밀번호</span><br>
			<input type="password" name="mPw" id="mPw"><br>
			<span class="pw_result"></span><br><br>
			
			<span class="naming">비밀번호 확인</span><br>
			<input type="password" name="mPw2" id="mPw2"><br>
			<span class="pw2_result"></span><br><br>
	
			<span class="naming">이메일</span><br>
			<input type="text" name="mEmail" id="mEmail" placeholder="ex) hong123@example.com"><br>
			<span class="email_result"></span><br><br>
			<input type="button" id="emailCode_btn" value="인증코드 받기"><br>
			<input type="text" name="userKey" id="userKey" style="width:180px;">
			<input type="button" id="emailAuth_btn" value="인증하기" style="width:108px; height:45px;"><br>
			<span class="emailAuth_result"></span><br><br><br>
			
			<span class="naming phone">전화번호</span><br>
			<input type="text" name="mPhone" id="mPhone" placeholder="-(하이픈)없이 입력"><br>
			<span class="phone_result"></span><br><br>
			
			<input type="button" id="join_btn" value="가입하기" ><br>
			<input type="button" value="돌아가기" onclick="location.href='index.do'">
		</form>
	</div>
	
<%@ include file="../layout/footer.jsp" %> 
