package com.team.d.command.member;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.d.dao.MemberDAO;
import com.team.d.dto.MemberDTO;

public class UpdatePwCommand implements MemberCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		
		String mPw = request.getParameter("mPw");
		long mNo = Long.parseLong(request.getParameter("mNo"));
		
		MemberDTO memberDTO = new MemberDTO();
		// memberDTO.setMPw(SecurityUtils.encodeBase64(mPw));
		memberDTO.setMPw(mPw);
		memberDTO.setMNo(mNo);
		
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		int result = memberDAO.updatePw(memberDTO);
		
		try {
			response.setContentType("text/html; charset=utf-8");
			if (result > 0) {
				/*HttpSession session = request.getSession();
				MemberDTO loginUser = (MemberDTO)session.getAttribute("loginUser");
				if(loginUser != null){
					loginUser.setMPw(SecurityUtils.encodeBase64(mPw));
					response.getWriter().append("<script>");
					response.getWriter().append("alert('비밀번호가 변경되었습니다. 변경된 비밀번호로 로그인하세요.');");
					response.getWriter().append("location.href='index.do';");
					response.getWriter().append("</script>");
				} else {
					response.getWriter().append("<script>");
					response.getWriter().append("alert('비밀번호 변경에 실패했습니다.');");
					response.getWriter().append("history.back();");
					response.getWriter().append("</script>");
				} */
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
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
