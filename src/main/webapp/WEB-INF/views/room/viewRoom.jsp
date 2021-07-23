<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/viewRoom.css">
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