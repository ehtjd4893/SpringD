<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		body, div, td, th, p, textarea {
	        margin: 0;
	        padding: 0;
	        font: 12px/160% Dotum,'돋움',sans-serif;
	        color: #101010;
        }
        ul, ol, li, dl, dt, dd {
        	margin: 0;
        	padding: 0;
        }
        ul {
        	list-style-type: disc;
        }
        li {
        	display: list-item;
        	text-align: -webkit-match-parent;
        }
        div {
        	display: block;
        }
        .allWrap {
        	overflow: hidden;
        	border-top: 1px solid #a1886f;
        	border-bottom: 1px solid #a1886f;
        	padding: 20px 0;
        }
        .allWrap h3 {
        	margin-bottom: 20px;
        	height: 11px;
        }
        .allWrap ul li {
        	padding-left: 8px;
        	line-height: 20px;
        	color: #444;
        }
        .allWrap ul.mgb50 {
        	margin-bottom: 50px;
        }
        .left {
        	float: left;
        	border-right: 1px solid #eceae1;
        	padding: 0 0 0 14px;
        	height: 191px;
        	height: 400px;
        }
        .mid {
        	float: left;
        	border-right: 1px solid #eceae1;
        	width: 154px;
        	padding: 0 0 0 20px;
        	height: 400px;
        }
        .right {
        	float: left;
        	padding: 0 0 0 20px;
        	width: 135px;
        	height: 400px;
        }
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>

	<h1>Amenity</h1>
	
	<div class="allWrap">
		<div class="left">
			<h3>Bath Room</h3>
			<ul>
				<li class="first"> 100% 코튼 목욕 가운</li>
				<li>비상벨</li>
				<li>레인 샤워</li>
				<li>핸드 타월</li>
				<li>페이스 타월</li>
				<li>배스 타월</li>
				<li>화장품(몰튼 브라운)</li>
				<li>칫솔 세트</li>
				<li>면도 세트</li>
				<li>머리빗</li>
				<li>코튼 세트(면봉 & 화장솜)</li>
				<li>원격 조정 비데 일체형 변기</li>
				<li>헤어 드라이어</li>
				<li class="last">디지털 체중계</li>
			</ul>
		</div>
		<div class="mid">
			<h3>Bed Room</h3>
			<ul class="mgb50">
				<li class="first">스마트 TV</li>
				<li>Technology Kit(HDMI, USB, LAN)</li>
				<li>개별 냉.난방 조절기</li>
				<li>자동 블라인드</li>
				<li>전화기</li>
				<li>시몬스 프리미엄 침대(Beauty Rest)</li>
				<li>거위털 이불 & 베개</li>
				<li>턴다운 서비스</li>
				<li>기능성 베개</li>
				<li class="last">잡지</li>
			</ul>
		</div>
		<div class="right">
			<h3>Private Bar</h3>
			<ul class="mgb50">
				<li class="first">냉장고</li>
				<li>얼음 서비스</li>
				<li>전기 주전자</li>
				<li>와인잔, 위스키잔</li>
				<li>물컵, 찻잔</li>
				<li>무료티, 커피</li>
				<li class="last">무료 생수</li>
			</ul>
			<h3>Closet</h3>
			<ul>
				<li class="first">개인 금고</li>
				<li>전신 거울</li>
				<li>슬리퍼(남, 여)</li>
				<li>우산</li>
				<li class="last">구두 클리너</li>
			</ul>
		</div>
	</div>	
	
</body>
</html>