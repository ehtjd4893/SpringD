package com.team.d.dto;


 
public class RoomDTO {

	// field
	private long rNo;
	private String rName;
	private long rPrice;
	private int rGrade;
	private String rImg;  // 추후에 수정
	private int rAccept;
	private int rSize;
	
	public RoomDTO() {}
	public RoomDTO(long rNo, String rName, long rPrice, int rGrade, String rImg, int rAccept, int rSize) {
		super();
		this.rNo = rNo;
		this.rName = rName;
		this.rPrice = rPrice;
		this.rGrade = rGrade;
		this.rImg = rImg;
		this.rAccept = rAccept;
		this.rSize = rSize;
	}
	public long getrNo() {
		return rNo;
	}
	public void setrNo(long rNo) {
		this.rNo = rNo;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public long getrPrice() {
		return rPrice;
	}
	public void setrPrice(long rPrice) {
		this.rPrice = rPrice;
	}
	public int getrGrade() {
		return rGrade;
	}
	public void setrGrade(int rGrade) {
		this.rGrade = rGrade;
	}
	public String getrImg() {
		return rImg;
	}
	public void setrImg(String rImg) {
		this.rImg = rImg;
	}
	public int getrAccept() {
		return rAccept;
	}
	public void setrAccept(int rAccept) {
		this.rAccept = rAccept;
	}
	public int getrSize() {
		return rSize;
	}
	public void setrSize(int rSize) {
		this.rSize = rSize;
	}
	
	
	
}
