package com.team.d.command.reservation;

import java.sql.Date;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.junit.runner.Request;
import org.springframework.ui.Model;

import com.team.d.dao.ReservationDAO;
import com.team.d.dto.MemberDTO;
import com.team.d.dto.ReservationDTO;
import com.team.d.dto.RoomDTO;

public class ReceiptCommand implements ReservationCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		//방 번호
		long rNo = Long.parseLong(request.getParameter("rNo"));
		
		
		
		//숙박인원 수
		long people = Long.parseLong(request.getParameter("people"));
		// 체크인 날짜
		Date checkIn = Date.valueOf( request.getParameter("checkIn"));
		// 체크아웃 날짜
		Date checkOut = Date.valueOf(request.getParameter("checkOut"));
		//조식 신청인원
		long food=Long.parseLong( request.getParameter("food"));
		//총 금액
		long totalPay=Long.parseLong( request.getParameter("totalPay"));
		//예약자명
		String booker=request.getParameter("booker");
		String reEmail=request.getParameter("reEmail");
		String note=request.getParameter("note");
		
		
 
		//세션에서 예약한 회원 명 뽑음
		HttpSession session=request.getSession();
		MemberDTO loginUser=(MemberDTO) session.getAttribute("loginUser");
		long mNo=loginUser.getMNo();
		
		
		ReservationDTO r=new ReservationDTO();
		r.setMNo(mNo);
		r.setPeople(people);
		r.setCheckIn(checkIn);
		r.setCheckOut(checkOut);
		r.setFood(food);
		r.setTotalPay(totalPay);
		r.setBooker(booker);
		r.setReEmail(reEmail);
		r.setNote(note);
		
		
		
		
		ReservationDAO reservationDAO = sqlSession.getMapper(ReservationDAO.class);
		
		//DB에 '예약정보 삽입' 하고 '리턴값으로 예약시퀀스값' 저장
		int result=reservationDAO.insertReservation(rNo, mNo, people, checkIn, checkOut, food,totalPay,booker,reEmail,note);
		System.out.println(result);
		//System.out.println(rNo+","+ mNo+","+people+","+checkIn+","+checkOut+","+ food);
		//DB에 삽입한 예약정보 model에 넘김
		model.addAttribute("reno",reservationDAO.selectViewReservation());
		model.addAttribute("selectRoom",reservationDAO.selectRoom(rNo));
		model.addAttribute("reservationDTO",r);
		
	}

}
