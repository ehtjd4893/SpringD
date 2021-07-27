package com.team.d.command.reservation;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public class EmailRevCodeCommand {

	 
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		//예약번호 
		long reNo = Long.parseLong(request.getParameter("reNo"));
		
		
		model.addAttribute("reNo",reNo);
		
		System.out.println(reNo);
		
		return map;//맵으로 리턴
	}

}
