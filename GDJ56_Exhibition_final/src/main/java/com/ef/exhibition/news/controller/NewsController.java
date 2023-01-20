package com.ef.exhibition.news.controller;

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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ef.exhibition.common.PageFactory;
import com.ef.exhibition.member.model.vo.Member;
import com.ef.exhibition.news.model.service.NewsService;
import com.ef.exhibition.news.model.vo.Attachment;
import com.ef.exhibition.news.model.vo.News;

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
	public ModelAndView selectNewsList(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="10")int numPerpage) {
		
		mv.addObject("newsn",service.selectNewsList(Map.of("cPage",cPage,"numPerpage",numPerpage)));
//		log.debug("{}",mv.getModel().get("newsn"));
		int totalData=service.selectNewsCount();
		mv.addObject("pageBar",PageFactory.getPage(cPage,numPerpage,totalData, "newslist.do"));
		mv.setViewName("news/newsList");
		return mv;
	}
	
	//공지사항 상세페이지
	@RequestMapping("/newsView.do")
	public ModelAndView selectNews(ModelAndView mv, int newsNo) {
		mv.addObject("news",service.selectNews(newsNo));
		mv.setViewName("news/newsView");
		return mv;
	}
	
	//공지사항 작성페이지
//	@RequestMapping("/newsWrite.do")
//	public String newsWrite() {
//		return "news/newsWrite";
//	}
	
	//공지사항 작성 & 파일 업로드처리
	@RequestMapping("/newsInsert.do")
	public ModelAndView insertNews(ModelAndView mv, MultipartFile[] upFile,
			String newsTitle, String newsContent, String newsWriter,
			HttpSession session) {
		
		//파일 업로드 처리하기
		//저장위치 가져오기 /resource/upload
		String path=session.getServletContext().getRealPath("/resources/upload/news/");
		
		//폴더가 있는지 확인하고 폴더를 생성해주기
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs();
		List<Attachment> files=new ArrayList();
		
		for(MultipartFile f: upFile) {
			//리네임드규칙을 생성하기
			if(!f.isEmpty()) {
				//전송된 파일이 있다면..
				//파일 리네임처리 직접하기
				String originalFileName=f.getOriginalFilename();
				String ext=originalFileName.substring(originalFileName.lastIndexOf("."));
				
			//중복되지 않는 이름 설정하는 값지정하기
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rnd=(int)(Math.random()*10000)+1;
				String renameFile=sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
				
				//파일 업로드하기
				try {
					//MultipartFile클래스가 제공해주는 메소드 이용해서 저장처리
					f.transferTo(new File(path+renameFile));
					files.add(Attachment.builder().originalFilename(f.getOriginalFilename())
							.renamedFilename(renameFile).build());
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
		}

		News n=News.builder()
				.newsTitle(newsTitle)
				.newsContent(newsContent)
				.newsWriter(Member.builder().memberId(newsWriter).build())
				.files(files)
				.build();
		
		int result=service.insertNews(n);
		mv.addObject("msg",result>0? "News 등록 성공":"News 등록 실패");
		mv.addObject("loc","/news/newsList.do");
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	//공지사항 파일 다운로드
	@RequestMapping("/filedown.do")
	public void filedownload(String ori, String re, 
			HttpServletResponse response,
			HttpSession session,
			@RequestHeader(value="User-agent") String header) {
		String path=session.getServletContext().getRealPath("/resources/upload/news/");
		File downloadFile=new File(path+re);
		try(FileInputStream fis=new FileInputStream(downloadFile);
				BufferedInputStream bis=new BufferedInputStream(fis);) {
			ServletOutputStream sos=response.getOutputStream();
			
			//파일명 인코딩 하기
			boolean isMs=header.contains("Trident")||header.contains("MSIE");
			String encodeFilename="";
			if(isMs) {
				encodeFilename=URLEncoder.encode(ori,"UTF-8");
				encodeFilename=encodeFilename.replace("\\+", "%20");
				
			}else {
				encodeFilename=new String(ori.getBytes("UTF-8"),"ISO-8859-1");
			}
			
			response.setContentType("application/octet-stream;charset=utf-8");
			response.setHeader("Content-Disposition", "attachment;filename=\""+encodeFilename+"\"");
			
			int read=-1;
			while((read=bis.read())!=-1) {
				sos.write(read);
			}
			
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	//공지사항 작성페이지
	@RequestMapping("/newsWrite.do")
	public String newsWrite() {
		return "news/newsWrite";
	}
}
