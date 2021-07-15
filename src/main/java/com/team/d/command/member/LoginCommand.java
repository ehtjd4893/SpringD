package com.team.d.command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.d.dao.MemberDAO;
import com.team.d.dto.MemberDTO;

public class LoginCommand  {

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
		
		String page = request.getParameter("page");
		if(page == null)
			page = "index";
		
		String result = null;
		if(loginUser != null) { // 로그인 성공의 경우, Session에 등록
			System.out.println("로그인 성공");
			session.setAttribute("loginUser", loginUser);
			result = page;
		} else{	// 로그인 실패의 경우
			System.out.println("로그인 실패");
			session.setAttribute("loginUser", null);
			result = page;
		}
		return result;

	}

}
