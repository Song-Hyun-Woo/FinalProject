package com.ef.exhibition.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ef.exhibition.mypage.model.service.MypageService;

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

}
