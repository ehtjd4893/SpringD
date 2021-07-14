package com.team.d.command.reservation;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.d.dao.ReservationDAO;
import com.team.d.dto.RoomDTO;


public class SelectRemainingRoom implements ReservationCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		System.out.println(2+"이요");
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		System.out.println(3+"이요");
		//Date start=Date.valueOf(request.getParameter("start")); 
		//Date end=Date.valueOf(request.getParameter("end"));
		
		String start=request.getParameter("start");
		String end=request.getParameter("end");
		int people=Integer.parseInt(request.getParameter("people"));
		System.out.println(4+"이요");
		System.out.println(start +","+end+","+people+"입니다");
		
		ReservationDAO reservationDAO=sqlSession.getMapper(ReservationDAO.class);
		model.addAttribute("room",reservationDAO.remainingRoom(start,end,people));
		 
	 
	}

}
