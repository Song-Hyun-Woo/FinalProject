package com.ef.exhibition.booking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class BookingController {
	
	@GetMapping("/import")
	public String booking() {
		
		return "exh/exhibitionView";
		
	}
		
	
	
	
}