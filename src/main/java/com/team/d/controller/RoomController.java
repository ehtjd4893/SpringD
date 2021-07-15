package com.team.d.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.team.d.command.room.SelectRoomListCommand;
import com.team.d.command.room.SelectRoomViewCommand;

@Controller
public class RoomController {

	private SqlSession sqlSession;
	private SelectRoomListCommand selectRoomListCommand;
	private SelectRoomViewCommand selectRoomViewCommand;
	
	@Autowired
	public RoomController(SqlSession sqlSession,
						  SelectRoomListCommand selectRoomListCommand,
						  SelectRoomViewCommand selectRoomViewCommand) {
		super();
		this.sqlSession = sqlSession;
		this.selectRoomListCommand = selectRoomListCommand;
		this.selectRoomViewCommand = selectRoomViewCommand;
	}
	
	/*
	@GetMapping(value="/")
	public String index() {
		return "index";
	}
	*/
	
	@GetMapping(value="amenity.do")
	public String amenity() {
		return "room/amenity";
	}
	
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
	public String priceRoom(HttpServletRequest request,
							Model model) {
		model.addAttribute("request", request);
		selectRoomViewCommand.execute(sqlSession, model);
		return "room/priceRoom";
	}
	
	
	
	
	
	
	
}
