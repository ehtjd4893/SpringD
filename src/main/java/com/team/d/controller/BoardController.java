package com.team.d.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {

	private SqlSession sqlSession;
	
	@Autowired
	public BoardController(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@GetMapping(value="/")
	public String index() {
		return "index";
	}
	
	@GetMapping(value="boardPage.do")
	public String BoardPage() {
		return "board/viewBoard";
	}
	
	
}
