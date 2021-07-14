package com.team.d.command.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.d.dto.MemberDTO;

public class PresentPwCheckCommand {

public Map<String, Boolean> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		MemberDTO memberDTO = (MemberDTO)map.get("memberDTO");
		HttpSession session = (HttpSession)map.get("session");
		
		// 마이페이지 수정화면에서
		// session에 저장된 비밀번호(mPw1)와 현재 입력한 비밀번호 확인하기(mPw2) : 암호화 처리는 나중에 구현
		String pw1 = ((MemberDTO)session.getAttribute("loginUser")).getMPw(); // session에 저장된 비밀번호
		// SecurityUtils.decodeBase64(mPw1); // mPw1을 복호화
		// String mPw2 = memberDTO.getMPw(); // 현재 입력한 비밀번호(암호화 처리 X)
		// String mPw2 = SecurityUtils.encodeBase64(memberDTO.getMPw()); // 현재 입력한 비밀번호 암호화
		String pw2 = memberDTO.getMPw(); // null 값이 들어옴...오류
		
		Map<String, Boolean> resultMap = new HashMap<>();
		resultMap.put("isCorrect", pw1.equals(pw2)); // mPw1과 mPw2 비교
		return resultMap;

	}

}
