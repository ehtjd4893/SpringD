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
		h1, h2, h3, h4, h5, h6, h7, form {
			margin: 0;
		}
		thead th {
			height: auto;
			font-weight: bold;
		    text-align: center;
		    padding: 16px 0;
		    color: #888;
		    background: #faf9f4;
		    border-right: 1px solid #eceae1;
    		border-bottom: 1px solid #eceae1;
    		vertical-align: top;
    		line-height: 100%;
		}
		tbody th {
			height: auto;
		    border-left: none;
		    border-right: 1px solid #eceae1;
		    border-bottom: 1px solid #eceae1;
		    background: #f8f8f8;
		    font-weight: bold;
		    text-align: center;
		    padding: 8px 0;
		    color: #888;
		    line-height: 100%;
    		vertical-align: middle;
		}
		tbody td {
			border-left: none;
			border-right: 1px solid #eceae1;
    		border-bottom: 1px solid #eceae1;
		    padding: 6px 0 6px 0;
		    font-family: Dotum;
		    font-size: 12px;
		    background: #fff;
		    color: #1b1b1b;
		    text-align: center;
		    line-height: 15px;
		}
		h2 {
			margin-block-start: 0.83em;
		    margin-block-end: 0.83em;
		    margin-inline-start: 0px;
		    margin-inline-end: 0px;
		}
		table {
			display: table;
			box-sizing: border-box;
			text-indent: initial;
			border-spacing: 2px;
			border-color: grey;
		}
		colgroup {
			display: table-column-group;
		}
		thead {
			display: table-header-group;
			vertical-align: middle;
			border-color: inherit;
		}
		tbody {
			display: table-row-group;
		    vertical-align: middle;
		    border-color: inherit;
		}
		tr {
			display: table-row;
			vertical-align: inherit;
			border-color: inherit;
		}
		th {
			display: table-cell;
		}
		#close {
			width: 19px;
			height: 19px;
			text-indent: -9999%;
		    overflow: hidden;
		    display: block;
		}
		.first th,
		.first td {
			border-top: 1px solid #cdcbbe;
		}
		.satelliteChannel {
			width: 489px;
			background: #FFF;
			z-index: 1500;
			zoom: 1;
			box-shadow: 1px 1px 2px #555;
		}
		.head {
			position: relative;
			height: 30px;
			zoom: 1;
			z-index: 10;
			background: #9b7f5b;
    		border: #9b7f5b solid 5px;
		}
		.title {
			width: 147px;
			height: 19px;
			display: block;
			padding: 8px 0 0 28px;
			overflow: hidden;
			text-indent: -9999%;
			color: #ccc;
			font-weight: bold;
			font-size: 14px;
			text-align: right;
			line-height: 100px;
		}
		.closeBtn {
			float: right;
			padding: 6px 22px 0 0;
		}
		.content {
			background: #FFF;
		    border: #9b7f5b solid 5px;
		    border-top: none;
		}
		.scrollBox {
			height: 450px;
			overflow: auto;
			position: relative;
		}
		.scrollBoxIn {
			zoom: 1;
		}
		.tableAccSatellite {
			margin: 0;
			width: 100%;
			border-collapse: collapse;
			table-layout: fixed;
		}
		.col_last {
			border-right: 0 !important;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>

	<h1>satelliteChannel</h1>
	
	<div class="satelliteChannel" tabindex="-1" style="top: 1070px; left: 753.5px;">
		<div class="head">
			<h2 class="title">위성채널 정보보기</h2>
			<div class="closeBtn">
				<i id="close" class="fas fa-times"></i>
			</div>
		</div>
		<div class="content">
			<div class="scrollBox">
				<div class="scrollBoxIn">
					<table class="tableAccSatellite" summary="채널번호, 채널명, 언어로 구성된 테이블입니다.">
						<colgroup>
							<col width="25%;">
							<col width="32%;">
							<col width="*;">
						</colgroup>
						<thead>
							<tr class="first">
								<th scope="col">채널</th>
								<th scope="col">채널명</th>
								<th scope="col">언어</th>
								<th class="col_last" scope="col">방송내용</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">6</th>
								<td>SBS</td>
								<td>한국어</td>
								<td class="col_last">국내방송</td>
							</tr>
							<tr>
								<th scope="row">7</th>
								<td>KBS 2</td>
								<td>한국어</td>
								<td class="col_last">국내방송</td>
							</tr>
							<tr>
								<th scope="row">9</th>
								<td>KBS1</td>
								<td>한국어</td>
								<td class="col_last">국내방송</td>
							</tr>
							<tr>
								<th scope="row">10</th>
								<td>EBS</td>
								<td>한국어</td>
								<td class="col_last">국내방송</td>
							</tr>
							<tr>
								<th scope="row">11</th>
								<td>MBC</td>
								<td>한국어</td>
								<td class="col_last">국내방송</td>
							</tr>
							<tr>
								<th scope="row">13</th>
								<td>Channel A</td>
								<td>한국어</td>
								<td class="col_last">국내방송</td>
							</tr>
							<tr>
								<th scope="row">15</th>
								<td>JTBC</td>
								<td>한국어</td>
								<td class="col_last">국내방송</td>
							</tr>
							<tr>
								<th scope="row">16</th>
								<td>MBN</td>
								<td>한국어</td>
								<td class="col_last">국내방송</td>
							</tr>
							<tr>
								<th scope="row">19</th>
								<td>TV Chosun</td>
								<td>한국어</td>
								<td class="col_last">국내방송</td>
							</tr>
							<tr>
								<th scope="row">20</th>
								<td>News Y</td>
								<td>한국어</td>
								<td class="col_last">뉴스</td>
							</tr>
							<tr>
								<th scope="row">24</th>
								<td>YTN</td>
								<td>한국어</td>
								<td class="col_last">뉴스</td>
							</tr>
							<tr>
								<th scope="row">25</th>
								<td>WOW</td>
								<td>한국어</td>
								<td class="col_last">경제뉴스</td>
							</tr>
							<tr>
								<th scope="row">26</th>
								<td>J-Golf</td>
								<td>한국어</td>
								<td class="col_last">스포츠</td>
							</tr>
							<tr>
								<th scope="row">27</th>
								<td>SBS Golf</td>
								<td>한국어</td>
								<td class="col_last">스포츠</td>
							</tr>
							<tr>
								<th scope="row">28</th>
								<td>MBC Sports+</td>
								<td>한국어</td>
								<td class="col_last">스포츠</td>
							</tr>
							<tr>
								<th scope="row">29</th>
								<td>SBS Sports</td>
								<td>한국어</td>
								<td class="col_last">스포츠</td>
							</tr>
							<tr>
								<th scope="row">30</th>
								<td>Star Sports</td>
								<td>한국어</td>
								<td class="col_last">스포츠</td>
							</tr>
							<tr>
								<th scope="row">31</th>
								<td>KBS N Ssports</td>
								<td>한국어</td>
								<td class="col_last">스포츠</td>
							</tr>
							<tr>
								<th scope="row">32</th>
								<td>sky Sports</td>
								<td>한국어</td>
								<td class="col_last">스포츠</td>
							</tr>
							<tr>
								<th scope="row">33</th>
								<td>SPOTV</td>
								<td>한국어</td>
								<td class="col_last">스포츠</td>
							</tr>
							<tr>
								<th scope="row">35</th>
								<td>CGV</td>
								<td>원어</td>
								<td class="col_last">영화</td>
							</tr>
							<tr>
								<th scope="row">36</th>
								<td>OCN</td>
								<td>원어</td>
								<td class="col_last">영화</td>
							</tr>
							<tr>
								<th scope="row">37</th>
								<td>Catch On</td>
								<td>원어</td>
								<td class="col_last">영화</td>
							</tr>
							<tr>
								<th scope="row">38</th>
								<td>Super Action</td>
								<td>원어</td>
								<td class="col_last">영화</td>
							</tr>
							<tr>
								<th scope="row">39</th>
								<td>AXN</td>
								<td>원어</td>
								<td class="col_last">오락</td>
							</tr>
							<tr>
								<th scope="row">40</th>
								<td>TVN</td>
								<td>한국어</td>
								<td class="col_last">오락</td>
							</tr>
							<tr>
								<th scope="row">41</th>
								<td>Anibox</td>
								<td>한국어</td>
								<td class="col_last">어린이</td>
							</tr>
							<tr>
								<th scope="row">42</th>
								<td>Cartoon Network</td>
								<td>한국어</td>
								<td class="col_last">어린이</td>
							</tr>
							<tr>
								<th scope="row">44</th>
								<td>Discovery</td>
								<td>영어</td>
								<td class="col_last">다큐</td>
							</tr>
							<tr>
								<th scope="row">45</th>
								<td>National Geographic</td>
								<td>영어</td>
								<td class="col_last">다큐</td>
							</tr>
							<tr>
								<th scope="row">46</th>
								<td>CGTN</td>
								<td>중국어</td>
								<td class="col_last">개별국가</td>
							</tr>
							<tr>
								<th scope="row">47</th>
								<td>CCTV 4</td>
								<td>중국어</td>
								<td class="col_last">개별국가</td>
							</tr>
							<tr>
								<th scope="row">48</th>
								<td>Star Chinese</td>
								<td>중국어</td>
								<td class="col_last">개별국가</td>
							</tr>
							<tr>
								<th scope="row">49</th>
								<td>Phoenix InfoNews</td>
								<td>중국어</td>
								<td class="col_last">개별국가</td>
							</tr>
							<tr>
								<th scope="row">50</th>
								<td>Phoenix TV</td>
								<td>중국어</td>
								<td class="col_last">개별국가</td>
							</tr>
							<tr>
								<th scope="row">51</th>
								<td>Arirang TV</td>
								<td>영어</td>
								<td class="col_last">공공</td>
							</tr>
							<tr>
								<th scope="row">52</th>
								<td>CNN</td>
								<td>영어</td>
								<td class="col_last">뉴스</td>
							</tr>
							<tr>
								<th scope="row">53</th>
								<td>BBC World </td>
								<td>영어</td>
								<td class="col_last">뉴스</td>
							</tr>
							<tr>
								<th scope="row">54</th>
								<td>CNBC</td>
								<td>영어</td>
								<td class="col_last">뉴스</td>
							</tr>
							<tr>
								<th scope="row">55</th>
								<td>Bloomberg</td>
								<td>영어</td>
								<td class="col_last">뉴스</td>
							</tr>
							<tr>
								<th scope="row">57</th>
								<td>NHK World Premium</td>
								<td>일본어</td>
								<td class="col_last">개별국가</td>
							</tr>
							<tr>
								<th scope="row">59</th>
								<td>AlJazeera</td>
								<td>영어</td>
								<td class="col_last">개별국가</td>
							</tr>
							<tr>
								<th scope="row">60</th>
								<td>France24</td>
								<td>프랑스어</td>
								<td class="col_last">개별국가</td>
							</tr>
							<tr>
								<th scope="row">61</th>
								<td>TV5MONDE</td>
								<td>프랑스어</td>
								<td class="col_last">개별국가</td>
							</tr>
							<tr>
								<th scope="row">62</th>
								<td>Mnet</td>
								<td>한국어</td>
								<td class="col_last">음악</td>
							</tr>
							<tr>
								<th scope="row">63</th>
								<td>SBS MTV</td>
								<td>한국어</td>
								<td class="col_last">음악</td>
							</tr>
							<tr>
								<th scope="row">64</th>
								<td>Channel V</td>
								<td>원어</td>
								<td class="col_last">음악</td>
							</tr>
							<tr>
								<th scope="row">65</th>
								<td>On Style</td>
								<td>한국어</td>
								<td class="col_last">오락</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>