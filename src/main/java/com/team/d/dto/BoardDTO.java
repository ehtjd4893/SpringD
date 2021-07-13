package com.team.d.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardDTO {
	private long bIdx;
	private String mId;
	private String bTitle;
	private String bContent;
	private long bHit;
	private String bFileName;
	private String bPostDate;
}
