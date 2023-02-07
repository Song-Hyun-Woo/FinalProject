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
	
//	// 좋아요 증가, 감소, 여부확인
//	int increaseLike(Map<String, Object> map);
//	int decreaseLike(Map<String, Object> map);
//	int selectLikePushed(Map<String, Integer> map);
	
	
}
