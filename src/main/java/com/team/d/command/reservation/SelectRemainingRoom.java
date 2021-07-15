package com.team.d.command.reservation;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.d.dao.ReservationDAO;
import com.team.d.dto.RoomDTO;


public class SelectRemainingRoom implements ReservationCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
			
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		//Date start=Date.valueOf(request.getParameter("start")); 
		//Date end=Date.valueOf(request.getParameter("end"));
		
		// 체크인 날짜
		String checkIn = request.getParameter("checkIn");
		// 체크아웃 날짜
		String checkOut = request.getParameter("checkOut");
		
		// 숙박 인원
		int people = Integer.parseInt(request.getParameter("people"));
		
		System.out.println("조회하신 정보는 " + checkIn + ", " + checkOut + ", " + people + "명입니다");
		
		ReservationDAO reservationDAO = sqlSession.getMapper(ReservationDAO.class);
		
		// 예약정보 불러오는 함수(현재는 존재하는 모든 방 출력하도록 해놓음)
		List<RoomDTO> list = reservationDAO.remainingRoom(checkIn, checkOut, people);
		System.out.println(list);
		
		model.addAttribute("room", list);
		 
	 
	}

}
