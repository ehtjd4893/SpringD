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
		    list-style: none;
		    margin: 0;
		    padding: 0;
		}
		div {
		    display: block;
		}
		ul {
		    display: block;
		    list-style-type: disc;
		    margin-block-start: 1em;
		    margin-block-end: 1em;
		    margin-inline-start: 0px;
		    margin-inline-end: 0px;
		    padding-inline-start: 40px;
		}
		li {
		    display: list-item;
		    text-align: -webkit-match-parent;
		}
		h3 {
		    display: block;
		    font-size: 1.17em;
		    margin-block-start: 1em;
		    margin-block-end: 1em;
		    margin-inline-start: 0px;
		    margin-inline-end: 0px;
		    font-weight: bold;
		}
		a {
			display: block;
		    padding: 5px;
		    height: 26px;
		    width: 96px;
		    line-height: 26px;
		    border: #e2d5c5 solid 1px;
		    background: #e2d5c5;
		    color: #75604b;
		    font-size: 12px;
		    text-align: center;
		    text-decoration: none;
		}
		img {
			vertical-align: top;
		}
		.container {
			padding: 25px 27px;
		    background: #FFF;
		    border: #9b7f5b solid 5px;
		    border-top: none;
		}
		.wrap {
			width: 100%;
		}
		.tab {
			position: relative;
		    overflow: hidden;
		    padding: 37px 0px 0 0px;
		}
		.ctn {
			float: left;
		}
		.title {
			position: absolute;
		    top: 0px;
		    margin: 0px;
		    padding: 0px;
		    font-size: 12px;
		    font-weight: normal;
		}
		.ctn1 .title {
			left: 0px;
		}
		.ctn2 .title {
			left: 109px;
		}
		.box {
			display: block;
			width: 534px;
			border: #e2d5c5 solid 1px;
		    line-height: 0;
		    padding: 0;
		    margin: 0;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var $tabs = $('a');
			$tabs.click(function() {
				$('box').addClass('hidden');
				$(this).next().removeClass('hidden');
			});
		});
	</script>
</head>
<body>

	<h1>Floor Plan</h1>
	
	<div class="container">
		<div class="wrap">
			<ul class="tab">
				<li id="mapTab1" class="ctn ctn1">
					<h3 class="title">
						<a href="#도면1">Deluxe(DXD)</a>
					</h3>
					<div id="도면1" class="box">
						<img src="resources/images/priceRoom/도면1.JPG" alt="도면1">
					</div>
				</li>
				<li id="mapTab2" class="ctn ctn2">
					<h3 class="title">
						<a href="#도면2">Deluxe(DXT)</a>
					</h3>
					<div id="도면2" class="hidden box">
						<img src="resources/images/priceRoom/도면2.JPG" alt="도면2">
					</div>
				</li>
			</ul>
		</div>
	</div>
	
</body>
</html>