package com.team.d.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RoomController {

	private SqlSession sqlSession;
	
	@Autowired
	public RoomController(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	

	
	@GetMapping(value="roomPage.do")
	public String RoomPage() {
		return "room/viewRoom";
	}
	
	@GetMapping(value="infoRoom.do")
	public String InfoPage() {
		return "room/infoRoom";
	}
	
	
}
