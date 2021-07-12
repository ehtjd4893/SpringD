package com.team.d.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.team.d.dto.BoardDTO;
import com.team.d.dto.PageDTO;

public interface BoardDAO {

	//void insertBoard(@Param(value = "mId") String mId, @Param(value = "bTitle") String bTitle, @Param(value = "bContent") String bContent, @Param(value = "bFILENAME1") String bFILENAME1, @Param(value = "bFILENAME2") String bFILENAME2,
	//		@Param(value = "bFILENAME3") String bFILENAME3);

	public void insertBoard(Map<String, Object> container);
	
	public int getTotalRecord();

	public List<BoardDTO> boardList(PageDTO pageDTO);
	
}
