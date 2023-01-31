package com.ef.exhibition.member.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.ef.exhibition.member.model.vo.Member;

public interface MemberDao {

	Member selectMemberById(SqlSessionTemplate session, Member m);
	
	int insertMember(SqlSessionTemplate session, Member m);
	
	Member idDuplicate(SqlSessionTemplate session, Member m);
	
	/* Member idDupicate(String memberId, SqlSessionTemplate session); */
	
	
	Member findId(SqlSessionTemplate session,Member m);
	
	Member findPw(SqlSessionTemplate session,Map param);

	
	int pwChange(SqlSessionTemplate session, Map param);

	


	



}
