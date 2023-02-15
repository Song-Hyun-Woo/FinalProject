package com.ef.exhibition.exh.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ef.exhibition.exh.model.service.ExhibitionService;
import com.ef.exhibition.exh.model.vo.Jjim;
import com.ef.exhibition.exh.model.vo.Review;
import com.ef.exhibition.member.model.vo.Member;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

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
	
	//댓글 insert
	@RequestMapping("/insertReview.do")
	@ResponseBody
//	public Boolean insertReview(String no, String writer, String reviewContent) {
	public ModelAndView insertReview(ModelAndView mv, String no, String writer, String reviewContent) {
		Review r=Review.builder()
				.ex_no(no)
				.writer(writer)
				.review_content(reviewContent)
				.build();
		log.debug("{}",no);
		int result=service.insertReview(r);
		mv.addObject("msg",result>0? "댓글등록성공":"댓글등록실패");
		mv.addObject("loc","/exhView.do?no="+no);
		mv.setViewName("common/msg");
		
		return mv;
		
//		return result>0?true:false;
	}
	
	
	//댓글 리스트
//	@RequestMapping("/selectReview.do")
//	public Map<String, Object> selectReview(String no) {
//		List<Review> review=service.selectReview(no);
//		ModelAndView mv=new ModelAndView();
//		mv.setViewName("exh/exhibitionView");
//		Map<String, Object> map=new HashMap();
//		map.put("review", review);
//		
//		return map;
//	}
	
	
	//좋아요
	@RequestMapping("/insertJjim.do")
	public ModelAndView insertJjim(ModelAndView mv,int memberNo,String dpseq, String dpname) {
		
		Jjim j=Jjim.builder()
				.member_No(memberNo)
				.ex_No(dpseq)
				.ex_Title(dpname)
				.build();
//		log.debug("{}",j);
		int result=service.insertJjim(j);
		
		//ajax를 사용해서 표시만 해주는게 찜이니까 원래는 이렇게 해야함
		//하지만 지금은 어려우니까 service를 갔다와서 페이지를 리로드 해서 보여주는걸로 함
		
		mv.addObject("msg",result>0? "좋아요♥":"안좋아요ㅡㅡ");
		mv.addObject("loc","/exhList");
		mv.setViewName("common/msg");
		return mv;
	}
	
	
	//DB 자료형 | 자바 자료형 맞추기
	//프론트에서 보내는 변수명과 백엔드에서 받는 변수명 맞추기
	
	//전시회 리스트 연결 + 좋아요 까지..
	@RequestMapping("/exhList")
	public String exhList(HttpSession session,Model m) throws JsonProcessingException{
		//session 로그인 멤버의 memberNo 값이 없어서 에러가 남
		
		int memberNo=((Member)session.getAttribute("loginMember")).getMemberNo();
		ObjectMapper mapper=new ObjectMapper();
		//json 객체로 역직렬화 하거나 java객체를 json으로 직렬화 할때 사용하는 클래스
		//Json 을 java로 변환 할 수 있고
		//java를 Json으로 직렬화 할 수 있다
		
		List<Jjim> list=service.selectMyjjim(memberNo);
		//회원이 좋아요 한 게시글이 하나가 아니니 List로 선언한다
		m.addAttribute("jjim", mapper.writeValueAsString(list));
		
		return "exh/exhibitionList";
	}
	
	
	
	//전시회 상세페이지 연결
	@RequestMapping("/exhView.do")
	public ModelAndView exhView(@RequestParam(value="no", required = false) String no, ModelAndView mv) {
		log.debug(no);
		mv.addObject("no",no);
		List<Map<String,Review>> r=service.selectReview(no);
		mv.addObject("review",r);
		mv.setViewName("exh/exhibitionView");
		return mv;
	}
	
//	@RequestMapping("/exhView.do")
//	public String exhView(@RequestParam(value="no", required = false)String no, Model m)throws JsonProcessingException {
//		ObjectMapper mapper=new ObjectMapper();
//		List<Map<String,Review>> r= service.selectReview(no);
//		m.addAttribute("review",mapper.writeValueAsString(r));
//		
//		m.addAttribute("no",no);
//		return "exh/exhibitionView";
//	}
	
	//전시회 상세페이지에서 API 호출
	@RequestMapping(value="/exhibitionView.do", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String exhibitionView(@RequestParam(value="page", defaultValue="1") String page,
			@RequestParam(value="perPage", defaultValue="10")String perPage, @RequestParam(value="no" ,required = false) String no) throws IOException {
			StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088"); /*URL*/
			urlBuilder.append("/" + URLEncoder.encode("5362595159676a7236394957594751","UTF-8") ); /*인증키 (sample사용시에는 호출시 제한됩니다.)*/
			urlBuilder.append("/" + URLEncoder.encode("json","UTF-8") ); /*요청파일타입 (xml,xmlf,xls,json) */
			urlBuilder.append("/" + URLEncoder.encode("ListExhibitionOfSeoulMOAInfo","UTF-8")); /*서비스명 (대소문자 구분 필수입니다.)*/
			urlBuilder.append("/" + URLEncoder.encode(page,"UTF-8")); /*요청시작위치 (sample인증키 사용시 5이내 숫자)*/
			urlBuilder.append("/" + URLEncoder.encode(perPage,"UTF-8")); /*요청종료위치(sample인증키 사용시 5이상 숫자 선택 안 됨)*/
			// 상위 5개는 필수적으로 순서바꾸지 않고 호출해야 합니다.
//			System.out.println(urlBuilder);
//			log.debug("{}",urlBuilder);
			if(no!=null) urlBuilder.append("/" + URLEncoder.encode(no,"UTF-8"));
			
//			log.debug("{}",no);
//			log.debug("{}",urlBuilder);
			
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
	
	
	
	//전시회 API 적용
	/* Java 1.8 샘플 코드 */
	//페이징처리는 매개변수로 넣어서 변수 넣어서 pageBar 로 출력
	@RequestMapping(value="/exhApiList.do", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String exhibition(@RequestParam(value="page", defaultValue="1") String page,
			@RequestParam(value="perPage", defaultValue="10")String perPage) throws IOException {
//		@RequestParam(value="perPage", defaultValue="10")String perPage, @RequestParam(value="no" ,required = false) String no) throws IOException {
			StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088"); /*URL*/
			urlBuilder.append("/" + URLEncoder.encode("5362595159676a7236394957594751","UTF-8") ); /*인증키 (sample사용시에는 호출시 제한됩니다.)*/
			urlBuilder.append("/" + URLEncoder.encode("json","UTF-8") ); /*요청파일타입 (xml,xmlf,xls,json) */
			urlBuilder.append("/" + URLEncoder.encode("ListExhibitionOfSeoulMOAInfo","UTF-8")); /*서비스명 (대소문자 구분 필수입니다.)*/
			urlBuilder.append("/" + URLEncoder.encode(page,"UTF-8")); /*요청시작위치 (sample인증키 사용시 5이내 숫자)*/
			urlBuilder.append("/" + URLEncoder.encode(perPage,"UTF-8")); /*요청종료위치(sample인증키 사용시 5이상 숫자 선택 안 됨)*/
			// 상위 5개는 필수적으로 순서바꾸지 않고 호출해야 합니다.
			
//			if(no!=null) urlBuilder.append("/" + URLEncoder.encode(no,"UTF-8"));
			
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