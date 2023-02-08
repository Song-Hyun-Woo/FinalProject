package com.ef.exhibition.artist.controller;

import java.io.File;
import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ef.exhibition.artist.model.service.ArtistService;
import com.ef.exhibition.artist.model.vo.Artist;
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
	
	//작가 상세페이지
	@RequestMapping("/artistView.do")
	public ModelAndView selectArtist(ModelAndView mv, int artNo) {
		mv.addObject("art",service.selectArtist(artNo));
		mv.setViewName("artist/artistView");
		return mv;
	}
	
	//작가 수정start 페이지
	@RequestMapping("/artUpdateWrite.do")
	public String artUpdateWrtite(int artNo, Model m) {
		Artist a=service.selectArtist(artNo);
		m.addAttribute("art",a);
		return "artist/artUpdate";
	}
	
	//작가 수정End 페이지
	@RequestMapping("/artUpdate.do")
	public String updateArt(@RequestParam(value="upfile", required =false) MultipartFile upfile,
			@RequestParam Map art) {
		log.debug("{}",art);
		int result=service.updateArt(art);
		
		return "redirect:/artistList.do";
	}
	
	//작가 삭제 페이지
	@RequestMapping("/artDelete.do")
	public ModelAndView deleteArt(ModelAndView mv, int artNo) {
		mv.addObject("art",service.deleteArt(artNo));
		mv.setViewName("redirect:/artistList.do");
		return mv;
	}
	
	//작가 insertStart 페이지
	@RequestMapping("/artInsertWrite.do")
	public String artWrite() {
		return "artist/artWrite";
	}
	
	//작가 insertEnd 페이지
	@RequestMapping("/artInsert.do")
	public ModelAndView insertArt(ModelAndView mv, MultipartFile[] upfile,
			String artName, Date artBirth, String artCareer, String artEdu, String artRecord, String artImg, HttpSession session) {
		
		//파일 업로드 처리
		String path=session.getServletContext().getRealPath("/resources/upload/artist/");
		
		//폴더가 있는지 확인하고 폴더 생성
		File dir=new File(path);
		if(!dir.exists()) dir.mkdir();
		
		
		
		
		
		
		
		
		return mv;
	}
}
