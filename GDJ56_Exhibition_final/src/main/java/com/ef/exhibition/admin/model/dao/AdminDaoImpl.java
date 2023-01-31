package com.ef.exhibition.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ef.exhibition.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Override
	public List<Member> selectMemberList(SqlSessionTemplate session) {
		
		return session.selectList("member.selectMemberList");
	}
	
	@Override
	public List<Member> selectMemberListPage(SqlSessionTemplate session, Map param) {
		
		int offSet=(int)param.get("cPage");
		int limit=(int)param.get("numPerpage");
		
		return session.selectList("member.selectMemberList",null,new RowBounds((offSet-1)*limit,limit));
	}
	
	@Override
	public int selectMemberCount(SqlSessionTemplate session) {
		
		return session.selectOne("member.selectMemberCount");
	}

}
