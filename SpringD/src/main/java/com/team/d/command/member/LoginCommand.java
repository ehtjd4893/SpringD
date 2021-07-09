package com.team.d.command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.d.dao.MemberDAO;
import com.team.d.dto.MemberDTO;

public class LoginCommand implements MemberCommand {

	@Override
	public String execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMId(mId);
		memberDTO.setMPw(mPw);
		MemberDTO loginUser = memberDAO.login(memberDTO);
		
		HttpSession session = request.getSession();
		
		String result = null;
		if(loginUser != null) { // 로그인 성공의 경우, Session에 등록
			session.setAttribute("loginUser", loginUser);
			result = "index";
		} else{	// 로그인 실패의 경우
			session.setAttribute("loginUser", null);
			result = "member/login";
		}
		return result;

	}

}
