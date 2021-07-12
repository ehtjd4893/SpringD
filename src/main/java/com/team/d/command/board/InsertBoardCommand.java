package com.team.d.command.board;

import java.io.File;
import java.util.HashMap;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.d.dao.BoardDAO;

public class InsertBoardCommand implements BoardCommand {

	private Map<String, Object> map;
	private MultipartHttpServletRequest multipartRequest;
	private String mId;
	private String bTitle;
	private String bContent;
	private String BFILENAME1 = "null";
	private String BFILENAME2 = "null";
	private String BFILENAME3 = "null";
	
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		System.out.println("here");
		map = model.asMap();
		multipartRequest = (MultipartHttpServletRequest) map.get("multipartRequest");
		
		mId = multipartRequest.getParameter("m_id");
		bTitle = multipartRequest.getParameter("bTitle");
		bContent = multipartRequest.getParameter("bContent");
		
		

		MultipartFile file1 = multipartRequest.getFile("chooseFile1");
		MultipartFile file2 = multipartRequest.getFile("chooseFile2");
		MultipartFile file3 = multipartRequest.getFile("chooseFile3");
		
		BoardDAO boardDAO = sqlSession.getMapper(BoardDAO.class);
		
		fileUpload(file1, 1);
		fileUpload(file2, 2);
		fileUpload(file3, 3);
		
		Map<String, Object> container = new HashMap<>();
		container.put("mId", mId);
		container.put("bTitle", bTitle);
		container.put("bContent", bContent);
		container.put("BFILENAME1", BFILENAME1);
		container.put("BFILENAME2", BFILENAME2);
		container.put("BFILENAME3", BFILENAME3);
		System.out.println(container);
		//boardDAO.insertBoard(mId, bTitle, bContent, BFILENAME1, BFILENAME2, BFILENAME3);
		boardDAO.insertBoard(container);
		
	}
	
	
	public void fileUpload(MultipartFile file, int seq) {
		if (file != null && !file.isEmpty()) {

			// 올릴 때 파일명
			String originalFilename = file.getOriginalFilename();
			System.out.println("첨부파일명: " + originalFilename);
			
			// 서버에 저장할 파일명
			// 파일명의 중복 방지 대책이 필요
			// 파일명_올린시간.확장자
			String extension = originalFilename.substring( originalFilename.lastIndexOf(".") + 1 );
			String filename = originalFilename.substring( 0, originalFilename.lastIndexOf(".") );
			String uploadFilename = filename + "_" + System.currentTimeMillis() + "." + extension;
			
			// 첨부파일을 저장할 서버 위치
			String realPath = multipartRequest.getServletContext().getRealPath("resources/archive/board");  // archive 디렉터리는 없으므로 생성이 필요
			
			// archive 디렉터리 생성
			File archive = new File(realPath);
			if ( !archive.exists() ) {
				archive.mkdirs();
			}
			
			// 서버에 첨부파일 저장
			File attach = new File(archive, uploadFilename);
			try {
				file.transferTo(attach);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			switch(seq) {
			case 1:
				BFILENAME1 = uploadFilename;
				break;
			case 2:
				BFILENAME2 = uploadFilename;
				break;		
			case 3:
				BFILENAME3 = uploadFilename;
				break;
			}
		} else {
			// 아무것도 하지 않는다.
		}
		
	}
}
