package com.ef.exhibition.mypage.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ef.exhibition.member.model.vo.Member;
import com.ef.exhibition.mypage.model.dao.MypageDao;
@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private MypageDao dao;
	
	// 탈퇴
	@Override
	public void secessionEnd(Map param)  {
		dao.secessionEnd(session, param);
	}
	
	//회원정보수정
	@Override
	public Member selectMember(String memberId) {
		return dao.selectMember(session, memberId);
	}

}
