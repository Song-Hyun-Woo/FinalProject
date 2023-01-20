package com.ef.exhibition.member.model.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ef.exhibition.member.model.dao.MemberDao;
import com.ef.exhibition.member.model.vo.Member;
@Service
public class MeberServiceImpl implements MemberService {
	
	@Autowired
    private MemberDao dao;
    
   
    
    @Autowired
    SqlSession session;
    
	@Override
	public int insertMember(Member m) {
		
		return dao.insertMember(session,m);
	}
	
	@Override
	public Member checkId(Member m) {
		// TODO Auto-generated method stub
		return dao.checkId(session,m);
	}
	
	@Override
	public Member findId(Member m) {
	
		return dao.findId(session,m);
	}
	
	@Override
	public Member findPw(Map param) {
		// TODO Auto-generated method stub
		return dao.findPw(session,param);
	}
	
	/*
	 * @Override public String CheckPhoneNumber(String to) throws CoolsmsException {
	 * 
	 * String api_key = "NCSFDY2KP4NFILPY"; String api_secret =
	 * "HOEBEL8DVQOB3PG9HBSEEZ4L2C60CVSP"; Message coolsms = new Message(api_key,
	 * api_secret);
	 * 
	 * Random rand = new Random(); String numStr = ""; for(int i=0; i<4; i++) {
	 * String ran = Integer.toString(rand.nextInt(10)); numStr+=ran; }
	 * 
	 * HashMap<String, String> params = new HashMap<String, String>();
	 * params.put("to", "01097807217"); // 수신전화번호 (ajax로 view 화면에서 받아온 값으로 넘김)
	 * params.put("from", "01097807217"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	 * params.put("type", "sms"); params.put("text", "전시회 인증번호는 [" + numStr +
	 * "] 입니다.");
	 * 
	 * coolsms.send(params); // 메시지 전송
	 * 
	 * return numStr;
	 * 
	 * }
	 */
}
