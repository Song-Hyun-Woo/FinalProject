package com.ef.exhibition.question.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ef.exhibition.question.model.vo.Question;

@Controller
public class QuestionController {
	
//	@Autowired
//	private QuestionService qs;
	
	// qna 작성
//	@RequestMapping("question/qnaWrite.do")
//	public String qnaWrite(@ModelAttribute Question qna,HttpSession session) {
//		String memberId = (String) session.getAttribute("memberId");
//		qna.setMemberId(memberId);
//		int result = qs.insertQna(qna);
//		return "redirect: qnaList.do";
//	}

}
