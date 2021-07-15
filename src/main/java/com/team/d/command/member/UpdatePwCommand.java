package com.team.d.command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.d.dao.MemberDAO;
import com.team.d.dto.MemberDTO;
import com.team.d.util.SecurityUtils;

public class UpdatePwCommand implements MemberCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		HttpSession session = request.getSession();
		
		// 마이페이지에서 비밀번호 변경 시 request에 입력된 mPw, mNo 확인
		String mPw = request.getParameter("mPw");
		long mNo = Long.parseLong(request.getParameter("mNo"));
		
		// memberDTO mPw, mNo 일치하는지 확인
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMPw(SecurityUtils.encodeBase64(mPw)); // 입력된 비밀번호 암호화 처리
		memberDTO.setMNo(mNo);
		
		// memberDAO의 비밀번호 변경 updatePw메소드 호출
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		int result = memberDAO.updatePw(memberDTO);
		
		try {
			response.setContentType("text/html; charset=utf-8");
			if (result > 0) { // 비밀번호 변경 성공
				MemberDTO loginUser = (MemberDTO)session.getAttribute("loginUser"); // session에 등록된 회원정보
				loginUser.setMPw(memberDTO.getMPw());
				response.getWriter().append("<script>");
				response.getWriter().append("alert('비밀번호가 변경되었습니다. 변경된 비밀번호로 로그인하세요.');");
				response.getWriter().append("location.href='index.do';");
				response.getWriter().append("</script>");
			} else{
				response.getWriter().append("<script>");
				response.getWriter().append("alert('비밀번호 변경에 실패했습니다.');");
				response.getWriter().append("history.back();");
				response.getWriter().append("</script>");
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
