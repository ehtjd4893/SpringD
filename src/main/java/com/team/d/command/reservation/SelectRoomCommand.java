package com.team.d.command.reservation;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.d.dao.ReservationDAO;


public class SelectRoomCommand implements ReservationCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		//request
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		//회원이 선택한 방의 rNo를 받아서 방의 가격 model에 올림(전체정보 포함)
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		ReservationDAO reservationDAO=sqlSession.getMapper(ReservationDAO.class);
		model.addAttribute("selectRoom",reservationDAO.selectRoom(rNo));
	}
		

}
