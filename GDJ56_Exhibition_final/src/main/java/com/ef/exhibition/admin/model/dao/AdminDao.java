package com.ef.exhibition.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.ef.exhibition.member.model.vo.Member;

public interface AdminDao {

	List<Member> selectMemberList(SqlSessionTemplate session);

	List<Member> selectMemberListPage(SqlSessionTemplate session, Map param);
	
	int selectMemberCount(SqlSessionTemplate session);
	
	
	// 멤버 리스트 페이징 처리
	List<Member> getSearchList(SqlSessionTemplate session, Map param);

	int selectSearchMemberCount(SqlSessionTemplate session, Map param);

}
