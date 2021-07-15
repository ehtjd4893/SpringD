package com.team.d.command.reservation;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.d.dao.ReservationDAO;


public class SelectRoomCommand implements ReservationCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		ReservationDAO reservationDAO = sqlSession.getMapper(ReservationDAO.class);
		
		// rNo를 이용해 그 방의 구체적인 정보를 가져오는 함수
		model.addAttribute("selectRoom", reservationDAO.selectRoom(rNo));
	}

}
