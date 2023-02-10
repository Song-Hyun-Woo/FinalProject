package com.ef.exhibition.booking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class BookingController {
	
	@GetMapping("/import")
	public String booking() {
		
		return "exh/exhibitionView";
		
	}
	
//	갈길이 너무 멀다 오늘 이거 다 끝낼 수 있을까? 저만큼은 집에 가고 싶어요..
	
	//========== 결제 ==========
	
	
	
	
	
}