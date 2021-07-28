package com.team.d.command.reservation;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.d.dao.ReservationDAO;

public class EmailRevCodeCommand{

	
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		//비회원 예약한 이메일 
		String reEmail = request.getParameter("email");
		
		ReservationDAO reservationDAO = sqlSession.getMapper(ReservationDAO.class);
		//비회원 예약정보 list
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("nonMemReservationList",reservationDAO.reservationListNonMember(reEmail));
		
		return resultMap;

	}

}
