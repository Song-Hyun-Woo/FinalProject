package com.ef.exhibition.exh.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.ef.exhibition.exh.model.vo.Exhibition;
import com.ef.exhibition.exh.model.vo.Jjim;

public interface ExhibitionDao {
	
	int insertExh(SqlSessionTemplate session, Exhibition exh);
//	List<Exhibition> selectExhList(SqlSessionTemplate session,Map<String,Integer> page);
//	int selectExhCount(SqlSessionTemplate session);
//	Exhibition selectExh(SqlSessionTemplate session, int exNo);
	int insertJjim(SqlSessionTemplate session, Jjim j);
	List<Jjim> selectMyjjim(SqlSessionTemplate session, int memberNo);
}
