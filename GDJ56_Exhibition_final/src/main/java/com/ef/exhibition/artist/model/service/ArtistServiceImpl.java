package com.ef.exhibition.artist.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ef.exhibition.artist.model.dao.ArtistDao;
import com.ef.exhibition.artist.model.vo.Artist;

@Service
public class ArtistServiceImpl implements ArtistService{

	private ArtistDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public ArtistServiceImpl(ArtistDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}

	@Override
	public List<Artist> selectArtistList(Map<String, Integer> page) {
		return dao.selectArtistList(session, page);
	}

	@Override
	public int selectArtistCount() {
		return dao.selectArtistCount(session);
	}
	
	
}
