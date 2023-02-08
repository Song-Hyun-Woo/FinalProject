package com.ef.exhibition.artist.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.ef.exhibition.artist.model.vo.Artist;

public interface ArtistDao {
	List<Artist> selectArtistList(SqlSessionTemplate session,Map<String,Integer> page);
	int selectArtistCount(SqlSessionTemplate session);
	Artist selectArtist(SqlSessionTemplate session, int artNo);
	int insertArtist(SqlSessionTemplate session, Artist a);
	int deleteArt(SqlSessionTemplate session, int artNo);
	int updateArt(SqlSessionTemplate session, Map art);
	
}
