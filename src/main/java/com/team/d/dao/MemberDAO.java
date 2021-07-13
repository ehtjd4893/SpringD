package com.team.d.dao;

import com.team.d.dto.MemberDTO;

public interface MemberDAO {

	public MemberDTO login(MemberDTO memberDTO); // 로그인
	public int idCheck(String mId); // 아이디 체크
	public int emailCheck(String mEmail); // 이메일 체크
	public int join(MemberDTO memberDTO); // 회원가입
	public int updatePw(MemberDTO memberDTO); // 비밀번호 변경
	public int update(MemberDTO memberDTO); // 회원정보 변경
	// public MemberDTO findId(String mEmail); // 아이디 찾기
	// public MemberDTO findPw(String mEmail); // 비밀번호 찾기
	public int leave(long mNo); // 회원탈퇴

	
}

