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
		ReservationDAO reservationDAO=sqlSession.getMapper(ReservationDAO.class);
		model.addAttribute("selectRoom",reservationDAO.selectRoom(rNo));
	}

}
