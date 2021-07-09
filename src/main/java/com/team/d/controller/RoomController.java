package com.team.d.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.team.d.command.room.SelectRoomListCommand;

@Controller
public class RoomController {

	private SqlSession sqlSession;
	private SelectRoomListCommand selectRoomListCommand;
	
	@Autowired
	public RoomController(SqlSession sqlSession,
						  SelectRoomListCommand selectRoomListCommand) {
		super();
		this.sqlSession = sqlSession;
		this.selectRoomListCommand = selectRoomListCommand;
	}
	
	/*
	@GetMapping(value="/")
	public String index() {
		return "index";
	}
	*/
	
	@GetMapping(value="roomPage.do")
	public String roomPage() {
		return "room/viewRoom";
	}
	
	@GetMapping(value="infoRoom.do")
	public String infoRoom(Model model) {
		selectRoomListCommand.execute(sqlSession, model);
		return "room/infoRoom";
	}
	
	@GetMapping(value="priceRoom.do")
	public String priceRoom() {
		return "room/priceRoom";
	}
	
	
}
