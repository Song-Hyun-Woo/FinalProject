package com.ef.exhibition.question.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ef.exhibition.question.model.service.QuestionService;
import com.ef.exhibition.question.model.vo.Question;

@Repository
public class QuestionDaoImpl implements QuestionDao {
	
	@Override
	public List<Question> selectQuestionList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("question.selectQuestionList");
	}

	@Override
	public List<Question> selectQuestionListPage(SqlSessionTemplate session,Map param) {
		// TODO Auto-generated method stub
		int offSet=(int)param.get("cPage");
		int limit=(int)param.get("numPerpage");
		
		return session.selectList("question.selectQuestionList",null,new RowBounds((offSet-1)*limit,limit));
	}

	@Override
	public int selectQuestionCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("question.selectQuestionCount");
	}
	
	@Override
	public int insertQuestion(SqlSessionTemplate session, Question q) {
		// TODO Auto-generated method stub
		return session.insert("question.insertQuestion",q);
	}
	
	
	@Override
	public Question selectQuestion(SqlSessionTemplate session,int no) {
		// TODO Auto-generated method stub
		return session.selectOne("question.selectQuestion",no);
	}
	

}
