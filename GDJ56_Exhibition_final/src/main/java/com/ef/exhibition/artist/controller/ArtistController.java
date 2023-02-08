package com.ef.exhibition.artist.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ef.exhibition.artist.model.service.ArtistService;
import com.ef.exhibition.common.PageFactory;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ArtistController {
	
	private ArtistService service;
	
	@Autowired
	public ArtistController(ArtistService service) {
		super();
		this.service = service;
	}
	
	
	//작가 메인 리스트페이지
	@RequestMapping("/artistList.do")
	public ModelAndView selectArtistList(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage",defaultValue="12")int numPerpage) {
		mv.addObject("art",service.selectArtistList(Map.of("cPage",cPage,"numPerpage",numPerpage)));
		int totalData=service.selectArtistCount();
		mv.addObject("pageBar",PageFactory.getPageBar(cPage, numPerpage, totalData, "atistList.do"));
		mv.setViewName("artist/artistList");
		return mv;
	}
}
