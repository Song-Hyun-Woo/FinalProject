package com.ef.exhibition.question.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ef.exhibition.news.model.dao.NewsDao;
import com.ef.exhibition.question.model.dao.QuestionDao;
import com.ef.exhibition.question.model.vo.Question;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private SqlSessionTemplate session;
	private QuestionDao dao;
	
	@Autowired
	public QuestionServiceImpl(QuestionDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}
	
	
	
	@Override
	public List<Question> selectQuestionList() {
		return dao.selectQuestionList(session);
	}

	@Override
	public List<Question> selectQuestionListPage(Map param) {
		// TODO Auto-generated method stub
		return dao.selectQuestionListPage(session, param);
	}


	@Override
	public int selectQuestionCount() {
		// TODO Auto-generated method stub
		return dao.selectQuestionCount(session);
	}
	
	@Override
	//@Transactional은 트렌젝션처리할 메소드 선언부에 설정
	@Transactional
	public int insertQuestion(Question q) throws RuntimeException{
		int result=0;
		try {
			result=dao.insertQuestion(session,q);

		}catch(RuntimeException e) {
			throw new RuntimeException("입력실패");
		}
		return result;
	}
	
	@Override
	public Question selectQuestion(int no) {
		// TODO Auto-generated method stub
		return dao.selectQuestion(session,no);
	}
}
