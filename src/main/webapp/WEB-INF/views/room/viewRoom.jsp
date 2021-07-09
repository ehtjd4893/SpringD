<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	 <style>
        @media screen and (max-width: 768px) {
            #gnb > ul {
                list-style-type: none;
                padding: 0;
                width: 100%;
                overflow: hidden;
                background-color: navy;
                color: white;
            }
            #gnb > ul > li {
                float: left;
                padding: 10px 20px;
            }
            #gnb > ul > li:hover {
                background-color: lightgreen;
                color: black;
            }
        }
        @media screen and (min-width: 769px) {
            #container {
                overflow: hidden;
                width: 100%;
            }
            #container > #gnb {
                float: left;
                width: 10%;
            }
            #container > #content {
                float: left;
                width: 90%;
            }
            #gnb {
            	cursor: pointer;
            }
            #gnb > ul {
                width: 100%;
                list-style-type: none;
                padding: 0;
                background-color: navy;
                color: white;
            }
            #gnb > ul > li {
                padding: 10px 0;
                text-align: center;
            }
            #gnb > ul > li:hover {
                background-color: lightgreen;
                color: black;
            }
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		$('#room_info_btn').click(function(){
    			location.href = 'infoRoom.do';
    		})
    	});
    </script>
</head>
<body>

	<h1>룸 페이지</h1>
	
	<div id="container">
        <div id="gnb">
            <ul>
                <li>X</li>
                <li>X</li>
                <li id="room_info_btn">객실</li>
                <li>X</li>
                <li>X</li>
            </ul>
        </div>
	</div>

</body>
</html>