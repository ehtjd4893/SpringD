package com.team.d.dao;

import com.team.d.dto.MemberDTO;

public interface MemberDAO {

	public MemberDTO login(MemberDTO memberDTO);
	public int idCheck(String mId); // 아이디 체크
	public int join(MemberDTO memberDTO); // 회원가입
	public MemberDTO findId(MemberDTO dto); // 아이디 찾기
	public MemberDTO findPw(MemberDTO dto); // 비밀번호 찾기
	public void updatePw(MemberDTO dto); // 비밀번호 변경
	public void updateMember(MemberDTO dto); // 회원정보 변경
	// public int leave(long no); // 회원탈퇴

	
}

