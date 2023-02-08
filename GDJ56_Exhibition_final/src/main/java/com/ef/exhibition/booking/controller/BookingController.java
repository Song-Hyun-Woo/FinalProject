package com.ef.exhibition.booking.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ef.exhibition.booking.model.service.BookingService;
import com.ef.exhibition.exh.model.service.ExhibitionService;
import com.ef.exhibition.exh.model.vo.Exhibition;


@Controller

public class BookingController {
	
	// 결제 API 호출
		@RequestMapping("pay_main.do")
		public String pay_main() {
			return "pay/pay_main";
		}
		
//		@ResponseBody
//		@RequestMapping("/insertBook")
//		public boolean insertSub(String memberId, String choice) {
//			
//			Map<String, Object> param=new HashMap();
//			param.put("id", memberId);
//			param.put("choice", choice);
//			System.out.println(memberId);
//			System.out.println(choice);
//			
//			int result=BookingService.insertBook(param);
//			
//			//결제 성공 여부
//			boolean data=false;
//			
//			if(result>0) {
//				System.out.println("결제 성공하셨습니다");
//				data=true;
//			}else {
//				System.out.println("결제 실패하셨습니다.");
//			}
//			
//			return data;
//		}	
	
		
	
	
	
}