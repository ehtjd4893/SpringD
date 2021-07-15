package com.team.d.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.team.d.command.reservation.SelectRemainingRoom;
import com.team.d.command.reservation.SelectRoomCommand;




@Controller
public class ReservationController {

	private SqlSession sqlSession;
	private SelectRemainingRoom selectRemainingRoom;
	private SelectRoomCommand selectRoomCommand;
	 
	@Autowired
	public ReservationController(SqlSession sqlSession,
									SelectRemainingRoom selectRemainingRoom,
									SelectRoomCommand selectRoomCommand) {
		this.sqlSession=sqlSession;
		this.selectRemainingRoom=selectRemainingRoom;
		this.selectRoomCommand=selectRoomCommand;
	}
	
	// 조회 페이지로 이동
	@GetMapping(value="reservationSelectDatePage.do")
	public String reservationSelectDatePage() {
		return "reservation/reservationSelectDatePage";
	}
	
	// 체크인 체크아웃 입력 후 조회 버튼 클릭시
	@GetMapping(value="reservationRoomPage.do")
	public String reservationRoomPage(HttpServletRequest request,Model model) {
		model.addAttribute("request",request);
		selectRemainingRoom.execute(sqlSession, model);
		return "reservation/reservationRoomPage";
	}
	
	// 예약하기 버튼 클릭시 이동 
	@GetMapping(value="optionPage.do")
	public String optionPage(HttpServletRequest request,Model model) {
		model.addAttribute("request", request);
		selectRoomCommand.execute(sqlSession, model);
		return "reservation/optionPage";
	}
	
	// 예약 결과 보여주기
	@GetMapping(value="revInfoPage.do")
	public String revInfo(HttpServletRequest request,Model model) {
		model.addAttribute("request",request);
		return "reservation/revInfoPage";
	}
	
}
