package com.ef.exhibition.exh.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ef.exhibition.common.PageFactory;
import com.ef.exhibition.exh.model.service.ExhibitionService;
import com.ef.exhibition.exh.model.vo.Exhibition;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ExhibitionController {
	
	private ExhibitionService service;

	@Autowired
	public ExhibitionController(ExhibitionService service) {
		super();
		this.service = service;
	}
	
	//전시회 등록
	@RequestMapping("/insertExh.do")
	public String insertExh(Exhibition exh) {
		int result=service.insertExh(exh);
		log.debug("{}",result);
		return "exh/exhibitionWrite";
	}
	
	//전시회 메인 페이징처리
//	@RequestMapping("/exhList.do")
//	public ModelAndView selectExhList(ModelAndView mv,
//			@RequestParam(value="cPage", defaultValue="1")int cPage,
//			@RequestParam(value="numPerpage", defaultValue="12")int numPerpage) {
//		mv.addObject("exh",service.selectExhList(Map.of("cPage",cPage,"numPerpage",numPerpage)));
//		int totalData=service.selectExhCount();
//		mv.addObject("pageBar",PageFactory.getPageBar(cPage, numPerpage, totalData, "exhList.do"));
//		mv.setViewName("exh/exhibitionList");
//		return mv;
//	}
	
	@RequestMapping("/exhList")
	public String exhList() {
		return "exh/exhibitionList";
	}
	
	//전시회 상세페이지
	@RequestMapping("/exhibitionView.do")
	public ModelAndView selectExh(ModelAndView mv, int no) {
		mv.addObject("exh",service.selectExh(no));
		mv.setViewName("exh/exhibitionView");
		return mv;
	}
	
	
	
	
	
	//전시회 API 적용
	/* Java 1.8 샘플 코드 */
	//페이징처리는 매개변수로 넣어서 변수 넣어서 pageBar 로 출력
	@RequestMapping(value="/exhApiList.do", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String exhibition(@RequestParam(value="page", defaultValue="1") String page,
			@RequestParam(value="perPage", defaultValue="10")String perPage) throws IOException {
			StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088"); /*URL*/
			urlBuilder.append("/" + URLEncoder.encode("5362595159676a7236394957594751","UTF-8") ); /*인증키 (sample사용시에는 호출시 제한됩니다.)*/
			urlBuilder.append("/" + URLEncoder.encode("json","UTF-8") ); /*요청파일타입 (xml,xmlf,xls,json) */
			urlBuilder.append("/" + URLEncoder.encode("ListExhibitionOfSeoulMOAInfo","UTF-8")); /*서비스명 (대소문자 구분 필수입니다.)*/
			urlBuilder.append("/" + URLEncoder.encode(page,"UTF-8")); /*요청시작위치 (sample인증키 사용시 5이내 숫자)*/
			urlBuilder.append("/" + URLEncoder.encode(perPage,"UTF-8")); /*요청종료위치(sample인증키 사용시 5이상 숫자 선택 안 됨)*/
			// 상위 5개는 필수적으로 순서바꾸지 않고 호출해야 합니다.
			
			// 서비스별 추가 요청 인자이며 자세한 내용은 각 서비스별 '요청인자'부분에 자세히 나와 있습니다.
			//urlBuilder.append("/" + URLEncoder.encode("20220301","UTF-8")); /* 서비스별 추가 요청인자들*/
			//System.out.println(urlBuilder);
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			BufferedReader rd;

			// 서비스코드가 정상이면 200~300사이의 숫자가 나옵니다.
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
					rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
					rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
					sb.append(line);
			}
			
			rd.close();
			conn.disconnect();
			
			return sb.toString();
		}
	}
