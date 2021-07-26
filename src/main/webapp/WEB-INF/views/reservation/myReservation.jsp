<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="resources/css/loginWindow.css"> 
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>예약 리스트</title>
	
</head>
<body>


<!-- 가져옴 -->

    
    <br><br>
 
    <div class="row">
        <table id="example-table-2" width="100%" class="table table-bordered table-hover text-center">
            <thead>
                <tr>
                    <th>예약번호 </th>
                    <th>방번호</th>
                    <th>회원번호</th>
                    <th>예약자</th>
                    <th>인원</th>
                     <th>체크인</th>
                      <th>체크아웃</th>
                       <th>조식</th>
                        <th>요청사항</th>
                         <th>총가격</th>
                </tr>
            </thead>
            <tbody>  
            <c:forEach var="my" items="${myReservationList}">              
                <tr>
                    <td>${my.reNo}</td>
                    <td>${my.getRNo()}</td>
                    <td> ${my.getMNo()}</td>
                    <td> ${my.booker}</td>
                    <td> ${my.people }</td>
                    <td>  [ ${my.checkIn } ]</td>
                    <td>  [ ${my.checkOut } ]</td>
                    <td> ${my.food }</td>
                    <td>${my.note}</td>
                    <td> ${my.totalPay }</td>
                    
                    <c:if test="${ my.state  == '예약중'}">
                     <td><input type="button" class="cancel_btn" value="예약취소" /></td>
                    </c:if>
                   <c:if test="${ my.state  == '취소'}">
                     <td> ${my.state }</td>
                    </c:if>
                </tr>
               </c:forEach>
                 
            </tbody>
        </table>
        
        <!-- 취소시 비밀번호 확인 -->
        <div id="subData">
	        <form id="reNo_f">
	        	비밀번호 확인<br>
	        	<input type="text" id="reNo" name="reNo">
	        	비밀번호 <input type="password" id="mPw" >
	        	<input type="button" value="확인" id="pw_check">
	        </form>
       </div>
       
    </div>
 

         
 

<script>
 	$(document).ready(function(){
 		fn_cancel();
 		fn_presentPwCheck();
 		fn_updatePw();
 	});
    
    
    // 취소할 예약번호 가져오기
    function fn_cancel(){
        $(".cancel_btn").click(function(){ 
            
            var str = ""
            var cancel_btn = $(this);
            
            var tr = cancel_btn.parent().parent();
            var td = tr.children();
            var reNo = td.eq(0).text();
            
            $("#reNo").val(reNo);    
        });
    }
 
    //취소시 비밀번호 확인창 - 토글
    function fn_showLogin(){
			$('.cancel_btn').on('click',function(){
				$('#reNo_f').toggle();
			});	 
		}	 
    
    
 	// 현재 비밀번호 확인(presentPwCheck)
	var presentPwPass = false;
	function fn_presentPwCheck(){
		$('#mPw').keyup(function(){
			var obj = { // 현재 비밀번호 객체 생성
					mpw: $('#mPw').val()
			};
			$.ajax({
				url: 'presentPwCheck.do',
				type: 'post',
				contentType: 'application/json',
				data: JSON.stringify(obj),
				dataType: 'json',
				success: function(resultMap){
					if(resultMap.isCorrect){
						presentPwPass = true;
					} else{
						presentPwPass = false;
					}
				}
			});
		});
	}
	// 비밀번호 변경(updatePw)
	function fn_updatePw(){
		$('#pw_check').click(function(){
			if(!presentPwPass){ // 기존 비밀번호와 일치하지 않을 경우
				alert('현재 비밀번호가 일치하지 않습니다. 확인해주세요.');
				$('#mPw').focus();
				return false;
			}else{
				$('#reNo_f').attr('action', 'cancelPage.do');
				$('#reNo_f').submit();
			}
		});
	}
	
	
	
	
	
	
</script>




</body>
</html>