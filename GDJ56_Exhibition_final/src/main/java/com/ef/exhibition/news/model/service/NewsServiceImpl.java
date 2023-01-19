package com.ef.exhibition.news.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ef.exhibition.news.model.dao.NewsDao;
import com.ef.exhibition.news.model.vo.News;

@Service
public class NewsServiceImpl implements NewsService{

	private NewsDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public NewsServiceImpl(NewsDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}
	
	//공지사항 메인 페이징처리
	@Override
	public List<News> selectNewsList(Map<String, Integer> page){
		return dao.selectNewsList(session, page);
	}
	
	//공지사항 메인 페이징처리
	@Override
	public int selectNewsCount() {
		return dao.selectNewsCount(session);
	}
	
	//공지사항 상세페이지
	@Override
	public News selectNews(int newsNo) {
		return dao.selectNews(session,newsNo);
	}
	
	//공지사항 작성페이지
	
}
