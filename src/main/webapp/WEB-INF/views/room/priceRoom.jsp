<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
		.introList li {
			display: list-item;
			text-align: -webkit-match-parent;
			padding-left: 8px;
		    line-height: 21px;
		    color: #444;
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
		.thumbnail {
			width: 100px;
			height: 100px;
		}
		.leftArea {
			float: left;
		}
		.rightArea {
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
		}
    </script>
</head>
<body>

	<div id="container">
	
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
			<img alt="left" src="resources/images/priceRoom/leftArea.PNG"><br><br>
			<img style="cursor: pointer;" id="amenity" alt="객실어매니티" src="resources/images/priceRoom/객실어매니티.PNG"><br><br>
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
			
		</div>
		
	</div>
	
</body>
</html>