package com.ef.exhibition.member.controller;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ef.exhibition.member.model.service.MemberService;
import com.ef.exhibition.member.model.service.OAuthService;
import com.ef.exhibition.member.model.vo.Member;

@Controller
@RequestMapping("/oauth/")
public class OAuthController {
	@Autowired
	private OAuthService kakao;
	
	
	@RequestMapping(value="/kakao")
	public String kakaoCallback(@RequestParam("code")String code,HttpSession session){
		String access_Token = kakao.getAccessToken(code);
	
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
	    System.out.println("login Controller : " + userInfo);
	    
	    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    if (userInfo.get("email") != null) {
	        session.setAttribute("userId", userInfo.get("email"));
	        session.setAttribute("nickName", userInfo.get("nickname"));
	        session.setAttribute("profile", userInfo.get("profile"));
	        session.setAttribute("access_Token", access_Token);
	    }
		return "member/kakaoLogin";
	}
	
	
	@RequestMapping("/kakaoLogout.do")
	public String kakaoLogout(HttpSession session) {
		kakao.kakaoLogout((String)session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("userId");
		return "index";
	}
}