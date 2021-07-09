<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        .product-list {
            width: 100%;
            display: flex;
            justify-content: space-between;
        }
        .product {
            position: relative;
        }
        .product > img {
            width: 300px;
            height: 200px;
            /* 이미지를 뒤로 보내기 위해서 z-index값을 낮게 설정 */
            z-index: 1;
        }
        .product > .product-description {
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
        .product > img:hover + .product-description {
            /*opacity: 1;  /* 보인다! */
            display: block;  /* 보인다. */
            transform: translateY(-200px);  /* 위로 200px 올라간다. */
        }
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#img1').click(function(){
				location.href = 'priceRoom.do';
			});
		});
	</script>
</head>
<body>

	<h1>룸 정보 페이지</h1>
	
    <div class="container">
        <div class="product-list">
            <div class="product">
                <img id="img1" alt="과일1 이미지" src="resources/fruit1.jpg">
                <div class="product-description">
                    <h1>과일1</h1>
                    <p>맛있는 과일</p>
                    <p>가격 : 10,000원</p>
                </div>
            </div>
            <div class="product">
                <img alt="과일2 이미지" src="resources/fruit2.jpg">
                <div class="product-description">
                    <h1>과일2</h1>
                    <p>달콤한 과일</p>
                    <p>가격 : 20,000원</p>
                </div>
            </div>
            <div class="product">
                <img alt="과일3 이미지" src="resources/fruit3.jpg">
                <div class="product-description">
                    <h1>과일3</h1>
                    <p>상큼한 과일</p>
                    <p>가격 : 30,000원</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>