package com.ef.exhibition.member.model.service;

import java.util.Map;

import com.ef.exhibition.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);
	
	Member checkId(Member m);
	
	
	
	Member findId(Member m);
	
	Member findPw(Map param);


}
