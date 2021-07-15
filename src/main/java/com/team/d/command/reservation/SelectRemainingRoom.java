package com.team.d.command.reservation;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.d.dao.ReservationDAO;


public class SelectRemainingRoom implements ReservationCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		//request값 받아옴
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String start=request.getParameter("start");
		String end=request.getParameter("end");
		int people=Integer.parseInt(request.getParameter("people"));
		
		//예약가능 한 방을 상세조회
		ReservationDAO reservationDAO=sqlSession.getMapper(ReservationDAO.class);
		model.addAttribute("room",reservationDAO.remainingRoom(start,end,people));
		model.addAttribute("start",start);
		model.addAttribute("end",end);
	 
	 
	}

}
