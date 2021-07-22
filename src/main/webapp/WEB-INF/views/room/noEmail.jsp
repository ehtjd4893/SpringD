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
		body {
			font-family: 'Noto Sans Korean','Malgun Gothic', dotum, sans-serif;
			font-weight: 200;
		}
		h1 {
			display: block;
			margin: 0;
			border: 0;
			margin-block-start: 0.67em;
		    margin-block-end: 0.67em;
		    margin-inline-start: 0px;
		    margin-inline-end: 0px;
		    font-weight: bold;
		}
		h3 {
			display: block;
			margin-block-start: 1em;
		    margin-block-end: 1em;
		    margin-inline-start: 0px;
		    margin-inline-end: 0px;
		    font-weight: bold;
		}
		h4 {
			display: block;
			margin-block-start: 1.33em;
		    margin-block-end: 1.33em;
		    margin-inline-start: 0px;
		    margin-inline-end: 0px;
		    font-weight: bold;
		}
		p {
			display: block;
			margin: 0;
			word-break: break-all;
			margin-block-start: 1em;
		    margin-block-end: 1em;
		    margin-inline-start: 0px;
		    margin-inline-end: 0px;
		}
		a {
			color: #333;
			text-decoration: none;
			font-family: 'Noto Sans Korean','Malgun Gothic', dotum, sans-serif;
		}
		a:-webkit-any-link {
		    cursor: pointer;
		}
		:after, :before {
			box-sizing: border-box;
		}
		.noEmail_area {
			display: block;
			box-sizing: border-box;
			width: 100%;
			position: relative;
			max-width: 600px;
			text-align: left;
			cursor: auto;
			white-space: normal;
		}
		.noEmail_area header {
			display: block;
			position: absolute;
			left: 0px;
			right: 0px;
			top: 0px;
			height: 40px;
			background: #242424;
			color: #fff;
		}
		.noEmail_area header h1{
			font-size: 16px;
			padding: 0 10px;
			height: 40px;
			line-height: 40px;
		}
		.noEmail_area section {
			display: block;
			padding: 50px 10px 30px 10px;
			overflow: auto;
		}
		.noEmail {
			border: 0px;
			width: 100%;
			max-width: 400px;
			background: #fff;
			text-align: center;
		}
		.noEmail h3 {
			font-size: 18px;
			padding: 20px;
			color: #000;
			text-align: center;
		}
		.noEmail h4 {
			padding: 20px 0;
			font-size: 11px;
			color: #666;
			text-align: center;
		}
		.noEmail_area section p {
			padding: 20px;
			white-space: pre-line;
			font-size: 12px;
			color: #666;
		}
		.noEmail p {
			text-align: left;
		}
		.noEmail_area footer {
			display: block;
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

	<div class="noEmail_area">
		<header>
			<h1>이메일주소 무단수집거부</h1>
		</header>
		<section class="noEmail">
			<h3>무야호텔</h3>
			<h4>www.mooyahotel.com</h4>
			<p>
				본 사이트에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집 되는 것을 거부합니다. 이를 위반시 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」에 의해 형사처벌됨을 유념하시기 바랍니다.
				<br>
				<br>
				<a href="http://www.law.go.kr/%EB%B2%95%EB%A0%B9/%EC%A0%95%EB%B3%B4%ED%86%B5%EC%8B%A0%EB%A7%9D%EC%9D%B4%EC%9A%A9%EC%B4%89%EC%A7%84%EB%B0%8F%EC%A0%95%EB%B3%B4%EB%B3%B4%ED%98%B8%EB%93%B1%EC%97%90%EA%B4%80%ED%95%9C%EB%B2%95%EB%A5%A0/(20120818,11322,20120217)/%EC%A0%9C50%EC%A1%B0%EC%9D%982">
					<i class="fas fa-hashtag"></i> 정보통신망법 제50조의2(전자우편주소의 무단 수집행위 등 금지)
				</a>
			</p>
		</section>
		<footer>© www.mooyahotel.com</footer>
	</div>
	
</body>
</html>