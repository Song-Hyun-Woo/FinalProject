package com.ef.exhibition.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.ef.exhibition.admin.model.service.AdminService;
import com.ef.exhibition.common.PageFactory;
import com.ef.exhibition.member.model.vo.Member;

@Controller
@SessionAttributes({"loginAdmin"})
public class AdminController {

	@Autowired 
	private AdminService service;

	
	@RequestMapping("/admin.do")
	public ModelAndView selectMemberList(@RequestParam(name="cPage",defaultValue="1") int cPage,
			@RequestParam(name="numPerpage",defaultValue="5")int numPerpage,ModelAndView mv) {
		Map param=Map.of("cPage",cPage,"numPerpage",numPerpage);
		List<Member> list=service.selectMemberListPage(param);
		mv.addObject("members",list);
		int totalData=service.selectMemberCount();
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, numPerpage, cPage, "admin.do"));
		mv.setViewName("admin/memberList");
		return mv;
	}
	
	//=======================  관리자 로그인 ======================
//	 @RequestMapping("/admin/login.do")
//		public String login() {
//		   return "member/adminLoginpage";
//	   }
//	   
//	   @RequestMapping("/admin/loginEnd.do")
//	   public String loginEnd(Member m,Model model) {
//		  Member loginAdmin = service.selectAdmin(m);
//			
//			String viewName="redirect:/";
//			System.out.println(loginAdmin);
//			
//			if(loginAdmin!=null) {
//				//로그인성공
//				model.addAttribute("loginAdmin",loginAdmin);
//				
//			}else {
//				//로그인실패
//				 model.addAttribute("msg","로그인실패!");
//				 model.addAttribute("loc","/");
//				 viewName="common/msg";
//			}
//			
//			return viewName;
			
		
//	   }
	 
		// 관리자 로그아웃
	 		@RequestMapping("/admin/logout")
	 		//Model에서 @SessionAttributes값으로 session을 관리할때는
	 		//SessionStatus객체를 이용해서 관리한다.
	 		public String logout(SessionStatus status) {
	 			if(!status.isComplete()) {
	 				status.setComplete();//session데이터 삭제
	 			}
	 			//session.invalidate();
	 			return "redirect:/";
	 		}
}
