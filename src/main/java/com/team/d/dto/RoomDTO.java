package com.team.d.dto;

public class RoomDTO {

	private long rno;
	private String rname;
	private long rprice;
	private int rgrade;
	private String rimg;  // 추후에 수정
	private int raccept;
	private int rsize;
	
	public long getRno() {
		return rno;
	}
	public void setRno(long rno) {
		this.rno = rno;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public long getRprice() {
		return rprice;
	}
	public void setRprice(long rprice) {
		this.rprice = rprice;
	}
	public int getRgrade() {
		return rgrade;
	}
	public void setRgrade(int rgrade) {
		this.rgrade = rgrade;
	}
	public String getRimg() {
		return rimg;
	}
	public void setRimg(String rimg) {
		this.rimg = rimg;
	}
	public int getRaccept() {
		return raccept;
	}
	public void setRaccept(int raccept) {
		this.raccept = raccept;
	}
	public int getRsize() {
		return rsize;
	}
	public void setRsize(int rsize) {
		this.rsize = rsize;
	}
	
}
