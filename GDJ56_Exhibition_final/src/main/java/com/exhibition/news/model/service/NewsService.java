package com.exhibition.news.model.service;

import java.util.List;
import java.util.Map;

import com.exhibition.news.model.vo.News;

public interface NewsService {
	List<News> selectNewsList(Map<String,Integer> page);
	int selectNewsCount();
	News selectNews(int newsNo);
	
}
