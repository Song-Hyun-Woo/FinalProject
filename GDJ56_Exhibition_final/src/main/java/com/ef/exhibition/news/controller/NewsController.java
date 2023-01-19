package com.ef.exhibition.news.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ef.exhibition.common.PageFactory;
import com.ef.exhibition.news.model.service.NewsService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class NewsController {
	
	private NewsService service;

	@Autowired
	public NewsController(NewsService service) {
		super();
		this.service = service;
	}
	
	//공지사항 메인 페이징처리
	@RequestMapping("/newslist.do")
	public String selectNewsList(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="5")int numPerpage) {
		
		mv.addObject("news",service.selectNewsList(Map.of("cPage",cPage,"numPerpage",numPerpage)));
		int totalData=service.selectNewsCount();
		mv.addObject("pageBar",PageFactory.getPage(cPage,numPerpage,totalData, "NewsList.do"));
		mv.addObject("totalContents",totalData);
		mv.setViewName("news/newsList");
		return "newsList";
	}
	
	//공지사항 상세페이지
	@RequestMapping("/newsView.do")
	public ModelAndView selectNews(ModelAndView mv, int newsNo) {
		mv.addObject("news",service.selectNews(newsNo));
		mv.setViewName("news/newsView");
		return mv;
	}
	
	//공지사항 작성페이지
	@RequestMapping("/newsWrite.do")
	public String newsWrite() {
		return "news/newsWrite";
	}
	
	//공지사항 파일 업로드처리
	
}
