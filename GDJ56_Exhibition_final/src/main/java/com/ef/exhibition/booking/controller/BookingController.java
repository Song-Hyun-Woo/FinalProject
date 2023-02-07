package com.ef.exhibition.booking.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ef.exhibition.exh.model.service.ExhibitionService;
import com.ef.exhibition.exh.model.vo.Exhibition;


@Controller

public class BookingController {
	
	// 결제 API 호출
		@RequestMapping("pay_main.do")
		public String pay_main() {
			return "pay/pay_main";
		}
	
		
	
	
	
}