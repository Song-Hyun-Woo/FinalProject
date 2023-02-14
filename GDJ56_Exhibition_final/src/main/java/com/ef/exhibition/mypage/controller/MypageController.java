package com.ef.exhibition.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.ef.exhibition.exh.model.vo.Exhibition;
import com.ef.exhibition.member.model.vo.Member;
import com.ef.exhibition.mypage.model.service.MypageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/")
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
			@RequestMapping("/updateMember.do")
			public String mypageInfoUpdate() {
				return "member/updateMember";
			}
			
			// 개인정보 정보 수정
			@RequestMapping("/updateMemberEnd.do")
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
			@RequestMapping("/secession.do")

			public String secession() {
				return "mypage/secession";
			}
			
			
			//회원 탈퇴 
			@RequestMapping("/secessionEnd.do")
			public ModelAndView removeMember(@RequestParam String memberId, @RequestParam(value="secession_reason") String secessionReason,
					ModelAndView mv, SessionStatus status) {
				log.debug("{}",memberId);
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
			
			
// 
			// 마이페이지 찜한 전시회 화면
			@RequestMapping("/zzim.do")
			public String zzimList() {
				return "mypage/zzim";
			}
			
//			// 찜(전시회 확인하기)
//			@RequestMapping("/mypage/zzim") // 찜
//			public String zzim(Model m, HttpSession session) {
//				Member memberId = (Member) session.getAttribute("loginMember");
//				if(memberId!=null) {
//					
//				List<Likes> zzimList = service.zzimList(memberId);
//				System.out.println("찜 :"+zzimList);
//				m.addAttribute("zzimList", zzimList);
//				m.addAttribute("count", zzimList.size());
//				return "mypage/zzim";
//				}else {
//					
//					return "member/login/loginPage";
//				}
//				
//			}

			// 나의 예매 내역(결제)
			
			
			
			// 나의 문의 내역
			// qna 리스트 출력

			
			
			// FAQ
			@RequestMapping("/faq.do")
			public String faq() {
				return "/mypage/faq";
			}
			
		
			
			
			
			
			

}
