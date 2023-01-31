package com.ef.exhibition.member.model.service;

import java.util.Map;

import com.ef.exhibition.member.model.vo.Member;

import net.nurigo.java_sdk.exceptions.CoolsmsException;

public interface MemberService {

	Member selectMemberById(Member m);
	
	int insertMember(Member m);
	
	Member idDuplicate(Member m);

	/* Member idDuplicate(String memberId); */
	
	String checkPhoneNum(String to) throws CoolsmsException;
	
	
	Member findId(Member m);
	
	Member findPw(Map param);

	
	int pwChange(Map param);

	

	

	




}
