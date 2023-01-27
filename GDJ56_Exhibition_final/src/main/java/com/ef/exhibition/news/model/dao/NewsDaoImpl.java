package com.ef.exhibition.news.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ef.exhibition.news.model.vo.Attachment;
import com.ef.exhibition.news.model.vo.News;

@Repository
public class NewsDaoImpl implements NewsDao{
	
	//공지사항 메인 페이징처리
	@Override
	public List<News> selectNewsList(SqlSessionTemplate session,Map<String,Integer> page){
		return session.selectList("news.selectNewsList",null
				,new RowBounds(
						(page.get("cPage")-1)*page.get("numPerpage"),
						page.get("numPerpage")));
	}
	
	//공지사항 메인 페이징처리
	@Override
	public int selectNewsCount(SqlSessionTemplate session) {
		return session.selectOne("news.selectNewsCount");
	}
	
	//공지사항 상세페이지
	@Override
	public News selectNews(SqlSessionTemplate session, int newsNo) {
		return session.selectOne("news.selectNews",newsNo);
	}
	//공지사항 등록
	@Override
	public int insertNews(SqlSessionTemplate session, News n) {
		return session.insert("news.insertNews",n);
	}
	
	//공지사항 Attachment
	@Override
	public int insertAttachment(SqlSessionTemplate session, Attachment attachment) {
		return session.insert("news.insertAttachment", attachment);
	}

	//공지사항 삭제
	@Override
	public int deleteNews(SqlSessionTemplate session, int newsNo) {
		return session.delete("news.deleteNews", newsNo);
	}
	
	
	
}
