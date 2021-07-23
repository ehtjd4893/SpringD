<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
                    <td>  [${my.checkIn } ]</td>
                    <td>  ${my.checkOut }</td>
                    <td> ${my.food }</td>
                    <td>${my.note}</td>
                    <td> ${my.totalPay }</td>
                    
                    <td><input type="button" class="checkBtn" value="클릭" /></td>
                </tr>
               </c:forEach>
                 
            </tbody>
        </table>
        <div class="col-lg-12" id="ex2_Result1" ></div> 
        <div class="col-lg-12" id="ex2_Result2" ></div> 
    </div>
 
 
        <br><br>
 
 
    <script>
 
        // 버튼 클릭시 Row 값 가져오기
        $(".checkBtn").click(function(){ 
            
            var str = ""
            var tdArr = new Array();    // 배열 선언
            var checkBtn = $(this);
            
            // checkBtn.parent() : checkBtn의 부모는 <td>이다.
            // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
            var tr = checkBtn.parent().parent();
            var td = tr.children();
            
            console.log("클릭한 Row의 모든 데이터 : "+tr.text());
            
            var reNo = td.eq(0).text();
            var userid = td.eq(1).text();
            var name = td.eq(2).text();
            var email = td.eq(3).text();
            var email = td.eq(4).text();
            var email = td.eq(5).text();
            var email = td.eq(6).text();
            var email = td.eq(7).text();
            var email = td.eq(8).text();
            var email = td.eq(9).text();
            var email = td.eq(10).text();
            
            
            // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
            td.each(function(i){    
                tdArr.push(td.eq(i).text());
            });
            
            console.log("배열에 담긴 값 : "+tdArr);
            
 
            str +=    " * 클릭된 Row의 td값 = reNo. : <font color='red'>" + reNo + "</font>" ;     
            
            $("#ex2_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());        
            $("#ex2_Result2").html(str);    
        });
    
 
    </script>




</body>
</html>