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
import com.ef.exhibition.mypage.model.service.MypageService;

@Controller
@RequestMapping("/admin/")
@SessionAttributes({"loginAdmin"})
public class AdminController {
 
	private AdminService service;
	@Autowired
	public AdminController(AdminService service) {
		this.service=service;
	}
	
	//관리자페이지 메인 헤더 변경
		@RequestMapping("/adminHeader.do")
		public String adminHeader(){
			return "admin/adminHeader";
	}

	
	// 멤버 리스트 
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
	
	//=======================  Qna 관리 ======================
	
	// Qna 리스트
		

}