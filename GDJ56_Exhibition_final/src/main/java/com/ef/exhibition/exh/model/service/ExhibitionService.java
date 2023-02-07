package com.ef.exhibition.exh.model.service;

import java.util.List;
import java.util.Map;

import com.ef.exhibition.exh.model.vo.Exhibition;

public interface ExhibitionService {
	
	int insertExh(Exhibition exh);
	List<Exhibition> selectExhList(Map<String,Integer> page);
	int selectExhCount();
	Exhibition selectExh(int exNo);
	
//	// 좋아요 증가
//	int increaseLike(Map<String, Object> map);
//	// 좋아요 감소
//	int decreaseLike(Map<String, Object> map);
//	// 좋아요 여부 확인
//	public abstract int selectLikePushed(Map<String, Integer> map);
}
