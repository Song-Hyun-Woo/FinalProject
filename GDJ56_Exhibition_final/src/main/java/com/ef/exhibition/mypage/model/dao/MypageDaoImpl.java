package com.ef.exhibition.mypage.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Override
	public void secessionEnd(SqlSessionTemplate session, Map param) {
		session.insert("mypage.secessionEnd", param);
		session.update("mypage.secessionMember", param);
	}
}
