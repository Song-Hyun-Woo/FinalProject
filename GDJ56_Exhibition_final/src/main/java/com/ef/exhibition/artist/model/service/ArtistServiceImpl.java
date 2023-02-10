package com.ef.exhibition.artist.model.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ef.exhibition.artist.model.dao.ArtistDao;
import com.ef.exhibition.artist.model.vo.Artist;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
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

	@Override
	public Artist selectArtist(int artNo) {
		return dao.selectArtist(session, artNo);
	}

	@Override
	@Transactional
	public int insertArt(Artist a) {
		log.debug("insert 전 : "+a.getArtNo());
		int result=dao.insertArtist(session, a);
		log.debug("insert 후 : "+a.getArtNo());
		return result;
	}

	@Override
	@Transactional
	public int deleteArt(int artNo) {
		int result=dao.deleteArt(session, artNo);
		return result;
	}

	@Override
	@Transactional
	public int updateArt(Map art) {
		int result=dao.updateArt(session, art);
		return result;
	}
	
	
}
