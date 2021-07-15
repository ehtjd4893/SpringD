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

public class UpdateMemberCommand implements MemberCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		
		// 마이페이지에서 회원정보 변경 시 request에 입력된 정보 확인
		String mName = request.getParameter("mName");
		String mEmail = request.getParameter("mEmail");
		String mPhone = request.getParameter("mPhone");
		long mNo = Long.parseLong(request.getParameter("mNo"));
		
		// memberDTO 회원정보 일치하는지 확인
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMName(SecurityUtils.xxs(mName)); // 이름 XSS 처리
		memberDTO.setMEmail(mEmail);
		memberDTO.setMPhone(mPhone);
		memberDTO.setMNo(mNo);
		
		// memberDAO의 회원정보 변경 updateMember메소드 호출
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		int result = memberDAO.updateMember(memberDTO);

		try {
			response.setContentType("text/html; charset=utf-8");
			if (result > 0) { // 회원정보 변경 성공 시 loginUser에 등록
				response.getWriter().append("<script>");
				response.getWriter().append("alert('회원 정보가 변경되었습니다.');");
				response.getWriter().append("location.href='myPage.do'");
				response.getWriter().append("</script>");
			} else {
				response.getWriter().append("<script>");
				response.getWriter().append("alert('회원 정보 변경에 실패했습니다.');");
				response.getWriter().append("history.back();");
				response.getWriter().append("</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
