package com.team.d.dto;

import java.sql.Date;

 

public class ReservationDTO {

	private int reno;
	private int rno;
	private int mno;
	private int people;
	private Date checkIn;
	private Date checkOut;
	private int food;
	
	public ReservationDTO() {}
	public ReservationDTO(int reno, int rno, int mno, int people, Date checkIn, Date checkOut, int food) {
		super();
		this.reno = reno;
		this.rno = rno;
		this.mno = mno;
		this.people = people;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.food = food;
	}
	
	public int getReno() {
		return reno;
	}
	public void setReno(int reno) {
		this.reno = reno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public Date getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}
	public Date getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}
	public int getFood() {
		return food;
	}
	public void setFood(int food) {
		this.food = food;
	}
	
	
}
