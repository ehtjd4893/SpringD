package com.team.d.dto;

import lombok.Data;

@Data
public class RoomDTO {

	// field
	private long rNo;
	private String rName;
	private long rPrice;
	private int rGrade;
	private String rImg;  // 추후에 수정
	private int rAccept;
	private int rSize;
	
}
