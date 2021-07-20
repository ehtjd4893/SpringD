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

public class ReceiptCommand2 implements ReservationCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		 
		//리퀘스트로 reno값 받아와서 모델에 뿌려주기
		long reNo = Long.parseLong(request.getParameter("reno"));
		
		ReservationDAO reservationDAO=sqlSession.getMapper(ReservationDAO.class);
		ReservationDTO dto =reservationDAO.selectReservation(reNo);
		model.addAttribute("book",dto); 
		model.addAttribute("selectRoom",reservationDAO.selectRoom(dto.getRNo())); 
		
		
	}

}
