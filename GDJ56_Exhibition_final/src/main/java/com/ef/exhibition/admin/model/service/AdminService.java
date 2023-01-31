package com.ef.exhibition.admin.model.service;

import java.util.List;
import java.util.Map;

import com.ef.exhibition.member.model.vo.Member;

public interface AdminService {

	List<Member> selectMemberListPage(Map param);

	int selectMemberCount();

	List<Member> selectMemberList();

//	Member selectAdmin(Member m);


	
}
