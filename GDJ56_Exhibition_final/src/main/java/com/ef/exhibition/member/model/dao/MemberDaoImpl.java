package com.ef.exhibition.member.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ef.exhibition.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public int insertMember(SqlSession session, Member m) {
	
		return session.insert("member.insertMember",m);
	}
	
	// 아이디 중복확인
	@Override
	public Member checkId(SqlSession session, Member m) {
    	// TODO Auto-generated method stub
    	return session.selectOne("member.checkId",m);
    }
	
	
	// 아이디 찾기
	@Override
	public Member findId(SqlSession session,Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.findId",m);
	}
	// 비밀번호 찾기
    @Override
    public Member findPw(SqlSession session,Map param) {
    	// TODO Auto-generated method stub
    	return session.selectOne("member.findPw",param);
    }


}
