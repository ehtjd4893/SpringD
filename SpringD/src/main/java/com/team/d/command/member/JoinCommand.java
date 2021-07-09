package com.team.d.command.member;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.d.dao.MemberDAO;
import com.team.d.dto.MemberDTO;

public class JoinCommand{

	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMName(request.getParameter("mName"));
		memberDTO.setMId(request.getParameter("mId"));
		memberDTO.setMPw(request.getParameter("mPw"));
		memberDTO.setMEmail(request.getParameter("mEmail"));
		memberDTO.setMPhone(request.getParameter("mPhone"));
		memberDTO.setMGrade(request.getParameter("mGrade"));
		
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		int result = memberDAO.join(memberDTO);
		
		try {
			response.setContentType("text/html; charset=utf-8");
			if (result > 0) {
				response.getWriter().append("<script>");
				response.getWriter().append("alert('회원가입이 완료되었습니다. 로그인하세요.');");
				response.getWriter().append("location.href='index.do';");
				response.getWriter().append("</script>");
			} else {
				response.getWriter().append("<script>");
				response.getWriter().append("alert('회원가입에 실패했습니다. 다시 시도해주세요.');");
				response.getWriter().append("history.back();");
				response.getWriter().append("</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
