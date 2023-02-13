package com.ef.exhibition.question.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ef.exhibition.common.PageFactory;
import com.ef.exhibition.question.model.service.QuestionService;
import com.ef.exhibition.question.model.vo.Question;

import lombok.extern.slf4j.Slf4j;

	
@Controller
@Slf4j
public class QuestionController {
			
		@Autowired
		private QuestionService service;

		// 문의 게시판 페이징처리
		@RequestMapping("/questionList.do")
		public ModelAndView selectQuestionList(@RequestParam(name="cPage",defaultValue="1") int cPage,
				@RequestParam(name="numPerpage",defaultValue="5")int numPerpage,ModelAndView mv) {
			Map param=Map.of("cPage",cPage,"numPerpage",numPerpage);
			List<Question> list=service.selectQuestionListPage(param);
			mv.addObject("questions",list);
			int totalData=service.selectQuestionCount();
			mv.addObject("totalContents",totalData);
			mv.addObject("pageBar",PageFactory.getPageBar(totalData, numPerpage, cPage, "questionList.do"));
			// /WEB-INF/views/viewName.jsp
			mv.setViewName("question/questionList");
			System.out.println(list);
			return mv;
		}
		
		// 문의 작성페이지
		@RequestMapping("/questionWrite.do")
		public String questionWrite() {
			return "question/questionWrite";
		}
		
		// 문의사항 작성
		@RequestMapping("/questionWriteEnd.do")
		public String insertQuestion(Question q, Model m, HttpServletRequest rs) {

//			service.insert
			String msg="";
			String loc="";
			try {
				service.insertQuestion(q);
				msg="게시글입력성공";	
				loc="/questionList.do";
			}catch(RuntimeException e) {
				msg="게시글입력실패";
				loc="/questionWrite.do";
			System.out.println(q);
			m.addAttribute("msg",msg);
			m.addAttribute("loc",loc);
			
			
		}	
			return "common/msg";
	}		
		
		// 문의 상세페이지
		@RequestMapping("/questionView.do")
		public ModelAndView getQuestion(int no,ModelAndView mv) {
			
			mv.addObject("question",service.selectQuestion(no));
			mv.setViewName("question/questionView");

			return mv;
		}
		
		
		
	}
