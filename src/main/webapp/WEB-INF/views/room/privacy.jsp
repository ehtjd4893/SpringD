<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" referrerpolicy="no-referrer" />
	<style>
		h1, h2, h3, h4, h5, h6 {
			font-family: 'Noto Sans Korean','Malgun Gothic', dotum, sans-serif;
		}
		h1 {
		    display: block;
		    font-size: 2em;
		    margin-block-start: 0.67em;
		    margin-block-end: 0.67em;
		    margin-inline-start: 0px;
		    margin-inline-end: 0px;
		    font-weight: bold;
		}
		p {
			margin: 0;
			word-break: break-all;
			display: block;
			margin-block-start: 1em;
		    margin-block-end: 1em;
		    margin-inline-start: 0px;
		    margin-inline-end: 0px;
		}
		:after, :before {
			box-sizing: border-box;
		}
		body {
			font-family: 'Noto Sans Korean','Malgun Gothic', dotum, sans-serif;
			font-weight: 200;
		}
		.privacy_area {
			display: block;
			box-sizing: border-box;
			width: 100%;
			position: relative;
			max-width: 600px;
			text-align: left;
			cursor: auto;
			white-space: normal;
		}
		.privacy_area header {
			position: absolute;
			left: 0px;
			right: 0px;
			top: 0px;
			height: 40px;
			background: #242424;
			color: #fff;
			display: block;
		}
		.privacy_area header h1 {
			font-size: 16px;
			padding: 0 10px;
			height: 40px;
			line-height: 40px;
		}
		.privacy_area section {
			padding: 50px 10px 30px 10px;
			overflow: auto;
			display: block;
		}
		.privacy_area section p {
			padding: 20px;
			white-space: pre-line;
			font-size: 12px;
			color: #666;
		}
		.privacy_area footer {
			position: absolute;
			left: 0px;
			right: 0px;
			bottom: 0px;
			height: 30px;
			line-height: 30px;
			background: #ddd;
			color: #999;
			font-family: verdana;
			font-size: 11px;
			text-align: center;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>

	<div class="privacy_area">
		<header>
			<h1>개인정보처리방침</h1>
		</header>
		<section>
			<p>
			가. 개인정보의 수집 및 이용 목적 
			
			① 무야호텔은 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의
			목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제 18조에 
			따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
			1. 무야호텔 서비스 제공을 위한 회원관리
			1) 공간정보 다운로드, 오픈API 신청 및 활용 등 포털 서비스 제공과 서비스 부정이용 방지를 목적으로 
			개인정보를 처리합니다.
			
			나. 수집하는 개인정보의 항목
			
			① 무야호텔 회원정보(필수):이름, 이메일(아이디), 비밀번호, 연락처
			
			다. 개인정보의 보유 및 이용기간
			
			① 무야호텔은 법령에 따른 개인정보 보유ㆍ이용기간 또는 정보주체로부터 개인정보를 수집 시에
			동의 받은 개인정보 보유ㆍ이용기간 내에서 개인정보를 처리ㆍ보유합니다.
			1. 무야호텔 회원정보
			- 수집근거: 정보주체의 동의
			- 보존기간: 회원 탈퇴 요청 전까지(1년 경과 시 재동의)
			- 보존근거: 정보주체의 동의
			
			라. 동의 거부 권리 및 동의 거부에 따른 불이익
			
			위 개인정보의 수집 및 이용에 대한 동의를 거부할 수 있으나, 동의를 거부할 경우 회원 가입이 제한됩니다.
			</p>
		</section>
		<footer>
			© www.mooyahotel.com
		</footer>
	</div>
	
</body>
</html>