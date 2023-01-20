package com.ef.exhibition.member.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	     
		@Autowired
		private MemberService service;
		
		@Autowired
//		private BCryptPasswordEncoder pwEncoder;
		
		@RequestMapping("/")
		public String main() {
			return "index";
		}
		
		// 아이디 중복확인
		@RequestMapping("/checkId.do")
		@ResponseBody
		public Member idCheck(Member m) {
			return service.checkId(m);
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
			if(!status.isComplete()) {
				status.setComplete(); //session데이터 삭제
			}
			return "redirect:/"; //메인화면으로 재요청
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
//			String encodePassword=passwordEncoder.encode(m.getPassword());
//			m.setPassword(encodePassword);
			
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
		
		//======================= 아이디 비밀번호 찾기 ======================
		
		//아이디찾기페이지
		@RequestMapping("/findId.do")
		public String findIdPage() {
			return "member/findId";
		}
		
		//아이디 찾기
		
		//비밀번호찾기페이지
		@RequestMapping("/findhpw.do")
		public String findPwPage() {
			return "member/findPw";
		}
		
		//비밀번호 찾기
		
		
		//======================= 마이페이지 ======================
	
		// 개인정보 수정
		
		// 비밀번호 변경
		
		// 멤버 탈퇴
		
		
		
		//======================= SNS 로그인 ======================
		
		//카카오 로그인
		
		
		//네이버 로그인
		
		
		
	
		
	
}

