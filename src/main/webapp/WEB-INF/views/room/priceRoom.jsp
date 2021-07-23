<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" referrerpolicy="no-referrer" />
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
		li {
			display: list-item;
			text-align: -webkit-match-parent;
		}
		a {
			text-decoration: none;
			color: #555;
		}
		a:-webkit-any-link {
			cursor: pointer;
		}
		.tableRoomInfo tr.first th,
		.tableRoomInfo tr.first td {
			padding: 24px 0 20px 0 !important;
		}
		.tableRoomInfo th,
		.tableRoomInfo td {
			border: none;
			text-align: left;
			line-height: 21px;
		}
		.tableRoomInfo tr {
			border-bottom: #e9e5e0 solid 1px;
		}
		.tableRoomInfo th {
			width: 100px;
			color: #444;
		}
		.tableRoomInfo td {
			width: 500px;
			background: #FFF;
			color: #444;
		}
		.introList li {
			padding-left: 8px;
		    line-height: 21px;
		    color: #444;
		}
		#container {
			margin: 0 auto;
			width: 1000px;
		}
		#large-image {
			width: 1000px;
		}
		#amenity {
			margin: 40px 0 40px 0;
		}
		.introList ul {
			list-style-type: disc;
			display: block;
			margin-block-start: 1em;
		    margin-block-end: 1em;
		    margin-inline-start: 0px;
		    margin-inline-end: 0px;
		    padding-inline-start: 40px;
		}
		.rightArea ul {
			list-style-type: none;
		}
		table {
			display: table;
			box-sizing: border-box;
			text-indent: initial;
			border-spacing: 2px;
		}
		tbody {
			display: table-row-group;
			vertical-align: middle;
			border-color: inherit;
		}
		td {
			display: table-cell;
			vertical-align: inherit;
		}
		p {
		    display: block;
		    margin-block-start: 1em;
		    margin-block-end: 1em;
		    margin-inline-start: 0px;
		    margin-inline-end: 0px;
		}
		.thumbnail {
			width: 100px;
			height: 100px;
		}
		.leftArea {
			float: left;
		}
		.rightArea {
			width: 331px;
			float: right;
		}
		.tableRoomInfo {
			margin: 0;
			border: none;
			border-top: #e9e5e0 solid 1px;
			width: 497px;
			border-collapse: collapse;
			table-layout: fixed;
		}
		.rImg {
			list-style-type: none;
			display: flex;
			justify-content: center;
		}
		.rImg li {
			margin: 5px 10px;
		}
		.btnSet {
			height: 44px;
		}
		.btnSet li {
			float: left;
			margin-right: 6px;
		}
		.btnSet li.last {
			margin-right: 0 !important;
		}
		.HotelInfoBox {
			margin-top: 20px !important;
			width: 100%;
		}
		.HotelBoxTop {
			padding: 25px 15px;
			width: auto;
			background: #faf7ed;
		}
		.conTitle1 {
			height: 12px;
			margin: 0 0 19px 0;
		}
		.introBtm {
			clear: both;
			padding-top: 18px;
		}
		.HotelInfoBox .HotelBoxTop .title {
			font-weight: bold;
			color: #444;
			padding-left: 8px;
		}
		.useIntro p {
			padding-left: 8px;
			color: #444;
		}
		#footer {
			clear: both;
			background: #f1e3c4;
			padding: 50px 15px;
			text-align: center;
			font-weight: 100;
		}
		footer {
			display: block;
		}
		:after, :before {
			box-sizing: border-box;
		}
		#footer > dl {
			width: 100%;
			text-align: center;
			display: block;
		    margin-block-start: 1em;
		    margin-block-end: 1em;
		    margin-inline-start: 0px;
		    margin-inline-end: 0px;
		}
		#footer > dl > dt {
			width: 100%;
			text-align: center;
			display: block;
		}
		#footer > dl > dt
		h3 {
			display: block;
			margin: 0 auto;
			height: 15px;
			width: auto;
			max-width: 100%;
		}
		#footer > dl > dd {
			padding: 15px 0;
			display: block;
			margin-inline-start: 40px;
		}
		#footer > dl > dd span {
			display: inline-block;
			padding: 5px;
			color: #333;
		}
		#footer address {
			font-style: normal;
			color: #666;
			display: block;
		}
		#footer address span {
			display: inline-block;
			padding: 2px 5px;
		}
		#footer p {
			color: #999;
			font-size: 11px;
			font-family: verdana;
			padding-top: 15px;
			margin: 0;
			padding: 0;
			word-break: break-all;
			display: block;
		    margin-block-start: 1em;
		    margin-block-end: 1em;
		    margin-inline-start: 0px;
		    margin-inline-end: 0px;
		}
		#footer b {
			font-weight: bold;
		}
		/* 1900px 이상이면 */
		@media screen and (min-width: 1900px) {
			.header {
				display: block;
				width: 100%;
				margin: 0 auto 0 auto;
				height: 90px;
				position: relative;
				background: #f1e3c4;
			}
			.logo {
				display: block;
				position: absolute;
				left: 50%;
				top: 0px;
				width: 202px;
				margin: 0 0 0 -101px;
				margin-block-start: 0.67em;
			    margin-block-end: 0.67em;
			    margin-inline-start: 0px;
			    margin-inline-end: 0px;
			}
			.logo a {
				display: block;
				height: 90px;
				overflow: hidden;
				text-decoration: none;
				color: #555;
			}
			.logo a:-webkit-any-link {
				cursor: pointer;
			}
			.small_header_right {
				display: none;
			}
			.header_right {
				position: absolute;
				top: 19px;
				right: 260px;
			}
			.header_right > a {
				position: relative;
				float: left;
				color: #856f56;
				margin-right: 15px;
				margin-left: 15px;
				text-decoration: none;
			}
			.header_right > span {
				position: relative;
				float: left;
				color: #856f56;
				margin-right: 5px;
				margin-left: 5px;
				font-weight: bold;
			}
			.header_right > a:-webkit-any-link {
				cursor: pointer;
			}
			.header_right > a:before {
				position: absolute;
				top: 3px;
				right: -15px;
				content: '';
				display: inline-block;
				width: 1px;
				height: 10px;
				background: #d2c4a5;
			}
			.header_left {
				position: absolute;
				top: 19px;
				left: 260px;
			}
			.header_left a {
				position: relative;
				float: left;
				color: #856f56;
				margin-right: 15px;
				margin-left: 15px;
				text-decoration: none;
			}
			.header_left a:-webkit-any-link {
				cursor: pointer;
			}
			.header_left > a:before {
				position: absolute;
				top: 3px;
				left: -15px;
				content: '';
				display: inline-block;
				width: 1px;
				height: 10px;
				background: #d2c4a5;
			}
		}
		/* 1900px 이하이면 */
		@media screen and (max-width: 1900px) {
			.header {
				display: block;
				width: 100%;
				margin: auto;
				height: 90px;
				position: fixed;
				background: #f1e3c4;
				left: 0px;
				top: 0px;
			}
			.logo {
				float: left;
			}
			.logo a {
				display: block;
				height: 90px;
				padding: 20px 0px 0px 15px;
				text-decoration: none;
				color: #555;
			}
			.logo a:-webkit-any-link {
				cursor: pointer;
			}
			.header_right {
				display: none;
			}
			.header_left {
				display: none;
			}
			.small_header_right {
				position: fixed;
				top: 15px;
				right: 15px;
			}
			.small_header_right > a {
				position: relative;
				float: left;
				color: #856f56;
				margin-right: 15px;
				margin-left: 15px;
				text-decoration: none;
			}
			.small_header_right > span {
				font-weight: bold;
			}
			small_header_right > a:-webkit-any-link {
				cursor: pointer;
			}
			small_header_right > a:before {
				position: absolute;
				top: 3px;
				right: -15px;
				content: '';
				display: inline-block;
				width: 1px;
				height: 10px;
				background: #d2c4a5;
			}
		}
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script type="text/javascript">
	    onload = function(){
			var thumbnails = document.getElementsByClassName('thumbnail');
			// var thumbnails = document.querySelectorAll('.thumbnail');
			for (let i = 0; i < thumbnails.length; i++) {
				thumbnails[i].addEventListener('click', function(){
					// data-img 속성 값을 저장하고 있는 이벤트 객체 : this
					// this.getAttribute('data-img')
					// this.dataset.img
					document.getElementById('large-image').setAttribute('src', this.dataset.img);
				});
			}
		    document.getElementById('amenity').onclick = function(){
		    	window.open('amenity.do', '', 'width=640, height=480, resizable=no');
			}
			document.getElementById('satellite channel').onclick = function(){
		    	window.open('satelliteChannel.do', '', 'width=520, height=520, resizable=no');
			}
			document.getElementById('floorPlan').onclick = function(){
		    	window.open('floorPlan.do', '', 'width=640, height=480, resizable=no');
			}
			document.getElementById('inquire').onclick = function(){
		    	location.href= "inquire.do";
			}
			document.getElementById('reservation').onclick = function(){
		    	location.href= "reservation.do";
			}
			document.getElementById('privacy').onclick = function(){
		    	window.open('privacy.do', '', 'width=640, height=480, resizable=no');
			}
			document.getElementById('term').onclick = function(){
		    	window.open('term.do', '', 'width=640, height=480, resizable=no');
			}
			document.getElementById('noEmail').onclick = function(){
		    	window.open('noEmail.do', '', 'width=400, height=352, resizable=no');
			}
			getDate();
		}
	    
	    function getDate() { 
	           date = setInterval(function () { 
	               var dateString = ""; 

	               var newDate = new Date(); 

	               dateString += ("0" + newDate.getHours()).slice(-2) + ":"; 
	               dateString += ("0" + newDate.getMinutes()).slice(-2) ; 
	               //document.write(dateString); 문서에 바로 그릴 수 있다. 
	               $("#date1").text(dateString); 
	               $("#date2").text(dateString); 
	           }, 1000);   // 1초 단위로  
	    }
	    
    </script>
</head>
<body>
	
	<div class="header">
		<h1 class="logo">
			<a href="index.do">MOOYA HOTEL</a>
		</h1>
		<div class="small_header_right">
			<span>Seoul</span>
			<span id="date1"></span>
			<a href="">로그인</a>
			<a href="">회원가입</a>
			<a href="">예약하기</a>
			<a href="">게시판</a>
			<a href="">이벤트</a>
			<a href="">객실</a>
		</div>
		<div class="header_right">
			<span>Seoul</span>
			<span id="date2"></span>
			<a href="">로그인</a>
			<a href="">회원가입</a>
			<a href="">예약하기</a>
		</div>
		<div class="header_left">
			<a href="">게시판</a>
			<a href="">이벤트</a>
			<a href="">객실</a>
		</div>
	</div>
	
	<div id="container">
		
		<br><br>
		
		<h1>룸 가격 페이지</h1>
		
		<form id="f" method="post">
		
			<input type="hidden" name="no" value="${roomDTO.RNo}">
			
			룸 이름<br>
			<input type="text" name="rName" value="${roomDTO.RName}"><br><br>
			
			룸 가격<br>
			<input type="number" name="rPrice" value="${roomDTO.RPrice}"><br><br>
			
			룸 등급<br>
			<input type="number" name="rGrade" value="${roomDTO.RGrade}"><br><br>
			
			룸 수용인원<br>
			<input type="number" name="rAccept" value="${roomDTO.RAccept}"><br><br>
			
			룸 사이즈<br>
			<input type="number" name="rSize" value="${roomDTO.RSize}"><br><br>
			
			룸 이미지<br>
			<div>
				<img src="${roomDTO.RImg}" id="large-image">
			</div>
			<ul class="rImg">
				<li><img src="${roomDTO.RImg}" class="thumbnail" data-img="${roomDTO.RImg}"></li>
				<li><img src="${roomDTO.RImg1}" class="thumbnail" data-img="${roomDTO.RImg1}"></li>
				<li><img src="${roomDTO.RImg2}" class="thumbnail" data-img="${roomDTO.RImg2}"></li>
				<li><img src="${roomDTO.RImg3}" class="thumbnail" data-img="${roomDTO.RImg3}"></li>
				<li><img src="${roomDTO.RImg4}" class="thumbnail" data-img="${roomDTO.RImg4}"></li>
				<li><img src="${roomDTO.RImg5}" class="thumbnail" data-img="${roomDTO.RImg5}"></li>
			</ul>
			
		</form>
		
		<hr>
		
		<div class="leftArea">
			<img alt="left" src="resources/images/priceRoom/leftArea.PNG"><br>
			<img style="cursor: pointer;" id="amenity" alt="객실어매니티" src="resources/images/priceRoom/객실어매니티.PNG">
			<table class="tableRoomInfo">
				<tbody>
					<tr class="first">
						<th scope="row">
							객실이용
						</th>
						<td>
							<div class="introList">
								<ul>
									<li class="first">55인치 스마트 TV(위성 TV 48개 채널)  <span style="cursor: pointer;" id="satellite channel"><i class="fas fa-tv">위성채널정보 보기</i></span></li>
									<li>50~100Mbps 초고속 유·무선(wifi) 인터넷 무료</li>
									<li>220V, 110V 전압 사용 가능</li>
									<li>커피·차 티백 무료 제공</li>
									<li>엑스트라 베드 1개 추가 36,300원/1박</li>
									<li>베이비 크립(무료)</li>
								</ul>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">
							부대시설
						</th>
						<td>
							<div class="introList">
								<ul>
									<li class="first">
										피트니스 클럽 이용 안내
										<br>
										- 체육관(Gym) 무료 이용(만 16세 이상 입장 가능)
										<br>
										- 실내 수영장 무료 이용(만 13세 이상 입장 가능)
										<br>
										&nbsp;&nbsp;&nbsp;(단, 주말 및 공휴일에는 성인 보호자의 보호 하에
										<br>
										&nbsp;&nbsp;&nbsp;만 13세 미만인 고객이 이용 가능하며,
										<br>
										&nbsp;&nbsp;&nbsp;신장 140cm 미만인 고객은 성인 보호자의 보호 하에
										<br>
										&nbsp;&nbsp;&nbsp;구명조끼 착용 시 이용 가능)
										<br>
										- 사우나 이용시 유료(만 13세 이상 입장 가능)
										<br>
										- 피트니스 클럽은 매월 세 번째 수요일 정기휴일입니다.
									</li>
									<li class="last">투숙 기간 내 무료 주차 가능</li>
								</ul>
							</div>
						</td>
					</tr>
					<tr class="last">
						<th scope="row">
							룸서비스
						</th>
						<td>
							<div class="introList">
								<ul>
									<li class="first">객실에서 즐기실 수 있는 다양한 룸서비스 메뉴가 준비되어 있습니다.</li>
									<li>식사 및 음료 : 24시간 서비스</li>
									<li>중식, 일식 : 점심 12:00~14:00, 저녁 18:00~21:30</li>
									<li class="last"><a href="download.do"><img alt="다운로드" src="resources/images/priceRoom/룸서비스메뉴다운로드.PNG"></a></li>
								</ul>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="rightArea">
			<ul class="btnSet">
				<li class="first">
					<img style="cursor: pointer;" id="floorPlan" src="resources/images/priceRoom/floorPlan.JPG" alt="도면보기">
				</li>
				<li>
					<img style="cursor: pointer;" id="inquire" src="resources/images/priceRoom/inquire.JPG" alt="문의하기">
				</li>
				<li class="last">
					<img style="cursor: pointer;" id="reservation" src="resources/images/priceRoom/reservation.JPG" alt="예약하기">
				</li>
			</ul>
			<div class="HotelInfoBox">
				<div class="HotelBoxTop">
					<div class="conTitle1">
						<h3 class="title">Hotel Info.</h3>
					</div>
					<p class="title">조식 이용 안내</p>
					<div class="useIntro">
						<p>- 더 파크뷰 06:00~10:00(주중/주말/공휴일)</p>
						<p>- 더 라이브러리 08:00~11:30</p>
						<p style="text-indent: -16px; padding-left: 24px;">
						※ 현재 더 라이브러리는 코로나19로 인한 운영시간 
						<br>
						  축소로 조식 운영을 하지 않고 있사오니 이용에 
						<br>
						  참고 부탁드립니다.
						</p>
					</div>
					<div class="introBtm" style="min-height: 0px;">
						<p class="title">체크인/체크아웃 시간</p>
						<div class="useIntro">
							<p>- 체크인 : 오후 3시 이후</p>
							<p>- 체크아웃 : 낮 12시 </p>
							<p>※ 2021년 10월 1일부터 체크인은 오후 2시 이후, 체크아웃은 오전 11시까지로 변경됩니다.</p>
						</div>
					</div>
					<div class="introBtm" style="min-height: 0px;">
						<p class="title">취소/변경 및 노쇼(No-show) 안내</p>
						<div class="useIntro">
							<p style="letter-spacing: -0.3px;">- 숙박 예정일 1일 전 18시까지는 위약금 없음</p>
							<p style="letter-spacing: -0.3px;">- 숙박 예정일 1일 전 18시 이후 취소/변경/노쇼 발생 시</p>
							<p style="padding: 0px 18px;">
							 성수기(5월~10월, 12월 24일~31일) :
							<br>
							 최초 1일 숙박 요금의 80%가 위약금으로 부과
							<br>
							 비수기(성수기 외 기간) :
							<br>
							 최초 1일 숙박 요금의 10%가 위약금으로 부과
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	
	<footer id="footer">
		<dl>
			<dt>
				<h3>MOOYA HOTEL</h3>
			</dt>
			<dd>
				<span id="privacy" style="cursor: pointer;">개인정보처리방침</span>
				<span id="term" style="cursor: pointer;">이용약관</span>
				<span id="noEmail" style="cursor: pointer;">이메일주소 무단수집거부</span>
			</dd>
		</dl>
		<address>
			<span>서울특별시 마포구 서강로 136 아이비티워 2층,3층</span>
			<span>  Tel. 02-123-4567  </span>
			<span> (주)무야호 </span>
			<br>
			<span> 
				E-mail. 
				<a href="mailto:hotel@mooyahotel.co.kr">hotel@mooyahotel.co.kr</a>
			</span>
			<br>
			<span>대표자:유재석  </span>
			<span>등록번호 111 22 33333</span>
		</address>
		<p>
			<i class="far fa-copyright"></i>
			<b>www.mooyahotel.com</b>
			<span>All rights reserved.</span>
		</p>
	</footer>
	
</body>
</html>