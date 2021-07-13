package com.team.d.command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.d.dao.MemberDAO;
import com.team.d.dto.MemberDTO;

public class LoginCommand implements MemberCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMId(mId);
		// memberDTO.setMPw(SecurityUtils.encodeBase64(mPw)); // 암호화 된 비밀번호
		memberDTO.setMPw(mPw);
		
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		MemberDTO loginUser = memberDAO.login(memberDTO);

		if(loginUser != null) {
			request.getSession().setAttribute("loginUser", loginUser);
		}
		
	}
}
