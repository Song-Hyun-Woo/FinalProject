package com.ef.exhibition.exh.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.ef.exhibition.exh.model.vo.Exhibition;

public interface ExhibitionDao {
	
	int insertExh(SqlSessionTemplate session, Exhibition exh);
	List<Exhibition> selectExhList(SqlSessionTemplate session,Map<String,Integer> page);
	int selectExhCount(SqlSessionTemplate session);
	Exhibition selectExh(SqlSessionTemplate session, int exNo);
}
