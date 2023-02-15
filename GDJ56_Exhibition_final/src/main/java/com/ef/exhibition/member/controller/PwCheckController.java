package com.ef.exhibition.member.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ef.exhibition.member.model.service.MemberService;
import com.ef.exhibition.member.model.vo.Member;

@Controller
@RequestMapping("/member")
public class PwCheckController {

		@Autowired
		private MemberService service;
		
		//인증번호 넘겨주기
		@RequestMapping(value = "/confirmPw.do", method = RequestMethod.POST)
		public ModelAndView confirmPw(String emailConfirm,
				                @RequestParam(value="checkNum")String checkNum,
				                @RequestParam(value="email")String email,
				                @RequestParam(value="memberId")String memberId,ModelAndView mv) {
			if(emailConfirm.equals(checkNum)) {

				 mv.addObject("email",email);
				 mv.addObject("memberId",memberId);
				 mv.setViewName("member/changePw");
	             
			}else {
				mv.setViewName("member/findPw");

			}
			return mv;
		}
		@RequestMapping(value = "/pwChange.do", method = RequestMethod.POST)
		public String pwChange(String password,
				               @RequestParam(value="email")String email,
				               @RequestParam(value="memberId")String memberId,
				               Member m) {
	
			Map param = Map.of("email",email,"password",password,"memberId",memberId);
			int result = service.pwChange(param);
			
			if(result>0) {
			
				return "member/login";
			}else {
				System.out.println("updatePw"+ result);
				return "member/changePw";
			}
			
		}
	}

