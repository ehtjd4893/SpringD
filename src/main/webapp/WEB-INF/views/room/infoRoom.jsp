<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
        div {
            box-sizing: border-box;
        }
        .container {
            width: 960px;
            margin: 0 auto;
        }
        .room-list {
            width: 100%;
            display: flex;
            justify-content: space-between;
            flex-flow: row wrap;
        }
        .room {
            position: relative;
        }
        .room > img {
            width: 300px;
            height: 200px;
            /* 이미지를 뒤로 보내기 위해서 z-index값을 낮게 설정 */
            z-index: 1;
        }
        .room > .room-description {
            width: 300px;
            height: 200px;
            background-color: rgba(0,0,0,0.5);  /* 각 색상 값: 0~255, 투명도: 0(투명)~1(불투명) */
            /* 설명을 앞으로 보내기 위해서 z-index값을 크게 설정 */
            z-index: 2;
            position: absolute;
            top: 200px;
            text-align: center;
            color: white;
            padding-top: 20px;
            /*opacity: 0;  /* 투명해서 안 보인다! */
            display: none;  /* 안 보인다. 영역도 없다. */
            transition-property: all;  /* opacity, transform */
            transition-duration: 1s;
            transition-timing-function: ease-out;
        }
        .room > img:hover + .room-description {
            /*opacity: 1;  /* 보인다! */
            display: block;  /* 보인다. */
            transform: translateY(-200px);  /* 위로 200px 올라간다. */
        }
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			console.log('${list == null}')
		});
	</script>
</head>
<body>

	<h1>룸 정보 페이지</h1>
	
    <div class="container">
        <div class="room-list">
        	<c:forEach var="room" items="${list}">
	            <div class="room">
	                <img onclick="location.href='priceRoom.do?rNo=${room.RNo}';" style="cursor:pointer;" alt="룸 이미지" src="${room.RImg}" >
	                <div class="room-description">
	                    <h1>${room.RName}</h1>
	                    <p>수용인원 : ${room.RAccept}</p>
	                    <p>가격 : ${room.RPrice}</p>
	                </div>
	            </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>