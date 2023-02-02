package com.ef.exhibition.member.controller;

import java.io.IOException;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.ef.exhibition.member.model.service.MemberService;
import com.ef.exhibition.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Controller
@RequestMapping("/member/")
@SessionAttributes({"loginMember"})
@Slf4j
public class MemberController {
	     
		private MemberService service;
		// 단방향 암호화 지원해주는 서비스
		private BCryptPasswordEncoder passwordEncoder;
		// 이메일 인증 번호
		@Autowired
		private JavaMailSender mailSender;
		
		@Autowired
		public MemberController(MemberService service, BCryptPasswordEncoder passwordEncoder) {
			super();
			this.service = service;
			this.passwordEncoder=passwordEncoder;
		}
		
		
		
		@RequestMapping("/")
		public String main() {
			return "index";
		}
		
		
		//======================= 로그인 ======================
		//로그인 화면
		@RequestMapping("/login.do")
		public String loginView() {
			return "/member/login";
		}
		
		//로그인 기능
		@RequestMapping("loginMember.do")
		public String login(Member m, Model model, HttpSession httpSession) {
			//Session에 데이터를 저장하고 관리
			
			log.debug("m : {}",m);
			Member loginMember=service.selectMemberById(m);
			log.debug("{}",loginMember);
			/*
			 * 암호화된 패스워드를 원본값이랑 비교하기 위해서는 BCryptPasswordEncoder클래스가 제공하는 메소드를 이용해서 동등비교를
			 * 해야한다. 
			 * matches("원본값",암호화값)매소드를 이용
			 */
			if (loginMember != null/* &&passwordEncoder.matches(m.getPassword(), loginMember.getPassword()) */) {
				//로그인성공
				httpSession.setAttribute("loginMember", loginMember);
			}		
			return "redirect:/";
		}
		
		
		//로그아웃 처리
		@RequestMapping("/logout.do")
		public String logout(SessionStatus status) {
			if(!status.isComplete()) {
				status.setComplete(); /* session데이터 삭제 */
			}
			return "redirect:/"; //메인화면으로 재요청
		}
		
		
		//======================= 회원가입 ======================
		
		// 약관 동의 화면 (시간 없어서 안할꺼임)
		@RequestMapping("/term.do")
		public String term() {
			return "meber/term";
		}
		
		// 약관 동의 체크
		
		
		// 회원가입 화면으로 이동
		@RequestMapping("/enrollMember.do")
		public String enrollMember() {
			return "member/enrollMember";
		}
		
		// 아이디 중복확인
		@RequestMapping("/idCheck.do")
		@ResponseBody
		public Member idCheck(Member m) {
			return service.idCheck(m);
		}
		
//		  //아이디 중복확인
//		  
//		  @RequestMapping("/idDuplicate.do") public void idduplicate(String memberId,
//		  HttpServletResponse response) throws IOException { 
//			  Member m = service.idDuplicate(memberId);
//		  
//		  response.getWriter().print(m); 
//		  }
		 
		
		// 회원가입 처리
		@RequestMapping("/enrollMemberEnd.do")
		public ModelAndView enrollMemberEnd(Member m, ModelAndView mv) {
			log.debug("파라미터로 전달된 member : {}",m);
			m.setPassword(passwordEncoder.encode(m.getPassword()));
			
			int result=service.insertMember(m);
			if(result>0) {
				mv.addObject("msg","회원가입 완료");
				mv.addObject("loc","/");
			}else {
				mv.addObject("msg","회원가입 실패");
				mv.addObject("loc","/member/enrollMember.do");
			}
			mv.setViewName("common/msg");
			
			return mv;
		}
		
		// 이메일 인증
		@ResponseBody
		@RequestMapping(value = "/checkMail.do", method = RequestMethod.POST)
		public String emailAuth(String email) {		
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;

		
			/* 이메일 보내기 */
	        String setFrom = "exhibition0101@gmail.com";
	        String toMail = email;
	        String title = "[홈페이지 이름] 회원가입 인증 이메일 입니다.";
	        String content = 
	                "[홈페이지 이름] 회원가입 인증번호 전송 이메일입니다." +
	                "<br><br>" + 
	                "인증 번호는 " + checkNum + "입니다." + 
	                "<br><br>" + 
	                "해당 인증번호를 인증번호 확인란에 기입하여 주시기 바랍니다.";
	        
	        try {
	            
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	        
	        return Integer.toString(checkNum);
		}
		
		
		// 핸드폰 인증
		// coolSMS API 구현 로직 연결 
		@GetMapping("/checkPhoneNum.do")
		@ResponseBody 
		public String sendSMS(@RequestParam(value="to") String to) throws CoolsmsException {  	
			return service.checkPhoneNum(to);
		}
		
		
		
		//======================= 아이디 비밀번호 찾기 ======================
		
		//아이디찾기페이지
		@RequestMapping("/findId.do")
		public String findIdPage() {
			return "member/findId";
		}
		
		//아이디 찾기
		@RequestMapping("/findIdEnd.do")
		public ModelAndView findId(Member m,ModelAndView mv) {
			Member id = service.findId(m);
			System.out.println(id);
		  
			mv.addObject("id",id);
			mv.setViewName("/member/findIdEnd");
			
			return mv;
		}	
		
		//비밀번호찾기페이지
		@RequestMapping("/findhpw.do")
		public String findPwPage() {
			return "member/findPw";
		}
		
		//비밀번호 찾기
		// SMTP 이메일 인증
		@RequestMapping(value = "/findPwEnd.do", method = RequestMethod.POST)
		public ModelAndView findPw(@RequestParam(value="memberId") String memberId,
				                   @RequestParam(value="email") String email,ModelAndView mv) {
			Map param = Map.of("id",memberId,"email",email);
		
			Member pw = service.findPw(param);
			System.out.println(pw);
			
				Random random = new Random();
				int checkNum = random.nextInt(888888) + 111111;

		    
			if(pw!=null) {
				
				/* 이메일 전송 */
		        String setFrom = "exhibition0101@gmail.com"; //전송 이메일
		        String toMail = email;
		        String title = "[홈페이지 이름]비밀번호 변경 인증 이메일 입니다.";
		        String content = 
		                "안녕하세요 [] 입니다." +
		                "<br><br>" + 
		                "비밀번호 변경 인증 번호는 " + checkNum + "입니다." + 
		                "<br><br>" + 
		                "해당 인증번호를 인증번호 확인란에 기입하여 주시기 바랍니다.";
		        
		        try {
		            
		            MimeMessage message = mailSender.createMimeMessage();
		            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		            helper.setFrom(setFrom);
		            helper.setTo(toMail);
		            helper.setSubject(title);
		            helper.setText(content,true);
		            mailSender.send(message);
		            
		        }catch(Exception e) {
		            e.printStackTrace();
		        }
		        mv.setViewName("member/findPwMail");
		        mv.addObject("checkNum",checkNum);
		        mv.addObject("email", email);
		        mv.addObject("memberId",memberId);
		        return mv;
		     
		     }else {
				mv.setViewName("member/findPw");
				return mv;
			}
		  }
		

}