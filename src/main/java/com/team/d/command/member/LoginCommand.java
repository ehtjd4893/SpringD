package com.team.d.command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.d.dao.MemberDAO;
import com.team.d.dto.MemberDTO;
import com.team.d.util.SecurityUtils;

public class LoginCommand implements MemberCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		
		// 암호화 된 pw
		String encodePw = SecurityUtils.encodeBase64(mPw);
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMId(mId);
		memberDTO.setMPw(encodePw);
		
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		MemberDTO loginUser = memberDAO.login(memberDTO);
		
		if(loginUser != null) { // 로그인 성공의 경우, Session에 등록
			request.getSession().setAttribute("loginUser", loginUser);
		} 

	}
}
