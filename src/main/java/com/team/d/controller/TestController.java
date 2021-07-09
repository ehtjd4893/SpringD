package com.team.d.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	
	private SqlSession sqlSession;
	
	@Autowired
	public TestController(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@GetMapping(value= "/")
	public String index() {
		return "index";
	}
	
}
