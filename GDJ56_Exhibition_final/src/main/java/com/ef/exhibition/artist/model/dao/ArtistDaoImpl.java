package com.ef.exhibition.artist.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ef.exhibition.artist.model.vo.Artist;

@Repository
public class ArtistDaoImpl implements ArtistDao{

	@Override
	public List<Artist> selectArtistList(SqlSessionTemplate session, Map<String, Integer> page) {
		return session.selectList("art.selectArtistList", null
				,new RowBounds(
						(page.get("cPage")-1)*page.get("numPerpage"),
						page.get("numPerpage")));
	}

	@Override
	public int selectArtistCount(SqlSessionTemplate session) {
		return session.selectOne("art.selectArtistCount");
	}
	
	
}
