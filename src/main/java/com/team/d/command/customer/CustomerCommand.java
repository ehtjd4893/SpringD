package com.team.d.command.customer;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface CustomerCommand {

	public void execute(SqlSession sqlSession, Model model);
}
