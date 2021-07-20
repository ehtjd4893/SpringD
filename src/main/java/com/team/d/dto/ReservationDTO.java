package com.team.d.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

 
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ReservationDTO {

	private long reNo;
	private long rNo;
	private long mNo;
	private long people;
	private Date checkIn;
	private Date checkOut;
	private long food;
	private long totalPay;
	private String booker;
	private String reEmail;
	private String note;
}
