package com.ef.exhibition.member.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.ef.exhibition.member.model.service.MemberService;
import com.ef.exhibition.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@SessionAttributes({"loginMember"})
@Slf4j

public class MemberController {
		
		private MemberService service;
		  
		@Autowired 
		 public MemberController(MemberService service) { 
			  this.service = service; 
		  }
		
		//======================= 로그인 ======================
		//로그인 화면
		@RequestMapping("/login.do")
		public String loginView() {
			return "/member/login";
		}
		
		//로그인
		
		
		//로그아웃
		@RequestMapping("/logout.do")
		public String logout(SessionStatus status) {
			status.setComplete();

			return "redirect:/"; // 메인 화면으로 재요청
		}
		
		//======================= 회원가입 ======================
		// 회원가입 화면으로 이동
		@RequestMapping("/enrollMember.do")
		public String enrollMember() {
			return "member/enrollMember";
		}
		
		// 회원가입 처리
		@RequestMapping("/enrollMemberEnd.do")
		public ModelAndView enrollMemberEnd(Member m, ModelAndView mv) {
			log.debug("파라미터로 전달된 member : {}",m);
			String encodePassword=passwordEncoder.encode(m.getPassword());
			m.setPassword(encodePassword);
			
			int result=service.insertMember(m);
			if(result>0) {
				mv.addObject("msg","회원가입 완료");
				mv.addObject("loc","/");
			}else {
				mv.addObject("msg","회원가입 실패");
				mv.addObject("loc","/member/enrollMember.do");
			}
			mv.setViewName("common/msg");
			
			return mv;
		}
		
		//======================= 마이페이지 ======================
	
		// 비밀번호 변경
		
		// 개인정보 수정
		
		
		// 멤버 탈퇴
		
		
		
		//======================= SNS 로그인 ======================
		
		//카카오 로그인
		
		
		
		//네이버 로그인
		
		
		
	
		
	
}

