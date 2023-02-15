package com.ef.exhibition.exh.model.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ef.exhibition.exh.model.dao.ExhibitionDao;
import com.ef.exhibition.exh.model.vo.Exhibition;
import com.ef.exhibition.exh.model.vo.Jjim;
import com.ef.exhibition.exh.model.vo.Review;

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
	public int insertJjim(Jjim j) {
		return dao.insertJjim(session, j);
	}

	@Override
	public List<Jjim> selectMyjjim(int memberNo) {
		return dao.selectMyjjim(session, memberNo);
	}

	@Override
	public int insertReview(Review r) {
		return dao.insertReview(session,r);
	}

	@Override
	public List<Map<String,Review>> selectReview(String exNo) {
		return dao.selectReview(session,exNo);
	}
}