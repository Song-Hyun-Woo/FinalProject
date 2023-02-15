package com.ef.exhibition.mypage.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.ef.exhibition.member.model.vo.Member;

public interface MypageDao {

	void secessionEnd(SqlSessionTemplate session, Map param);
	
	Member selectMember(SqlSessionTemplate session, String memberId);
}
