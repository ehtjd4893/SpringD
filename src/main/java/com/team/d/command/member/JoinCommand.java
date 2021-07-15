package com.team.d.command.member;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.d.dao.MemberDAO;
import com.team.d.dto.MemberDTO;
import com.team.d.util.SecurityUtils;

public class JoinCommand {

	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		
		// 회원가입 시 request에 입력된 정보 확인
		String mName = request.getParameter("mName");
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		String mEmail = request.getParameter("mEmail");
		String mPhone = request.getParameter("mPhone");
		
		// memberDTO에 위 값이 일치하는지 확인
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMName(SecurityUtils.xxs(mName)); // 이름 xss 처리
		memberDTO.setMId(mId);
		memberDTO.setMPw(SecurityUtils.encodeBase64(mPw)); // 비밀번호 암호화 처리
		memberDTO.setMEmail(mEmail);
		memberDTO.setMPhone(mPhone);
		
		// memberDAO의 회원가입 join메소드 호출
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		int result = memberDAO.join(memberDTO);
		
		try {
			response.setContentType("text/html; charset=utf-8");
			if (result > 0) { // 회원가입 성공
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
