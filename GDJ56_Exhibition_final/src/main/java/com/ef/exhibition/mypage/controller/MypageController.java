package com.ef.exhibition.mypage.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.ef.exhibition.mypage.model.service.MypageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MypageController {
	
	private MypageService service;
	@Autowired
	public MypageController(MypageService service) {
		this.service=service;
	}
	
	//마이페이지 메인 화면
	@RequestMapping("/mypageMain.do")
	public String mypageMain(){
		return "mypage/mypageMain";
	}
	
	//======================= 마이페이지 ======================
	
			// 개인정보 수정 화면
			@RequestMapping("/updateMember")
			public String mypageInfoUpdate() {
				return "member/updateMember";
			}
			
			// 개인정보 정보 수정
			@RequestMapping("/updateMember.do")
			public ModelAndView updateMember(@RequestParam String memberId, ModelAndView mv) {
				
				mv.addObject("msg", "정보 수정 완료");
				mv.addObject("loc", "/");
				mv.setViewName("common/msg");
				
				return mv;
			}	
			
			
			// 비밀번호 변경 화면
			@RequestMapping("/pwUpdate")
			public String mypagePwUpdate() {
				return "mypage/pwUpdate";
			}
			
			// 
			
			
			// 회원 탈퇴 화면
			@RequestMapping("/Secession")
			public String secession() {
				return "mypage/secession";
			}
			
			//회원 탈퇴 
			@RequestMapping("/secessionEnd.do")
			public ModelAndView SecessionEnd(@RequestParam String memberId, @RequestParam String secessionReason,
					ModelAndView mv, SessionStatus status) {
				if(secessionReason==null||secessionReason=="") {
					secessionReason="사유없음";
				}
				Map param = Map.of("memberId",memberId,"secessionReason",secessionReason);
				
				service.secessionEnd(param);
				
				if(!status.isComplete()) {
					/* session 데이터를 삭제 */
					status.setComplete();  
				}
				
				mv.addObject("msg", "탈퇴 완료");
				mv.addObject("loc", "/");
				mv.setViewName("common/msg");
				
				return mv;
			}
			

}
