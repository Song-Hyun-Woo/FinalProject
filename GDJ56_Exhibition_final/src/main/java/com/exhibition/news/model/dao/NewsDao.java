package com.exhibition.news.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.exhibition.news.model.vo.News;

public interface NewsDao {
	List<News> selectNewsList(SqlSessionTemplate session,Map<String,Integer> page);
	int selectNewsCount(SqlSessionTemplate session);
	News selectNews(SqlSessionTemplate session, int newsNo);
}
