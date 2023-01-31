	package com.ef.exhibition.member.model.service;

import java.util.List;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ef.exhibition.member.model.dao.MemberDao;
import com.ef.exhibition.member.model.vo.Member;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImpl implements MemberService{
	

	private MemberDao dao; 
	private SqlSessionTemplate session;
	 
	@Autowired
	public MemberServiceImpl(MemberDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}
    
    @Override
	public Member selectMemberById(Member m) {
		return dao.selectMemberById(session,m);
	}
    
	@Override
	public int insertMember(Member m) {
		
		return dao.insertMember(session,m);
	}
	
	@Override
	public Member idDuplicate(Member m) {
		
		return dao.idDuplicate(session,m);
	}
	
	/*
	 * @Override public Member idDuplicate(String memberId) { return
	 * dao.idDupicate(memberId, session); }
	 */
	
	// 회원가입 핸드폰 인증 절차
	@Override
	public String checkPhoneNum(String to) throws CoolsmsException {
	
		String api_key = "NCS72WKOLFED7VZI";
		String api_secret = "RFQAVGRUJFFAE9QPI2XCLCJD2NPBYI7A";
		Message coolsms = new Message(api_key, api_secret);
		
		Random rand  = new Random();
		
    String numStr = "";
    for(int i=0; i<4; i++) {
       String ran = Integer.toString(rand.nextInt(10));
       numStr+=ran;
    }          

    
    HashMap<String, String> params = new HashMap<String, String>();
	
    /* 테스트할 때는 발신, 수신 전부 본인 번호로 하면 된다 */
    
	params.put("to", "01097807217");  /* '수신' 전화번호 (Ajax로 view 화면에서 받아온 값으로 넘긴다) */
	
	params.put("from", "01097807217");  /* '발신' 전화번호 (보내는 사람) */ 
    params.put("type", "sms"); 
    params.put("text", "[홈페이지 이름] 본인인증번호는 [" + numStr + "]를 입력해주시기 바랍니다.");
    params.put("app_version", "test app 1.2"); // application name and version

	coolsms.send(params); /* 메시지 전송 */
        
    return numStr;

	}
	
	
	// 아이디, 비밀번호 찾기
	@Override
	public Member findId(Member m) {
	
		return dao.findId(session,m);
	}
	
	@Override
	public Member findPw(Map param) {
		
		return dao.findPw(session,param);
	}
	
	// 비밀번호 찾기 이메일 인증번호
	@Override
	public int pwChange(Map param) {
		return dao.pwChange(session,param);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
