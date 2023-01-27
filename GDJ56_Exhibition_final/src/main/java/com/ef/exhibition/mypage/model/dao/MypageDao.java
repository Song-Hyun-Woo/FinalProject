package com.ef.exhibition.mypage.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface MypageDao {

	void secessionEnd(SqlSessionTemplate session, Map param);

}
