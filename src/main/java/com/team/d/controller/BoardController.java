package com.team.d.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.d.command.board.InsertBoardCommand;
import com.team.d.command.board.BoardListCommand;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Controller
public class BoardController {

	private SqlSession sqlSession;
	private InsertBoardCommand insertBoardCommand;
	private BoardListCommand boardListCommand;
	
	@Autowired
	public BoardController(SqlSession sqlSession, 
			InsertBoardCommand insertBoardCommand,
			BoardListCommand boardListCommand) {
		super();
		this.sqlSession = sqlSession;
		this.insertBoardCommand = insertBoardCommand;
		this.boardListCommand = boardListCommand;
	}

	@GetMapping(value="boardPage.do")
	public String BoardPage() {
		return "board/viewBoard";
	}
	
	@GetMapping(value="insertBoardPage.do")
	public String insertBoardPage() {
		return "board/insertBoard";
	}
	
	@PostMapping(value="insertBoard.do")
	public String insertBoard(MultipartHttpServletRequest multipartRequest, Model model) {		
		model.addAttribute("multipartRequest", multipartRequest);
		
		insertBoardCommand.execute(sqlSession, model);
		return "board/viewBoard";
	}

	@GetMapping(value="showList.do", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> boardList(HttpServletRequest request, Model model){
		model.addAttribute("request", request);
		// 전체 게시글 중 첫번째 화면을 보여주도록 설정
		model.addAttribute("page", "1");
		return boardListCommand.execute(sqlSession, model);
	}

	
}
