package com.team.d.command.reservation;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;


public class SelectRemainingRoom implements ReservationCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String startY=request.getParameter("start_year"); 
		String startM=request.getParameter("start_month");
		String startD=request.getParameter("start_day");
		String endY=request.getParameter("end_year");
		String endM=request.getParameter("end_month");
		String endD=request.getParameter("end_day");
		 
		
		
		
	}

}
