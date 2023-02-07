package com.ef.exhibition.exh.model.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ef.exhibition.exh.model.dao.ExhibitionDao;
import com.ef.exhibition.exh.model.vo.Exhibition;

@Service
public class ExhibitionServiceImpl implements ExhibitionService{
	
	private ExhibitionDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public ExhibitionServiceImpl(ExhibitionDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}

	@Override
	@Transactional
	public int insertExh(Exhibition exh) {
		return dao.insertExh(session,exh);
	}

	@Override
	public List<Exhibition> selectExhList(Map<String, Integer> page) {
		return dao.selectExhList(session,page);
	}

	@Override
	public int selectExhCount() {
		return dao.selectExhCount(session);
	}

	@Override
	public Exhibition selectExh(int exNo) {
		return dao.selectExh(session,exNo);
	}
	
//	// 좋아요 증가 
//	@Transactional(rollbackFor = Exception.class)
//	@Override
//	public int increaseLike(Map<String, Object> map) {
//		return dao.increaseLike(map);
//	}
//
//	// 좋아요 감소 
//	@Transactional(rollbackFor = Exception.class)
//	@Override
//	public int decreaseLike(Map<String, Object> map) {
//		return dao.decreaseLike(map);
//	}
//	
//	// 좋아요 여부 확인 
//	@Override
//	public int selectLikePushed(Map<String, Integer> map) {
//		return dao.selectLikePushed(map);
//	}
	

	
	
	
}
