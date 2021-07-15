package com.team.d.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

 
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ReservationDTO {

	private int reno;
	private int rno;
	private int mno;
	private int people;
	private Date checkIn;
	private Date checkOut;
	private int food;
}
