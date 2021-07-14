package com.team.d.command.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.d.dao.MemberDAO;
import com.team.d.dto.MemberDTO;

public class IdAndEmailCheckCommand{

	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpSession session = (HttpSession)map.get("session");
		
		String mId = ((MemberDTO)session.getAttribute("loginUser")).getMId();
		String mEmail = ((MemberDTO)session.getAttribute("loginUser")).getMEmail();
		// String mEmail = request.getParameter("mEmail");
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", memberDAO.idAndEmailCheck(mId, mEmail));
		return resultMap;

	}

}
