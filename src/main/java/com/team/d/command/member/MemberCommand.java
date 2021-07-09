package com.team.d.command.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface MemberCommand {

	public String execute(SqlSession sqlSession, Model model);
	
}
