package com.team.d.command.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.d.dao.BoardDAO;
import com.team.d.dto.BoardDTO;
import com.team.d.dto.PageDTO;
import com.team.d.utils.PagingUtil;

public class SelectInformCommand {
	
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		// 전체 게시물의 개수를 반환하는 함수
		int totalRecord = dao.getTotalRecord();
		
		// 전체 게시물을 list에 담아주는 함수.
		List<BoardDTO> list = dao.boardList(pageDTO);
		for(BoardDTO dto : list) {
			dto.setBPostDate(dto.getBPostDate().substring(2,11));
		}

		
		// json 형태로 반환해줄 Map 그릇
		Map<String, Object> resultMap =  new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("paging", paging);
		return resultMap; 
	} 
	
}
