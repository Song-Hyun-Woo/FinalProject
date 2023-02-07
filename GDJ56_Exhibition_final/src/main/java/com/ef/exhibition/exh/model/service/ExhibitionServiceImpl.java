package com.ef.exhibition.exh.model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ef.exhibition.exh.model.dao.ExhibitionDao;
import com.ef.exhibition.exh.model.vo.Exhibition;
import com.ef.exhibition.exh.model.vo.Jjim;

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
	@Transactional
	public int insertJjim(Jjim j) {
		return dao.insertJjim(session, j);
	}

	@Override
	public List<Jjim> selectMyjjim(int memberNo) {
		return dao.selectMyjjim(session, memberNo);
	}
}