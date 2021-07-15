<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		#container {
			margin: 0 auto;
			width: 1000px;
		}
		#large-image {
			width: 1000px;
		}
		ul {
			list-style-type: none;
			display: flex;
			justify-content: center;
		}
		li {
			margin: 5px 10px;
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
			<ul>
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
			<img alt="left" src="resources/priceRoom/leftArea.PNG"><br><br>
			<img style="cursor: pointer;" id="amenity" alt="객실어매니티" src="resources/priceRoom/객실어매니티.PNG"><br><br>
			
		</div>
		<div class="rightArea">
			
		</div>
		
	</div>
	
</body>
</html>