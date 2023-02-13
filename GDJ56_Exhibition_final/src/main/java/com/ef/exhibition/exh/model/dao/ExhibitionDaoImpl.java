package com.ef.exhibition.exh.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ef.exhibition.exh.model.vo.Exhibition;
import com.ef.exhibition.exh.model.vo.Jjim;
import com.ef.exhibition.exh.model.vo.Review;

@Repository
public class ExhibitionDaoImpl implements ExhibitionDao{

//	@Override
//	public int insertExh(SqlSessionTemplate session, Exhibition exh) {
//		return session.insert("exh.insertExh",exh);
//	}
	@Override
	public int insertJjim(SqlSessionTemplate session, Jjim j) {
		return session.insert("exh.insertJjim", j);
	}
	@Override
	public List<Jjim> selectMyjjim(SqlSessionTemplate session, int memberNo) {
		return session.selectList("exh.selectMyjjim", memberNo);
	}
	@Override
	public int insertReview(SqlSessionTemplate session, Review r) {
		return session.insert("exh.insertReview",r);
	}
	@Override
	public List<Review> selectReview(SqlSessionTemplate session, int memberNo) {
		return session.selectList("exh.selectReview", memberNo);
	}
	
	
}