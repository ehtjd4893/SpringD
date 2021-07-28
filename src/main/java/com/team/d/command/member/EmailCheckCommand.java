package com.team.d.command.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.d.dao.MemberDAO;

public class EmailCheckCommand {

	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String mEmail = request.getParameter("mEmail");
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		 
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", memberDAO.emailCheck(mEmail));
		return resultMap;
		
	}
	
}
