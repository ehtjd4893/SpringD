package com.team.d.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ReservationController {

	 
	
	@GetMapping(value="reservationSelectDatePage.do")
	public String reservationSelectDatePage() {
		return "reservation/reservationSelectDatePage";
	}
	
	
	
	
}
