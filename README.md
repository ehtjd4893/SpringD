# SpringD
sujin 계정이 안돼서 다시만듦

<진행>
투숙기간,인원 선택 => 방고르기 => 조식 인원 선택(+총 결제값) => 예약정보 => 영수증(결과)

        0716-1 : 조식페이지 完, 예약정보 中
        0716-2 : 집 컴퓨터에선 테이블마다 [spring.테이블명]을 써야 돼서 member.매핑파일 수정함, 
        0719 : 
                예약테이블 DB추가 -> '총가격 칼럼', '진짜 예약자 칼럼' 추가함
                영수증page까지 만들었음(예약정보 => 영수증 페이지 이동시 자바스트립트 완성하기 中)
        0720 : 
                -예약 테이블에 note,reEmail 칼럼(요청사항) 추가함      完
                -BOARD에 SPRING.테이블명 추가(내거만 안돼서) 完
                -이메일 인증   完
                -예약시 로그인 창만뜨게하기 完
                -영수증 페이지에서 F5시 계속해서 예약됨 (해결)完
        0721 : 
               -예약가능한 방만 뽑아오기 DB 完
       0721-2 : 
                -예약가능한 방만 뽑아오기 DB(->하려면 먼저 예약테이블에 모든 방을 올려놔야함   => STS에 SQL파일추가) 完
       
        0722 : -예약 가능한 방 만뽑아오기 오류 수정 完
                - 회원 로그인시 (login.do) 에 '예약정보 확인(myReservation.jsp)' 링크 추가 完
                -예약 정보 확인 페이지 기능(member/myPage.jsp에 태그 ) 完
        0723 :  -member/login.jsp에 예약하기 버튼 추가
                -cancelPage.jsp추가
                - 예약 정보 확인 페이지 기능(member/myPage.jsp에 태그 ) 수정 中
                - 앞으로 해야될 것 : 예약 취소 버튼 누를시 -> 비밀번호 ajax로 확인(일치x면 비밀번호 일치x 알림창)하고 -> CancelCommand로 넘겨서 db의 상태칼럼 '예약 취소'로 변경

        
