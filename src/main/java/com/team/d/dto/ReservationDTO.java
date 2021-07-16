package com.team.d.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

 
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ReservationDTO {

	private int reNo;
	private int rNo;
	private int mNo;
	private int people;
	private Date checkIn;
	private Date checkOut;
	private int food;
}
