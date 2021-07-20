package com.team.d.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.d.command.reservation.ReceiptCommand;
import com.team.d.command.reservation.ReceiptCommand2;
import com.team.d.command.reservation.RevInfoCommand;
import com.team.d.command.reservation.SelectRemainingRoom;
import com.team.d.command.reservation.SelectRoomCommand;

import lombok.AllArgsConstructor;



@AllArgsConstructor
@Controller
public class ReservationController {

	private SqlSession sqlSession;
	private SelectRemainingRoom selectRemainingRoom;
	private SelectRoomCommand selectRoomCommand;
	private ReceiptCommand receiptCommand;
	private ReceiptCommand2 receiptCommand2;
	private RevInfoCommand revInfoCommand;
	 
	 
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
	
	// 예약정보인 입력페이지 이동
	@GetMapping(value="revInfoPage.do")
	public String revInfo(HttpServletRequest request,Model model) {
		model.addAttribute("request",request);
		revInfoCommand.execute(sqlSession, model);
		return "reservation/revInfoPage";
	}
	
	//최종 예약결과 보여주기 페이지로 이동
	@GetMapping(value="receiptPage.do")
	public String receiptPage(HttpServletRequest request,Model model) {
		model.addAttribute("request",request);
		receiptCommand.execute(sqlSession, model);
		return "redirect:realreceiptPage.do";
	}
	
	
	@GetMapping(value="realreceiptPage.do")
	public String realreceiptPage(HttpServletRequest request,Model model) {
		model.addAttribute("request",request);
		receiptCommand2.execute(sqlSession, model);
		return "reservation/receiptPage";
	}
	
}
