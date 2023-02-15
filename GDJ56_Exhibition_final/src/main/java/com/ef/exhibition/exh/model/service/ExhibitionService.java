package com.ef.exhibition.exh.model.service;

import java.util.List;
import java.util.Map;

import com.ef.exhibition.exh.model.vo.Jjim;
import com.ef.exhibition.exh.model.vo.Review;

public interface ExhibitionService {
	
//	int insertExh(Exhibition exh);
//	List<Exhibition> selectExhList(Map<String,Integer> page);
//	int selectExhCount();
//	Exhibition selectExh(int exNo);
	int insertJjim(Jjim j);
	List<Jjim> selectMyjjim(int memberNo);
	
	int insertReview(Review r);
	List<Map<String,Review>> selectReview(String exNo);
}