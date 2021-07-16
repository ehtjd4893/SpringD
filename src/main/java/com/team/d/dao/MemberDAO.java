package com.team.d.dao;

import com.team.d.dto.MemberDTO;

public interface MemberDAO {

	public MemberDTO login(MemberDTO memberDTO);
	//public List<MemberDTO> login(MemberDTO memberDTO);
	
	public int idCheck(String mId); // 아이디 체크
	public int emailCheck(String mEmail); // 이메일 중복체크
	public int join(MemberDTO memberDTO); // 회원가입
	public int updatePw(MemberDTO memberDTO); // 비밀번호 변경
	public int update(MemberDTO memberDTO); // 회원정보 변경
	public MemberDTO findId(String mEmail); // 아이디 찾기
	public int idAndEmailCheck(String mId, String mEmail); // 아이디&이메일 일치 확인(비밀번호 찾을 때 필요) : 보류
	public int changePw(MemberDTO memberDTO); // 비밀번호 찾기&비밀번호 변경
	public int leave(long mNo); // 회원탈퇴
	
	public MemberDTO adminLogin(MemberDTO memberDTO);

	
}

