package com.team.d.api;


import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;
import com.team.d.dao.MemberDAO;
import com.team.d.dto.MemberDTO;


@Controller
public class KakaoController {
	
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/kakao", produces = "application/json")
    public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) {
        System.out.println("로그인 할때 임시 코드값");
        //카카오 홈페이지에서 받은 결과 코드
        System.out.println(code);
        System.out.println("로그인 후 결과값");
        
        //카카오 rest api 객체 선언
        KakaoApi kr = new KakaoApi();
        //결과값을 node에 담아줌
        JsonNode node = kr.getAccessToken(code);
        //결과값 출력
        System.out.println(node);
        //노드 안에 있는 access_token값을 꺼내 문자열로 변환
        JsonNode access_token = node.get("access_token");
        String token = access_token.toString();
        //세션에 담아준다.
        session.setAttribute("token", token);
        JsonNode userInfo = KakaoApi.getKakaoUserInfo(access_token);
        
        // Get id
        String apiMemberNo = userInfo.path("id").asText();
        String name = null;
        String email = null;
        String gender = null;
        // 유저정보 카카오에서 가져오기 Get properties
        JsonNode properties = userInfo.path("properties");
        JsonNode kakao_account = userInfo.path("kakao_account");
        
        name = properties.path("nickname").asText();
        email = kakao_account.path("email").asText();
        gender = kakao_account.path("gender").asText();
        System.out.println("회원 아이디 : " + apiNo);
        System.out.println("회원 이메일 : " + email);
        model.addAttribute("loginApi", "1");
        model.addAttribute("email", email);
    	model.addAttribute("apiNo", apiNo);
    	model.addAttribute("apiNum", 2);
        
        String view = "member/join";
        MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
	    MemberDTO memberDTO = new MemberDTO();
	    memberDTO.setApiNum(2);
	    memberDTO.setApiNo(apiNo);
	    MemberDTO loginUser = memberDAO.apiLogin(memberDTO);
	    if(loginUser!= null) {
	    	session.setAttribute("loginUser",loginUser );
	    	view = "map/apiBeforeLogin";
	    }
        
        return view;
    }
	
	
    
    
}