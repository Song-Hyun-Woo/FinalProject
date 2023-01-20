package com.ef.exhibition.member.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ef.exhibition.member.model.vo.Member;

public interface MemberDao {

	int insertMember(SqlSession session, Member m);
	
	Member checkId(SqlSession session, Member m);
	
	
	Member findId(SqlSession session,Member m);
	
	Member findPw(SqlSession session,Map param);



}
