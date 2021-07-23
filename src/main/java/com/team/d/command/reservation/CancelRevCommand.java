package com.team.d.command.reservation;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.d.dao.ReservationDAO;

public class CancelRevCommand implements ReservationCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		//예약번호
		long reNo = Long.parseLong(request.getParameter("reNo"));
		
		ReservationDAO reservationDAO = sqlSession.getMapper(ReservationDAO.class);
		reservationDAO.cancelReservation(reNo);
	}

}
