package com.team.d.command.reservation;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.d.dao.ReservationDAO;

public class MyReservationCommand implements ReservationCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		long mNo = Long.parseLong( request.getParameter("mNo"));
		
		ReservationDAO reservationDAO = sqlSession.getMapper(ReservationDAO.class);
		
		// 예약가능한 방 불러오는 함수
		model.addAttribute("myReservationList",reservationDAO.reservationList(mNo));
		

	}

}