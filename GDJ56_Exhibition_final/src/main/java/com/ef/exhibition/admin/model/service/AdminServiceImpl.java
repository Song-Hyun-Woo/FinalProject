package com.ef.exhibition.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ef.exhibition.admin.model.dao.AdminDao;
import com.ef.exhibition.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Member> selectMemberList() {
	
		return dao.selectMemberList(session);
	}
	
	@Override
	public List<Member> selectMemberListPage(Map param) {
		
		return dao.selectMemberListPage(session, param);
	}
	
	@Override
	public int selectMemberCount() {
		
		return dao.selectMemberCount(session);
	}
	
	
	// 멤버 리스트 페이징 처리
	@Override
	public List<Member> getSearchList(Map param){
		return dao.getSearchList(session, param);
	}
	

	@Override
	public int selectSearchMemberCount(Map param) {
		// TODO Auto-generated method stub
		return dao.selectSearchMemberCount(session, param);
	}

}
