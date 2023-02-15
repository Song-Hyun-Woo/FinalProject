package com.ef.exhibition.mypage.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ef.exhibition.member.model.vo.Member;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Override
	public void secessionEnd(SqlSessionTemplate session, Map param) {
		session.update("mypage.secessionMember", param);
	}
	
	@Override
	public Member selectMember(SqlSessionTemplate session, String memberId) {
		return session.selectOne("mypage.selectMember", memberId);
	}
}
